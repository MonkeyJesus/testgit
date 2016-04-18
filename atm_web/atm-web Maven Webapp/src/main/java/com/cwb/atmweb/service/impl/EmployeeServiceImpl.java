package com.cwb.atmweb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.BankMapper;
import com.cwb.atmweb.dao.EmployeeMapper;
import com.cwb.atmweb.entity.Employee;
import com.cwb.atmweb.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired 
	private EmployeeMapper employeeMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return employeeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Employee record) {
		return employeeMapper.insert(record);
	}

	@Override
	public int insertSelective(Employee record) {
		return employeeMapper.insertSelective(record);
	}

	@Override
	public Employee selectByPrimaryKey(Long id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Employee record) {
		return employeeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Employee record) {
		return employeeMapper.updateByPrimaryKey(record);
	}

	@Override
	public Employee selectByUsername(String employeeName) {
		return employeeMapper.selectByUsername(employeeName);
	}

	@Override
	public String selectRoleIdByUsername(String employeeName) {
		return employeeMapper.selectRoleIdByUsername(employeeName);
	}

	@Override
	public int selectEmployeeCountByBankId(Long bankId) {
		return employeeMapper.selectEmployeeCountByBankId(bankId);
	}

	@Override
	public List<Employee> selectAll(Map<String, Object> condition) {
		return employeeMapper.selectAll(condition);
	}

}
