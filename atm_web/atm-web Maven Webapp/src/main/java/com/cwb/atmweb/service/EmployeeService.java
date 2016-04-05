package com.cwb.atmweb.service;

import com.cwb.atmweb.entity.Employee;

public interface EmployeeService {

	int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long id);
    
    Employee selectByUsername(String employeeName);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}
