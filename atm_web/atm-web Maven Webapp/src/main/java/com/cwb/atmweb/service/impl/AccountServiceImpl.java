package com.cwb.atmweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.AccountMapper;
import com.cwb.atmweb.entity.Account;
import com.cwb.atmweb.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper accountMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return accountMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Account record) {
		return accountMapper.insert(record);
	}

	@Override
	public int insertSelective(Account record) {
		return accountMapper.insertSelective(record);
	}

	@Override
	public Account selectByPrimaryKey(Long id) {
		return accountMapper.selectByPrimaryKey(id);
	}

	@Override
	public Account selectByUsername(String username) {
		return accountMapper.selectByUsername(username);
	}

	@Override
	public int updateByPrimaryKeySelective(Account record) {
		return accountMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Account record) {
		return accountMapper.updateByPrimaryKey(record);
	}

}
