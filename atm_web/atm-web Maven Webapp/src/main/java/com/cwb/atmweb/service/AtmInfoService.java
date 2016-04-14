package com.cwb.atmweb.service;

import com.cwb.atmweb.entity.AtmInfo;

public interface AtmInfoService {
	int deleteByPrimaryKey(Long id);

	int insert(AtmInfo record);

	int insertSelective(AtmInfo record);

	AtmInfo selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(AtmInfo record);

	int updateByPrimaryKey(AtmInfo record);
}
