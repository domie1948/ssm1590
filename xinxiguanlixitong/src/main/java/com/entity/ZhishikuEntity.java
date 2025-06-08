package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 知识库
 *
 * @author 
 * @email
 * @date 2021-03-12
 */
@TableName("zhishiku")
public class ZhishikuEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public ZhishikuEntity() {

	}

	public ZhishikuEntity(T t) {
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
    @TableField(value = "id")

    private Integer id;


    /**
     * 知识文件名
     */
    @TableField(value = "zhishi_name")

    private String zhishiName;


    /**
     * 知识类型
     */
    @TableField(value = "zhishi_types")

    private Integer zhishiTypes;


    /**
     * 文件简介
     */
    @TableField(value = "zhishi_content")

    private String zhishiContent;


    /**
     * 知识文件
     */
    @TableField(value = "zhishi_file")

    private String zhishiFile;


    /**
     * 上传时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

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
	 * 设置：知识文件名
	 */
    public String getZhishiName() {
        return zhishiName;
    }


    /**
	 * 获取：知识文件名
	 */

    public void setZhishiName(String zhishiName) {
        this.zhishiName = zhishiName;
    }
    /**
	 * 设置：知识类型
	 */
    public Integer getZhishiTypes() {
        return zhishiTypes;
    }


    /**
	 * 获取：知识类型
	 */

    public void setZhishiTypes(Integer zhishiTypes) {
        this.zhishiTypes = zhishiTypes;
    }
    /**
	 * 设置：文件简介
	 */
    public String getZhishiContent() {
        return zhishiContent;
    }


    /**
	 * 获取：文件简介
	 */

    public void setZhishiContent(String zhishiContent) {
        this.zhishiContent = zhishiContent;
    }
    /**
	 * 设置：知识文件
	 */
    public String getZhishiFile() {
        return zhishiFile;
    }


    /**
	 * 获取：知识文件
	 */

    public void setZhishiFile(String zhishiFile) {
        this.zhishiFile = zhishiFile;
    }
    /**
	 * 设置：上传时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：上传时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
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

    @Override
    public String toString() {
        return "Zhishiku{" +
            "id=" + id +
            ", zhishiName=" + zhishiName +
            ", zhishiTypes=" + zhishiTypes +
            ", zhishiContent=" + zhishiContent +
            ", zhishiFile=" + zhishiFile +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
