package com.entity.model;

import com.entity.SheguanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 社管员
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class SheguanModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 账户
     */
    private String username;


    /**
     * 密码
     */
    private String password;


    /**
     * 用户姓名
     */
    private String sheguanName;


    /**
     * 用户手机号
     */
    private String sheguanPhone;


    /**
     * 用户身份证号
     */
    private String sheguanIdNumber;


    /**
     * 用户头像
     */
    private String sheguanPhoto;


    /**
     * 性别
     */
    private Integer sexTypes;


    /**
     * 用户邮箱
     */
    private String sheguanEmail;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：账户
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 设置：账户
	 */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 获取：密码
	 */
    public String getPassword() {
        return password;
    }


    /**
	 * 设置：密码
	 */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 获取：用户姓名
	 */
    public String getSheguanName() {
        return sheguanName;
    }


    /**
	 * 设置：用户姓名
	 */
    public void setSheguanName(String sheguanName) {
        this.sheguanName = sheguanName;
    }
    /**
	 * 获取：用户手机号
	 */
    public String getSheguanPhone() {
        return sheguanPhone;
    }


    /**
	 * 设置：用户手机号
	 */
    public void setSheguanPhone(String sheguanPhone) {
        this.sheguanPhone = sheguanPhone;
    }
    /**
	 * 获取：用户身份证号
	 */
    public String getSheguanIdNumber() {
        return sheguanIdNumber;
    }


    /**
	 * 设置：用户身份证号
	 */
    public void setSheguanIdNumber(String sheguanIdNumber) {
        this.sheguanIdNumber = sheguanIdNumber;
    }
    /**
	 * 获取：用户头像
	 */
    public String getSheguanPhoto() {
        return sheguanPhoto;
    }


    /**
	 * 设置：用户头像
	 */
    public void setSheguanPhoto(String sheguanPhoto) {
        this.sheguanPhoto = sheguanPhoto;
    }
    /**
	 * 获取：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 设置：性别
	 */
    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 获取：用户邮箱
	 */
    public String getSheguanEmail() {
        return sheguanEmail;
    }


    /**
	 * 设置：用户邮箱
	 */
    public void setSheguanEmail(String sheguanEmail) {
        this.sheguanEmail = sheguanEmail;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
