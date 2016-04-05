package com.cwb.atmweb.dao;

import com.cwb.atmweb.entity.AtmInfo;

public interface AtmInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AtmInfo record);

    int insertSelective(AtmInfo record);

    AtmInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AtmInfo record);

    int updateByPrimaryKey(AtmInfo record);
}