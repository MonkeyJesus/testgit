package com.cwb.atmweb.dao;

import com.cwb.atmweb.entity.Logoperater;

public interface LogoperaterMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Logoperater record);

    int insertSelective(Logoperater record);

    Logoperater selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Logoperater record);

    int updateByPrimaryKeyWithBLOBs(Logoperater record);

    int updateByPrimaryKey(Logoperater record);
}