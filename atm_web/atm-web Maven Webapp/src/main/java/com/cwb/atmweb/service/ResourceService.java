package com.cwb.atmweb.service;

import java.util.List;

import com.cwb.atmweb.entity.Resource;


public interface ResourceService {
	int deleteByPrimaryKey(Long id);

	int insert(Resource record);

	int insertSelective(Resource record);

	Resource selectByPrimaryKey(Long id);
	
	List<Resource> selectAll();
	
	List<Resource> selectByParentId(Long parentId);

	int updateByPrimaryKeySelective(Resource record);

	int updateByPrimaryKey(Resource record);
}
