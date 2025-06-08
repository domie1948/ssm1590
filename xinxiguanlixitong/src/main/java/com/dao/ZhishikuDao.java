package com.dao;

import com.entity.ZhishikuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ZhishikuView;

/**
 * 知识库 Dao 接口
 *
 * @author 
 * @since 2021-03-12
 */
public interface ZhishikuDao extends BaseMapper<ZhishikuEntity> {

   List<ZhishikuView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
