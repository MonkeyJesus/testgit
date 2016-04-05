package com.cwb.atmweb.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.EmployeeMapper;
import com.cwb.atmweb.dao.ResourceMapper;
import com.cwb.atmweb.dao.RoleMapper;
import com.cwb.atmweb.entity.Role;
import com.cwb.atmweb.service.RoleService;



@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	@Autowired 
	private ResourceMapper resourceMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public int deleteByPrimaryKey(Long id) {
		return roleMapper.deleteByPrimaryKey(id);
	}

	public int insert(Role record) {
		return roleMapper.insert(record);
	}

	public int insertSelective(Role record) {
		return roleMapper.insertSelective(record);
	}

	public Set<String> selectByPrimaryKey(String username) {
		Set<String> roles = new HashSet<String>();
		roles.add(roleMapper.selectByPrimaryKey(Long.parseLong(employeeMapper.selectByUsername(username).getRoleId())).getRole().toString());
		return roles;
	}

	public int updateByPrimaryKeySelective(Role record) {
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Role record) {
		return roleMapper.updateByPrimaryKey(record);
	}

	public Set<String> selectAllPermissionByRole(Role record) {
		Set<String> permissions = new HashSet<String>();
		String resourceids = record.getResourceIds();
		String[] ids = resourceids.split(",");
		for (String id : ids) {
			permissions.add(resourceMapper.selectByPrimaryKey(Long.parseLong(id)).getPermission());
		}
		return permissions;
	}

	public Role selectByPrimaryKey(Long id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}
	
}
