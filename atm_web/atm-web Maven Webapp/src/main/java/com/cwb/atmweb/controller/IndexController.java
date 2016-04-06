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
		Subject subject = SecurityUtils.getSubject();
		String username = subject.getPrincipal().toString().substring(2);
		try {
			response.getWriter().write(JSONArray.toJSONString(resourceService.getResourceInfos(username)).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
