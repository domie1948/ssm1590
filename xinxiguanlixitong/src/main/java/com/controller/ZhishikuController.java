package com.controller;


import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.StringUtil;
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

import com.entity.ZhishikuEntity;

import com.service.ZhishikuService;
import com.entity.view.ZhishikuView;
import com.utils.PageUtils;
import com.utils.R;

/**
 * 知识库
 * 后端接口
 * @author
 * @email
 * @date 2021-03-12
*/
@RestController
@Controller
@RequestMapping("/zhishiku")
public class ZhishikuController {
    private static final Logger logger = LoggerFactory.getLogger(ZhishikuController.class);

    @Autowired
    private ZhishikuService zhishikuService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;


    //级联表service


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(StringUtil.isNotEmpty(role) && "用户".equals(role)){
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        }
        PageUtils page = zhishikuService.queryPage(params);

        //字典表数据转换
        List<ZhishikuView> list =(List<ZhishikuView>)page.getList();
        for(ZhishikuView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c);
        }
        return R.ok().put("data", page);
    }
    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        ZhishikuEntity zhishiku = zhishikuService.selectById(id);
        if(zhishiku !=null){
            //entity转view
            ZhishikuView view = new ZhishikuView();
            BeanUtils.copyProperties( zhishiku , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody ZhishikuEntity zhishiku, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,zhishiku:{}",this.getClass().getName(),zhishiku.toString());
        Wrapper<ZhishikuEntity> queryWrapper = new EntityWrapper<ZhishikuEntity>()
            .eq("zhishi_name", zhishiku.getZhishiName())
            .eq("zhishi_types", zhishiku.getZhishiTypes())
            .eq("zhishi_content", zhishiku.getZhishiContent())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ZhishikuEntity zhishikuEntity = zhishikuService.selectOne(queryWrapper);
        if(zhishikuEntity==null){
            zhishiku.setInsertTime(new Date());
            zhishiku.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      zhishiku.set
        //  }
            zhishikuService.insert(zhishiku);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody ZhishikuEntity zhishiku, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,zhishiku:{}",this.getClass().getName(),zhishiku.toString());
        //根据字段查询是否有相同数据
        Wrapper<ZhishikuEntity> queryWrapper = new EntityWrapper<ZhishikuEntity>()
            .notIn("id",zhishiku.getId())
            .eq("zhishi_name", zhishiku.getZhishiName())
            .eq("zhishi_types", zhishiku.getZhishiTypes())
            .eq("zhishi_content", zhishiku.getZhishiContent())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ZhishikuEntity zhishikuEntity = zhishikuService.selectOne(queryWrapper);
        if("".equals(zhishiku.getZhishiFile()) || "null".equals(zhishiku.getZhishiFile())){
                zhishiku.setZhishiFile(null);
        }
        if(zhishikuEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      zhishiku.set
            //  }
            zhishikuService.updateById(zhishiku);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }


    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        zhishikuService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}

