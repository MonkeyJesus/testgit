package com.cwb.atmweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.AtmInfoMapper;
import com.cwb.atmweb.entity.AtmInfo;
import com.cwb.atmweb.service.AtmInfoService;

@Service
public class AtmInfoServiceImpl implements AtmInfoService{

	@Autowired
	private AtmInfoMapper atmInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return atmInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(AtmInfo record) {
		return atmInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(AtmInfo record) {
		return atmInfoMapper.insertSelective(record);
	}

	@Override
	public AtmInfo selectByPrimaryKey(Long id) {
		return atmInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(AtmInfo record) {
		return atmInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AtmInfo record) {
		return atmInfoMapper.updateByPrimaryKey(record);
	}

}
