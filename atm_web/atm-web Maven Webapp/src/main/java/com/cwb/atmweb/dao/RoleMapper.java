package com.cwb.atmweb.dao;

import java.util.List;

import com.cwb.atmweb.entity.Role;


public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);
    
    List<Role> selectAll();
    
    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}