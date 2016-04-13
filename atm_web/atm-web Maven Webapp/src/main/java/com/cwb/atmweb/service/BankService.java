package com.cwb.atmweb.service;

import java.util.List;

import com.cwb.atmweb.entity.Bank;
import com.cwb.atmweb.entity.City;

public interface BankService {
	int deleteByPrimaryKey(Long id);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Long id);
    
    List<Bank> selectAll();
    
    List<City> getCityByCode(String pCode);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);
}
