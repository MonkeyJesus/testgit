package com.cwb.atmweb.dao;

import java.util.List;
import java.util.Map;

import com.cwb.atmweb.entity.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long id);
    
    List<Employee> selectAll(Map<String, Object> condition);
    
    int selectEmployeeCountByBankId(Long bankId);
    
    Employee selectByUsername(String employeeName);

    String selectRoleIdByUsername(String employeeName);
    
    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}