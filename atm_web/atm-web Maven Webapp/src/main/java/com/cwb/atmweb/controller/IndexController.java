package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.cwb.atmweb.entity.Employee;
import com.cwb.atmweb.entity.Resource;
import com.cwb.atmweb.entity.ResourceInfo;
import com.cwb.atmweb.entity.Role;
import com.cwb.atmweb.service.EmployeeService;
import com.cwb.atmweb.service.ResourceService;
import com.cwb.atmweb.service.RoleService;


@Controller
public class IndexController {
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/indexer")
	public void indexer(HttpServletResponse response){
		System.out.println("==========");
		Subject subject = SecurityUtils.getSubject();
		Employee employee = employeeService.selectByUsername(subject.getPrincipal().toString());
		Role role = roleService.selectByPrimaryKey(Long.parseLong(employee.getRoleId()));
		String resourceids = role.getResourceIds();
		String[] rids = resourceids.split(",");
		List<ResourceInfo> resourceInfos = new ArrayList<ResourceInfo>();
		for (String id : rids) {
			Resource r = resourceService.selectByPrimaryKey(Long.parseLong(id));
			if(r.getType().equals("menu")){
				ResourceInfo ri = new ResourceInfo(r.getUrl(), "0", "1", r.getId().toString(), r.getName());
				resourceInfos.add(ri);
				for (Resource resource : resourceService.selectByParentId(r.getId())) {
					ResourceInfo ri_ = new ResourceInfo(resource.getUrl(), r.getId().toString(), "2", resource.getId().toString(), resource.getName());
					resourceInfos.add(ri_);
				}
			}
		}
		try {
			response.getWriter().write(JSONArray.toJSONString(resourceInfos).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
