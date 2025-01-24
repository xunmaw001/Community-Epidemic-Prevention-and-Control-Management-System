package com.dao;

import com.entity.SheguanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.SheguanView;

/**
 * 社管员 Dao 接口
 *
 * @author 
 */
public interface SheguanDao extends BaseMapper<SheguanEntity> {

   List<SheguanView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
