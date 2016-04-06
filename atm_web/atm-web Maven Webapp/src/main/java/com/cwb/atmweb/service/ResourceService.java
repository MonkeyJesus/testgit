package com.cwb.atmweb.service;

import java.util.List;
import java.util.Set;

import com.cwb.atmweb.entity.Resource;
import com.cwb.atmweb.entity.ResourceInfo;


public interface ResourceService {
	int deleteByPrimaryKey(Long id);

	int insert(Resource record);

	int insertSelective(Resource record);

	Resource selectByPrimaryKey(Long id);
	
	List<Resource> selectAll();
	
	List<Resource> selectByParentId(Long parentId);
	
	List<ResourceInfo> getResourceInfos(String username);
	
	Set<String> getPermissions(String username);

	int updateByPrimaryKeySelective(Resource record);

	int updateByPrimaryKey(Resource record);
}
