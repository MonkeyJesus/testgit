package com.cwb.atmweb.service;

import java.util.List;
import java.util.Set;

import com.cwb.atmweb.entity.Role;


public interface RoleService {
	int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);
    
    Role selectByPrimaryKey(Long id);
    
    List<Role> selectAll();

    Set<String> selectByPrimaryKey(String username);
    
    Set<String> selectAllPermissionByRole(Role record);
    
    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}
