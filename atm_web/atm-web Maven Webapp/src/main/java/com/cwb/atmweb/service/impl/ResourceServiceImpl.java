package com.cwb.atmweb.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.atmweb.dao.EmployeeMapper;
import com.cwb.atmweb.dao.ResourceMapper;
import com.cwb.atmweb.dao.RoleMapper;
import com.cwb.atmweb.entity.Employee;
import com.cwb.atmweb.entity.Resource;
import com.cwb.atmweb.entity.ResourceInfo;
import com.cwb.atmweb.entity.Role;
import com.cwb.atmweb.service.ResourceService;


@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired 
	private ResourceMapper resourceMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public int deleteByPrimaryKey(Long id) {
		return resourceMapper.deleteByPrimaryKey(id);
	}

	public int insert(Resource record) {
		return resourceMapper.insert(record);
	}

	public int insertSelective(Resource record) {
		return resourceMapper.insertSelective(record);
	}

	public Resource selectByPrimaryKey(Long id) {
		return resourceMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Resource record) {
		return resourceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Resource record) {
		return resourceMapper.updateByPrimaryKey(record);
	}

	public List<Resource> selectAll() {
		return resourceMapper.selectAll();
	}

	@Override
	public List<Resource> selectByParentId(Long parentId) {
		return resourceMapper.selectByParentId(parentId);
	}

	@Override
	public List<ResourceInfo> getResourceInfos(String username) {
		Employee employee = employeeMapper.selectByUsername(username);
		Role role = roleMapper.selectByPrimaryKey(Long.parseLong(employee.getRoleId()));
		String resourceids = role.getResourceIds();
		String[] rids = resourceids.split(",");
		List<ResourceInfo> resourceInfos = new ArrayList<ResourceInfo>();
		for (String id : rids) {
			Resource r = resourceMapper.selectByPrimaryKey(Long.parseLong(id));
			if(r.getType().equals("menu")){
				ResourceInfo ri = new ResourceInfo(r.getUrl(), "0", "1", r.getId().toString(), r.getName());
				resourceInfos.add(ri);
				for (Resource resource : resourceMapper.selectByParentId(r.getId())) {
					ResourceInfo ri_ = new ResourceInfo(resource.getUrl(), r.getId().toString(), "2", resource.getId().toString(), resource.getName());
					resourceInfos.add(ri_);
				}
			}
		}
		return resourceInfos;
	}

	@Override
	public Set<String> getPermissions(String username) {
		Set<String> permissions = new HashSet<String>();
        for(ResourceInfo ri : getResourceInfos(username)) {
        	permissions.add(resourceMapper.selectByPrimaryKey(Long.parseLong(ri.getResourceID())).getPermission());
        }
        return permissions;
	}

}
