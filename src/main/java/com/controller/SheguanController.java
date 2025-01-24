
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 社管员
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/sheguan")
public class SheguanController {
    private static final Logger logger = LoggerFactory.getLogger(SheguanController.class);

    private static final String TABLE_NAME = "sheguan";

    @Autowired
    private SheguanService sheguanService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private DakaService dakaService;//隔离信息管理
    @Autowired
    private DictionaryService dictionaryService;//字典
    @Autowired
    private FengkongService fengkongService;//高风险地区记录
    @Autowired
    private ForumService forumService;//论坛
    @Autowired
    private GonggaoService gonggaoService;//公告
    @Autowired
    private WangfanYuyueService wangfanYuyueService;//出入管理
    @Autowired
    private YonghuService yonghuService;//用户
    @Autowired
    private UsersService usersService;//管理员


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("社管员".equals(role))
            params.put("sheguanId",request.getSession().getAttribute("userId"));
        CommonUtil.checkMap(params);
        PageUtils page = sheguanService.queryPage(params);

        //字典表数据转换
        List<SheguanView> list =(List<SheguanView>)page.getList();
        for(SheguanView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        SheguanEntity sheguan = sheguanService.selectById(id);
        if(sheguan !=null){
            //entity转view
            SheguanView view = new SheguanView();
            BeanUtils.copyProperties( sheguan , view );//把实体数据重构到view中
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody SheguanEntity sheguan, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,sheguan:{}",this.getClass().getName(),sheguan.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<SheguanEntity> queryWrapper = new EntityWrapper<SheguanEntity>()
            .eq("username", sheguan.getUsername())
            .or()
            .eq("sheguan_phone", sheguan.getSheguanPhone())
            .or()
            .eq("sheguan_id_number", sheguan.getSheguanIdNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        SheguanEntity sheguanEntity = sheguanService.selectOne(queryWrapper);
        if(sheguanEntity==null){
            sheguan.setCreateTime(new Date());
            sheguan.setPassword("123456");
            sheguanService.insert(sheguan);
            return R.ok();
        }else {
            return R.error(511,"账户或者用户手机号或者用户身份证号已经被使用");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody SheguanEntity sheguan, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,sheguan:{}",this.getClass().getName(),sheguan.toString());
        SheguanEntity oldSheguanEntity = sheguanService.selectById(sheguan.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        if("".equals(sheguan.getSheguanPhoto()) || "null".equals(sheguan.getSheguanPhoto())){
                sheguan.setSheguanPhoto(null);
        }

            sheguanService.updateById(sheguan);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<SheguanEntity> oldSheguanList =sheguanService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        sheguanService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<SheguanEntity> sheguanList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("../../upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            SheguanEntity sheguanEntity = new SheguanEntity();
//                            sheguanEntity.setUsername(data.get(0));                    //账户 要改的
//                            //sheguanEntity.setPassword("123456");//密码
//                            sheguanEntity.setSheguanName(data.get(0));                    //用户姓名 要改的
//                            sheguanEntity.setSheguanPhone(data.get(0));                    //用户手机号 要改的
//                            sheguanEntity.setSheguanIdNumber(data.get(0));                    //用户身份证号 要改的
//                            sheguanEntity.setSheguanPhoto("");//详情和图片
//                            sheguanEntity.setSexTypes(Integer.valueOf(data.get(0)));   //性别 要改的
//                            sheguanEntity.setSheguanEmail(data.get(0));                    //用户邮箱 要改的
//                            sheguanEntity.setCreateTime(date);//时间
                            sheguanList.add(sheguanEntity);


                            //把要查询是否重复的字段放入map中
                                //账户
                                if(seachFields.containsKey("username")){
                                    List<String> username = seachFields.get("username");
                                    username.add(data.get(0));//要改的
                                }else{
                                    List<String> username = new ArrayList<>();
                                    username.add(data.get(0));//要改的
                                    seachFields.put("username",username);
                                }
                                //用户手机号
                                if(seachFields.containsKey("sheguanPhone")){
                                    List<String> sheguanPhone = seachFields.get("sheguanPhone");
                                    sheguanPhone.add(data.get(0));//要改的
                                }else{
                                    List<String> sheguanPhone = new ArrayList<>();
                                    sheguanPhone.add(data.get(0));//要改的
                                    seachFields.put("sheguanPhone",sheguanPhone);
                                }
                                //用户身份证号
                                if(seachFields.containsKey("sheguanIdNumber")){
                                    List<String> sheguanIdNumber = seachFields.get("sheguanIdNumber");
                                    sheguanIdNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> sheguanIdNumber = new ArrayList<>();
                                    sheguanIdNumber.add(data.get(0));//要改的
                                    seachFields.put("sheguanIdNumber",sheguanIdNumber);
                                }
                        }

                        //查询是否重复
                         //账户
                        List<SheguanEntity> sheguanEntities_username = sheguanService.selectList(new EntityWrapper<SheguanEntity>().in("username", seachFields.get("username")));
                        if(sheguanEntities_username.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(SheguanEntity s:sheguanEntities_username){
                                repeatFields.add(s.getUsername());
                            }
                            return R.error(511,"数据库的该表中的 [账户] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //用户手机号
                        List<SheguanEntity> sheguanEntities_sheguanPhone = sheguanService.selectList(new EntityWrapper<SheguanEntity>().in("sheguan_phone", seachFields.get("sheguanPhone")));
                        if(sheguanEntities_sheguanPhone.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(SheguanEntity s:sheguanEntities_sheguanPhone){
                                repeatFields.add(s.getSheguanPhone());
                            }
                            return R.error(511,"数据库的该表中的 [用户手机号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //用户身份证号
                        List<SheguanEntity> sheguanEntities_sheguanIdNumber = sheguanService.selectList(new EntityWrapper<SheguanEntity>().in("sheguan_id_number", seachFields.get("sheguanIdNumber")));
                        if(sheguanEntities_sheguanIdNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(SheguanEntity s:sheguanEntities_sheguanIdNumber){
                                repeatFields.add(s.getSheguanIdNumber());
                            }
                            return R.error(511,"数据库的该表中的 [用户身份证号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        sheguanService.insertBatch(sheguanList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }

    /**
    * 登录
    */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        SheguanEntity sheguan = sheguanService.selectOne(new EntityWrapper<SheguanEntity>().eq("username", username));
        if(sheguan==null || !sheguan.getPassword().equals(password))
            return R.error("账号或密码不正确");
        String token = tokenService.generateToken(sheguan.getId(),username, "sheguan", "社管员");
        R r = R.ok();
        r.put("token", token);
        r.put("role","社管员");
        r.put("username",sheguan.getSheguanName());
        r.put("tableName","sheguan");
        r.put("userId",sheguan.getId());
        return r;
    }

    /**
    * 注册
    */
    @IgnoreAuth
    @PostMapping(value = "/register")
    public R register(@RequestBody SheguanEntity sheguan, HttpServletRequest request) {
//    	ValidatorUtils.validateEntity(user);
        Wrapper<SheguanEntity> queryWrapper = new EntityWrapper<SheguanEntity>()
            .eq("username", sheguan.getUsername())
            .or()
            .eq("sheguan_phone", sheguan.getSheguanPhone())
            .or()
            .eq("sheguan_id_number", sheguan.getSheguanIdNumber())
            ;
        SheguanEntity sheguanEntity = sheguanService.selectOne(queryWrapper);
        if(sheguanEntity != null)
            return R.error("账户或者用户手机号或者用户身份证号已经被使用");
        sheguan.setCreateTime(new Date());
        sheguanService.insert(sheguan);

        return R.ok();
    }

    /**
     * 重置密码
     */
    @GetMapping(value = "/resetPassword")
    public R resetPassword(Integer  id, HttpServletRequest request) {
        SheguanEntity sheguan = sheguanService.selectById(id);
        sheguan.setPassword("123456");
        sheguanService.updateById(sheguan);
        return R.ok();
    }

	/**
	 * 修改密码
	 */
	@GetMapping(value = "/updatePassword")
	public R updatePassword(String  oldPassword, String  newPassword, HttpServletRequest request) {
        SheguanEntity sheguan = sheguanService.selectById((Integer)request.getSession().getAttribute("userId"));
		if(newPassword == null){
			return R.error("新密码不能为空") ;
		}
		if(!oldPassword.equals(sheguan.getPassword())){
			return R.error("原密码输入错误");
		}
		if(newPassword.equals(sheguan.getPassword())){
			return R.error("新密码不能和原密码一致") ;
		}
        sheguan.setPassword(newPassword);
		sheguanService.updateById(sheguan);
		return R.ok();
	}



    /**
     * 忘记密码
     */
    @IgnoreAuth
    @RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request) {
        SheguanEntity sheguan = sheguanService.selectOne(new EntityWrapper<SheguanEntity>().eq("username", username));
        if(sheguan!=null){
            sheguan.setPassword("123456");
            sheguanService.updateById(sheguan);
            return R.ok();
        }else{
           return R.error("账号不存在");
        }
    }


    /**
    * 获取用户的session用户信息
    */
    @RequestMapping("/session")
    public R getCurrSheguan(HttpServletRequest request){
        Integer id = (Integer)request.getSession().getAttribute("userId");
        SheguanEntity sheguan = sheguanService.selectById(id);
        if(sheguan !=null){
            //entity转view
            SheguanView view = new SheguanView();
            BeanUtils.copyProperties( sheguan , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }
    }


    /**
    * 退出
    */
    @GetMapping(value = "logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
    }



    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = sheguanService.queryPage(params);

        //字典表数据转换
        List<SheguanView> list =(List<SheguanView>)page.getList();
        for(SheguanView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        SheguanEntity sheguan = sheguanService.selectById(id);
            if(sheguan !=null){


                //entity转view
                SheguanView view = new SheguanView();
                BeanUtils.copyProperties( sheguan , view );//把实体数据重构到view中

                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody SheguanEntity sheguan, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,sheguan:{}",this.getClass().getName(),sheguan.toString());
        Wrapper<SheguanEntity> queryWrapper = new EntityWrapper<SheguanEntity>()
            .eq("username", sheguan.getUsername())
            .or()
            .eq("sheguan_phone", sheguan.getSheguanPhone())
            .or()
            .eq("sheguan_id_number", sheguan.getSheguanIdNumber())
//            .notIn("sheguan_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        SheguanEntity sheguanEntity = sheguanService.selectOne(queryWrapper);
        if(sheguanEntity==null){
            sheguan.setCreateTime(new Date());
            sheguan.setPassword("123456");
        sheguanService.insert(sheguan);

            return R.ok();
        }else {
            return R.error(511,"账户或者用户手机号或者用户身份证号已经被使用");
        }
    }

}

