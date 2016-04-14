package com.cwb.atmweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.BankMapper;
import com.cwb.atmweb.entity.Bank;
import com.cwb.atmweb.entity.City;
import com.cwb.atmweb.service.BankService;

@Service
public class BankServiceImpl implements BankService {

	@Autowired
	private BankMapper bankMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return bankMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Bank record) {
		return bankMapper.insert(record);
	}

	@Override
	public int insertSelective(Bank record) {
		return bankMapper.insertSelective(record);
	}

	@Override
	public Bank selectByPrimaryKey(Long id) {
		return bankMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Bank record) {
		return bankMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Bank record) {
		return bankMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Bank> selectAll() {
		return bankMapper.selectAll();
	}

	@Override
	public List<City> getCityByCode(String parentId) {
		return bankMapper.getCityByCode(parentId);
	}

}
