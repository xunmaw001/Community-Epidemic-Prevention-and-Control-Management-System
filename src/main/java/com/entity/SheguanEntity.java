package com.entity;

import com.annotation.ColumnInfo;
import javax.validation.constraints.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.*;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.utils.DateUtil;


/**
 * 社管员
 *
 * @author 
 * @email
 */
@TableName("sheguan")
public class SheguanEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public SheguanEntity() {

	}

	public SheguanEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ColumnInfo(comment="主键",type="int(11)")
    @TableField(value = "id")

    private Integer id;


    /**
     * 账户
     */
    @ColumnInfo(comment="账户",type="varchar(200)")
    @TableField(value = "username")

    private String username;


    /**
     * 密码
     */
    @ColumnInfo(comment="密码",type="varchar(200)")
    @TableField(value = "password")

    private String password;


    /**
     * 用户姓名
     */
    @ColumnInfo(comment="用户姓名",type="varchar(200)")
    @TableField(value = "sheguan_name")

    private String sheguanName;


    /**
     * 用户手机号
     */
    @ColumnInfo(comment="用户手机号",type="varchar(200)")
    @TableField(value = "sheguan_phone")

    private String sheguanPhone;


    /**
     * 用户身份证号
     */
    @ColumnInfo(comment="用户身份证号",type="varchar(200)")
    @TableField(value = "sheguan_id_number")

    private String sheguanIdNumber;


    /**
     * 用户头像
     */
    @ColumnInfo(comment="用户头像",type="varchar(200)")
    @TableField(value = "sheguan_photo")

    private String sheguanPhoto;


    /**
     * 性别
     */
    @ColumnInfo(comment="性别",type="int(11)")
    @TableField(value = "sex_types")

    private Integer sexTypes;


    /**
     * 用户邮箱
     */
    @ColumnInfo(comment="用户邮箱",type="varchar(200)")
    @TableField(value = "sheguan_email")

    private String sheguanEmail;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="创建时间",type="timestamp")
    @TableField(value = "create_time",fill = FieldFill.INSERT)

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

    @Override
    public String toString() {
        return "Sheguan{" +
            ", id=" + id +
            ", username=" + username +
            ", password=" + password +
            ", sheguanName=" + sheguanName +
            ", sheguanPhone=" + sheguanPhone +
            ", sheguanIdNumber=" + sheguanIdNumber +
            ", sheguanPhoto=" + sheguanPhoto +
            ", sexTypes=" + sexTypes +
            ", sheguanEmail=" + sheguanEmail +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
