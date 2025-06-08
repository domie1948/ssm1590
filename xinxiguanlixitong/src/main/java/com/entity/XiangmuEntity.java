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
 * 项目
 *
 * @author 
 * @email
 * @date 2021-03-12
 */
@TableName("xiangmu")
public class XiangmuEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public XiangmuEntity() {

	}

	public XiangmuEntity(T t) {
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
     * 项目负责人
     */
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 项目名
     */
    @TableField(value = "xiangmu_name")

    private String xiangmuName;


    /**
     * 项目类型
     */
    @TableField(value = "xiangmu_types")

    private Integer xiangmuTypes;


    /**
     * 项目进度
     */
    @TableField(value = "xiangmujindu_types")

    private Integer xiangmujinduTypes;


    /**
     * 项目详情
     */
    @TableField(value = "xiangmu_content")

    private String xiangmuContent;


    /**
     * 项目文件
     */
    @TableField(value = "xiangmu_file")

    private String xiangmuFile;


    /**
     * 项目开始时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 项目结束时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "update_time",fill = FieldFill.UPDATE)

    private Date updateTime;


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
	 * 设置：项目负责人
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：项目负责人
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：项目名
	 */
    public String getXiangmuName() {
        return xiangmuName;
    }


    /**
	 * 获取：项目名
	 */

    public void setXiangmuName(String xiangmuName) {
        this.xiangmuName = xiangmuName;
    }
    /**
	 * 设置：项目类型
	 */
    public Integer getXiangmuTypes() {
        return xiangmuTypes;
    }


    /**
	 * 获取：项目类型
	 */

    public void setXiangmuTypes(Integer xiangmuTypes) {
        this.xiangmuTypes = xiangmuTypes;
    }
    /**
	 * 设置：项目进度
	 */
    public Integer getXiangmujinduTypes() {
        return xiangmujinduTypes;
    }


    /**
	 * 获取：项目进度
	 */

    public void setXiangmujinduTypes(Integer xiangmujinduTypes) {
        this.xiangmujinduTypes = xiangmujinduTypes;
    }
    /**
	 * 设置：项目详情
	 */
    public String getXiangmuContent() {
        return xiangmuContent;
    }


    /**
	 * 获取：项目详情
	 */

    public void setXiangmuContent(String xiangmuContent) {
        this.xiangmuContent = xiangmuContent;
    }
    /**
	 * 设置：项目文件
	 */
    public String getXiangmuFile() {
        return xiangmuFile;
    }


    /**
	 * 获取：项目文件
	 */

    public void setXiangmuFile(String xiangmuFile) {
        this.xiangmuFile = xiangmuFile;
    }
    /**
	 * 设置：项目开始时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：项目开始时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：项目结束时间
	 */
    public Date getUpdateTime() {
        return updateTime;
    }


    /**
	 * 获取：项目结束时间
	 */

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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
        return "Xiangmu{" +
            "id=" + id +
            ", yonghuId=" + yonghuId +
            ", xiangmuName=" + xiangmuName +
            ", xiangmuTypes=" + xiangmuTypes +
            ", xiangmujinduTypes=" + xiangmujinduTypes +
            ", xiangmuContent=" + xiangmuContent +
            ", xiangmuFile=" + xiangmuFile +
            ", insertTime=" + insertTime +
            ", updateTime=" + updateTime +
            ", createTime=" + createTime +
        "}";
    }
}
