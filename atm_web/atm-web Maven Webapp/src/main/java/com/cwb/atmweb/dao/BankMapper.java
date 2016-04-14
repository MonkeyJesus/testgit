package com.cwb.atmweb.dao;

import java.util.List;
import java.util.Map;

import com.cwb.atmweb.entity.Bank;
import com.cwb.atmweb.entity.City;

public interface BankMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Long id);
    
    List<Bank> selectAll(Map<String, Object> condition);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);
    
    List<City> getCityByCode(String parentId);
}