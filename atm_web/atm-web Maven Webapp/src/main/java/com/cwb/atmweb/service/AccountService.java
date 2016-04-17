package com.cwb.atmweb.service;

import com.cwb.atmweb.entity.Account;

public interface AccountService {
	int deleteByPrimaryKey(Long id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Long id);
    
    int selectAccountCountByBankId(Long bankId);
    
    Account selectByUsername(String username);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);

}
