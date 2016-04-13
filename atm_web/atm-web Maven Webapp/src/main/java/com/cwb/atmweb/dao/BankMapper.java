package com.cwb.atmweb.dao;

import java.util.List;

import com.cwb.atmweb.entity.Bank;
import com.cwb.atmweb.entity.City;

public interface BankMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Long id);
    
    List<Bank> selectAll();

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);
    
    List<City> getCityByCode(String pCode);
}