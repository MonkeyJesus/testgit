package com.cwb.atmweb.service;

import com.cwb.atmweb.entity.Employee;

public interface EmployeeService {

	int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long id);
    
    int selectEmployeeCountByBankId(Long bankId);
    
    Employee selectByUsername(String employeeName);
    
    String selectRoleIdByUsername(String employeeName);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}
