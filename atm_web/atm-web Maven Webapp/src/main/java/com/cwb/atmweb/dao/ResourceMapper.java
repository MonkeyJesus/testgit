package com.cwb.atmweb.dao;

import java.util.List;

import com.cwb.atmweb.entity.Resource;


public interface ResourceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Long id);
    
    List<Resource> selectAll();
    
    List<Resource> selectByParentId(Long parentId);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);
}