package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ZhishikuEntity;
import java.util.Map;

/**
 * 知识库 服务类
 * @author 
 * @since 2021-03-12
 */
public interface ZhishikuService extends IService<ZhishikuEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);

}