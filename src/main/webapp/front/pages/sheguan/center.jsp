<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!-- 个人中心 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人中心</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 引入element样式 -->
    <link rel="stylesheet" href="../../xznstatic/css/element.min.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
</head>
<style>
    html::after {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        content: '';
        display: block;
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
        z-index: -1;
    }

    /*小菜单*/
.prolist .left_nav {
        background: #fff;
        width: 220px;
    }
    .prolist .left_nav .dlx1 {
        padding: 15px 0;
        padding-left: 20px;
        background: var(--publicMainColor);
        color: #fff;
    }
    .prolist .left_nav .dlx1 dt {
        font-size: 22px;
        font-weight: bold;
    }
    .prolist .left_nav .dlx1 dd {
        padding-top: 5px;
        font-size: 14px;
        font-weight: 200;
    }
    .prolist .left_nav .dlx2 {
        padding: 15px 0;
        padding-left: 20px;
        background: var(--publicMainColor);
        color: #fff;
    }
    .prolist .left_nav .dlx2 dt {
        font-size: 14px;
    }
    .prolist .left_nav .dlx2 dd {
        padding-top: 5px;
        font-size: 22px;
        color:  var(--publicSubColor);
        font-family: impact;
    }
    .prolist .left_nav ul {
        padding: 20px;
    }
    .prolist .left_nav ul li {
        display: block;
        margin-bottom: 15px;
    }
    .prolist .left_nav ul li:last-child {
        margin-bottom: 0;
    }
    .prolist .left_nav ul li {
        background-color: var(--publicSubColor);
        display: block;
        border: 1px solid #ddd;
        padding: 15px 10px;
        color: #666;
        font-size: 12px;
    }
    .prolist .left_nav ul li i {
        color:  var(--publicMainColor);
        margin-right: 10px;
    }
    .prolist .left_nav ul li:hover {
        border: 1px solid var(--publicMainColor);
        background: var(--publicMainColor);
        color: #fff;
    }
    .prolist .left_nav ul li:hover i {
        color: var(--publicSubColor);
    }
    .onclickbiaoqian{
        color: #fff !important;
        background-color: var(--publicMainColor) !important;
    }
    .onclickbiaoqian i{
        color:  var(--publicSubColor) !important;
    }
    /*信息样式*/
    .center-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        text-align: left;
        display: flex;
        margin-bottom: 20px;
    }
    .right-container {
        position: relative;
    }
    .right-container .layui-form-item {
        display: flex;
        align-items: center;
    }
    .right-container .layui-input-block {
        margin: 0;
        flex: 1;
    }
    .right-container .input .layui-input {
        padding: 0 12px;
        height: 40px;
        font-size: 15px;
        border-radius: 4px;
        border-width: 1px;
        border-style: solid;
        background-color: #fff;
        text-align: left;
    }
    .right-container .select .layui-input {
        padding: 0 12px;
        height: 40px;
        font-size: 15px;
        border-radius: 4px;
        border-width: 1px;
        border-style: solid;
        background-color: #fff;
        text-align: left;
    }
    .right-container .date .layui-input {
        padding: 0 12px;
        height: 40px;
        font-size: 15px;
        color: rgba(160, 67, 26, 1);
        border-radius: 4px;
        border-width: 1px;
        border-style: solid;
        background-color: #fff;
        box-shadow: 0 0 0px rgba(255,0,0,.8);
        text-align: left;
    }

</style>
<body class='bodyClass'>
    <div id="app">
        <!-- 标题 -->
        <div class="center-container">
            <!-- 个人中心菜单 config.js-->
<div class="prolist">
    <div class="left_nav">
        <dl class="dlx1">
            <dt>个人中心</dt>
            <dd>USER / CENTER</dd>
        </dl>
        <ul>
            <li  v-for="(item,index) in centerMenu" v-bind:key="index" @click="jump(item.url)"
                 :class="index==0?'onclickbiaoqian':''"><i class="layui-icon">&#xe6b1;</i>{{item.name}}</li>
        </ul>
    </div>
</div>            <!-- 个人中心菜单 -->
            <!-- 个人中心 -->
            <div class="right-container sub_borderColor" :style='{"backgroundColor":"#fff","padding":"20px","boxShadow":"0px rgba(255,0,0,.8)","margin":"0","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid","width":"80%"}'>
                <form class="layui-form"  v-if="!changePassword">
                    <!-- 主键 -->
                    <input type="hidden" v-model="detail.id" name="id" id="id" />
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            账户
                        </label>
                        <div class="layui-input-block input">
                            <input type="text" v-model="detail.username" name="username" id="username" lay-verify="required" placeholder="账户" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            用户姓名
                        </label>
                        <div class="layui-input-block input">
                            <input type="text" v-model="detail.sheguanName" name="sheguanName" id="sheguanName" lay-verify="required" placeholder="用户姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            用户手机号
                        </label>
                        <div class="layui-input-block input">
                            <input type="text" v-model="detail.sheguanPhone" name="sheguanPhone" id="sheguanPhone" lay-verify="required|phone" placeholder="用户手机号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            用户身份证号
                        </label>
                        <div class="layui-input-block input">
                            <input type="text" v-model="detail.sheguanIdNumber" name="sheguanIdNumber" id="sheguanIdNumber" lay-verify="required|identity" placeholder="用户身份证号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' style="opacity: 0;" class="layui-form-label">
                            用户头像
                        </label>
                        <div class="layui-input-block">
                            <img id="sheguanPhotoImg" style="width: 100px;height: 100px;border-radius: 50%;border: 2px solid #EEEEEE;" :style='{"boxShadow":"0 0 3px rgba(160, 67, 26, 1)","borderColor":"rgba(135, 206, 250, 1)","backgroundColor":"#fff","borderRadius":"10px","borderWidth":"1px","width":"80px","borderStyle":"solid","height":"80px"}' :src="baseUrl+detail.sheguanPhoto">
                            <input type="hidden" v-model="detail.sheguanPhoto" id="sheguanPhoto" name="sheguanPhoto" />
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' style="opacity: 0;" class="layui-form-label">
                            用户头像
                        </label>
                        <div class="layui-input-block">
                            <button class="main_backgroundColor" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"0 10px 0 0","borderColor":"#ccc","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="button" class="layui-btn btn-theme"
                                    id="sheguanPhotoUpload">
                                <i v-if="true" :style='{"color":"#fff","show":true,"fontSize":"14px"}' class="layui-icon">&#xe67c;</i>上传用户头像
                            </button>
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            性别
                        </label>
                        <div class="layui-input-block select">
                            <el-select v-model="detail.sexTypes" filterable placeholder="请选择性别" style="border-color: var(--publicMainColor, #808080);" name="sexTypes" id="sexTypes">
                                <el-option
                                        v-for="(item,index) in sexTypesList"
                                        v-bind:key="item.codeIndex"
                                        :label="item.indexName"
                                        :value="item.codeIndex">
                                </el-option>
                            </el-select>
                        </div>
                    </div>
                    <div class="layui-form-item main_borderColor"  :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                        <label  :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                            用户邮箱
                        </label>
                        <div class="layui-input-block input">
                            <input type="text" v-model="detail.sheguanEmail" name="sheguanEmail" id="sheguanEmail" lay-verify="required" placeholder="用户邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block" style="display: flex;flex-wrap:wrap;">
                            <button class="main_backgroundColor" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"10px auto 0","borderColor":"#ccc","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"30%","fontSize":"15px","borderStyle":"solid","height":"44px"}' class="layui-btn btn-submit btn-theme" lay-submit lay-filter="*">更新信息</button>
                            <button class="layui-btn" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"10px auto","borderColor":"#ccc","backgroundColor":"var(--publicSubColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","borderWidth":"0","width":"30%","fontSize":"14px","borderStyle":"solid","height":"44px"}' @click="xiugaimima()">修改密码</button>
                            <button :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"10px auto","borderColor":"#ccc","backgroundColor":"rgba(255, 0, 0, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","borderWidth":"0","width":"30%","fontSize":"14px","borderStyle":"solid","height":"44px"}' @click="logout" class="layui-btn btn-submit">退出登录</button>
                        </div>
                    </div>
                </form>
                <div v-if="changePassword"
                     style="width:780px;height: 100%;background-color: #fff;position: relative;top: 0px;left: 0px;">
                    <div style="width: 778px;margin: 10px auto;">
                        <div class="layui-form-item main_borderColor"
                             :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                            <label
                                    :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}'
                                    class="layui-form-label">
                                旧密码
                            </label>
                            <div class="layui-input-block input">
                                <input type="text" v-model="oldPassword" lay-verify="required|identity" placeholder="旧密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item main_borderColor"
                             :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                            <label
                                    :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}'
                                    class="layui-form-label">
                                新密码
                            </label>
                            <div class="layui-input-block input">
                                <input type="password" v-model="newPassword" lay-verify="required|identity" placeholder="新密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item main_borderColor"
                             :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"#fff","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                            <label
                                    :style='{"width":"110px","padding":"0 12px 0 0","fontSize":"15px","color":"#333","textAlign":"left"}'
                                    class="layui-form-label">
                                确认密码
                            </label>
                            <div class="layui-input-block input">
                                <input type="password" v-model="confirmPassword" lay-verify="required|identity" placeholder="确认密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div style="display: flex;">
                            <button class="main_backgroundColor"
                                    :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"10px auto 0","borderColor":"#ccc","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"30%","fontSize":"15px","borderStyle":"solid","height":"44px"}'
                                    class="layui-btn btn-theme" @click="back()">返回</button>
                            <button
                                    :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"10px auto","borderColor":"#ccc","backgroundColor":"rgba(255, 0, 0, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","borderWidth":"0","width":"30%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                                    class="layui-btn" @click="queren()">确定</button>
                        </div>
                    </div>

                </div>


            </div>
            <!-- 个人中心 -->
        </div>

    </div>

    <!-- layui -->
    <script src="../../layui/layui.js"></script>
    <!-- vue -->
    <script src="../../js/vue.js"></script>
    <!-- 引入element组件库 -->
    <script src="../../xznstatic/js/element.min.js"></script>
    <!-- 组件配置信息 -->
    <script src="../../js/config.js"></script>
    <!-- 扩展插件配置信息 -->
    <script src="../../modules/config.js"></script>
    <!-- 工具方法 -->
    <script src="../../js/utils.js"></script>
    <!-- 校验格式工具类 -->
    <script src="../../js/validate.js"></script>

    <script>
        var vue = new Vue({
            el: '#app',
            data: {
                //项目路径
                baseUrl:"",

                //修改密码
                changePassword:false,
                oldPassword:'',
                newPassword:'',
                confirmPassword:'',
                detail: {
                    username: '',
                    password: '',
                    sheguanName: '',
                    sheguanPhone: '',
                    sheguanIdNumber: '',
                    sheguanPhoto: '',
                    sexTypes: '',//数字
                    sexValue: '',//数字对应的值
                    sheguanEmail: '',
                    createTime: '',
                },
                sexTypesList: [],
                centerMenu: centerMenu
            },
            updated: function() {
                // layui.form.render(null, 'myForm');
            },
            methods: {
                xiugaimima() {
                    this.changePassword = true
                },
                back() {
                    this.changePassword = false
                },
                queren() {
                    // 提交代码
                    let _this=this;
                    if(_this.confirmPassword != _this.newPassword){
                        _this.$message.error("两次密码不一致");
                        return;
                    }
                    // if(_this.detail.password != _this.oldPassword){
                    //     _this.$message.error("原密码输入错误");
                    //     return;
                    // }
                    // if(_this.detail.password == _this.newPassword){
                    //     _this.$message.error("新密码不能和原密码一致");
                    //     return;
                    // }
                    _this.detail.password=_this.newPassword;//密码重新赋值
                    layui.http.request(`sheguan/updatePassword`, 'get', {
                        oldPassword:_this.oldPassword,
                        newPassword:_this.newPassword
                    }, function(res) {
                        _this.$message.success("修改密码成功,下次登录用新密码");
                        _this.oldPassword = null
                        _this.newPassword = null
                        _this.confirmPassword = null
                        _this.changePassword = false
                    });
                },
                jump(url) {
                    jump(url)
                },
                logout(){
                    localStorage.removeItem('Token');
                    localStorage.removeItem('role');
                    localStorage.removeItem('sessionTable');
                    localStorage.removeItem('adminName');
                    localStorage.removeItem('userid');
                    localStorage.removeItem('userTable');
                    localStorage.removeItem('iframeUrl');
                    window.parent.location.href = '../login/login.jsp';
                }
            }
        })

        layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'laydate', 'form', 'upload'], function() {
            var layer = layui.layer;
            var element = layui.element;
            var carousel = layui.carousel;
            var http = layui.http;
            var jquery = layui.jquery;
            var form = layui.form;
            var upload = layui.upload;
            vue.baseUrl = http.baseurl


            // 充值
            jquery('#btn-recharge').click(function(e) {
                layer.open({
                    type: 2,
                    title: '用户充值',
                    area: ['900px', '600px'],
                    content: '../recharge/recharge.jsp'
                });
            });

            // 查询字典表相关
            // 性别的查询和初始化
            sexTypesSelect();
            // 日期效验规则及格式
            dateTimePick();
            // 表单效验规则
            form.verify({
                // 正整数效验规则
                integer: [
                    /^[1-9][0-9]*$/
                    ,'必须是正整数'
                ]
                // 小数效验规则
                ,double: [
                    /^[0-9]{0,6}(\.[0-9]{1,2})?$/
                    ,'最大整数位为6为,小数最大两位'
                ]
            });


            // 上传 文件/图片
            // 用户头像的文件上传
            var sheguanPhotoUpload = upload.render({
                //绑定元素
                elem: '#sheguanPhotoUpload',
                //上传接口
                url: http.baseurl + 'file/upload',
                // 请求头
                headers: {
                    Token: localStorage.getItem('Token')
                },
                // 允许上传时校验的文件类型
                accept: 'images',
                before: function() {
                    //loading层
                    var index = layer.load(1, {
                        shade: [0.1, '#fff'] //0.1透明度的白色背景
                    });
                },
                // 上传成功
                done: function(res) {
                    console.log(res);
                    layer.closeAll();
                    if (res.code == 0) {
                        layer.msg("上传成功", {
                            time: 2000,
                            icon: 6
                        })
                        var url ='upload/' + res.file;
                        vue.detail.sheguanPhoto = url;
                    } else {
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 5
                        })
                    }
                },
                //请求异常回调
                error: function() {
                    layer.closeAll();
                    layer.msg("请求接口异常", {
                        time: 2000,
                        icon: 5
                    })
                }
            });
            // 查询用户信息
            let table = localStorage.getItem("userTable");

            if(!table){
                layer.msg('请先登录', {
                    time: 2000,
                    icon: 5
                }, function() {
                    window.parent.location.href = '../login/login.jsp';
                });
            }

            http.request(`sheguan/session`, 'get', {}, function(data) {
                // 表单赋值
                // form.val("myForm", data.data);
                vue.detail = data.data
                // 图片赋值
                //jquery("#sheguanPhotoImg").attr("src", data.data.sheguanPhoto);
            });

            // 提交表单
            form.on('submit(*)', function(data) {
                data = vue.detail;
                data['createTime']=jquery("#createTime").val();
                http.requestJson(table + '/update', 'post', data, function(res) {
                    layer.msg('修改成功', {
                        time: 2000,
                        icon: 6
                    }, function() {
                        window.location.reload();
                    });
                });
                return false
            });

        });

        // 日期框初始化
        function dateTimePick(){
        }




        //性别的查询
        function sexTypesSelect() {
            //填充下拉框选项
            layui.http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    vue.sexTypesList = res.data.list;
                }
            });
        }

    </script>
</body>
</html>
