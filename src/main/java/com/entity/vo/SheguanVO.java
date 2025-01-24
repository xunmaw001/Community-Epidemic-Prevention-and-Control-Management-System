package com.entity.vo;

import com.entity.SheguanEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 社管员
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("sheguan")
public class SheguanVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 账户
     */

    @TableField(value = "username")
    private String username;


    /**
     * 密码
     */

    @TableField(value = "password")
    private String password;


    /**
     * 用户姓名
     */

    @TableField(value = "sheguan_name")
    private String sheguanName;


    /**
     * 用户手机号
     */

    @TableField(value = "sheguan_phone")
    private String sheguanPhone;


    /**
     * 用户身份证号
     */

    @TableField(value = "sheguan_id_number")
    private String sheguanIdNumber;


    /**
     * 用户头像
     */

    @TableField(value = "sheguan_photo")
    private String sheguanPhoto;


    /**
     * 性别
     */

    @TableField(value = "sex_types")
    private Integer sexTypes;


    /**
     * 用户邮箱
     */

    @TableField(value = "sheguan_email")
    private String sheguanEmail;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：账户
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 获取：账户
	 */

    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 设置：密码
	 */
    public String getPassword() {
        return password;
    }


    /**
	 * 获取：密码
	 */

    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 设置：用户姓名
	 */
    public String getSheguanName() {
        return sheguanName;
    }


    /**
	 * 获取：用户姓名
	 */

    public void setSheguanName(String sheguanName) {
        this.sheguanName = sheguanName;
    }
    /**
	 * 设置：用户手机号
	 */
    public String getSheguanPhone() {
        return sheguanPhone;
    }


    /**
	 * 获取：用户手机号
	 */

    public void setSheguanPhone(String sheguanPhone) {
        this.sheguanPhone = sheguanPhone;
    }
    /**
	 * 设置：用户身份证号
	 */
    public String getSheguanIdNumber() {
        return sheguanIdNumber;
    }


    /**
	 * 获取：用户身份证号
	 */

    public void setSheguanIdNumber(String sheguanIdNumber) {
        this.sheguanIdNumber = sheguanIdNumber;
    }
    /**
	 * 设置：用户头像
	 */
    public String getSheguanPhoto() {
        return sheguanPhoto;
    }


    /**
	 * 获取：用户头像
	 */

    public void setSheguanPhoto(String sheguanPhoto) {
        this.sheguanPhoto = sheguanPhoto;
    }
    /**
	 * 设置：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 获取：性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 设置：用户邮箱
	 */
    public String getSheguanEmail() {
        return sheguanEmail;
    }


    /**
	 * 获取：用户邮箱
	 */

    public void setSheguanEmail(String sheguanEmail) {
        this.sheguanEmail = sheguanEmail;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
