package com.cwb.atmweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.ResourceMapper;
import com.cwb.atmweb.entity.Resource;
import com.cwb.atmweb.service.ResourceService;


@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired 
	private ResourceMapper resourceMapper;
	
	public int deleteByPrimaryKey(Long id) {
		return resourceMapper.deleteByPrimaryKey(id);
	}

	public int insert(Resource record) {
		return resourceMapper.insert(record);
	}

	public int insertSelective(Resource record) {
		return resourceMapper.insertSelective(record);
	}

	public Resource selectByPrimaryKey(Long id) {
		return resourceMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Resource record) {
		return resourceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Resource record) {
		return resourceMapper.updateByPrimaryKey(record);
	}

	public List<Resource> selectAll() {
		return resourceMapper.selectAll();
	}

	@Override
	public List<Resource> selectByParentId(Long parentId) {
		return resourceMapper.selectByParentId(parentId);
	}

}
