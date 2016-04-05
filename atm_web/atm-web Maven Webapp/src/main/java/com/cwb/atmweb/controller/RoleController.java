package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.cwb.atmweb.entity.Role;
import com.cwb.atmweb.service.RoleService;

@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;
	

	@RequestMapping("/role/addRole")
	public String jumpAddRole(){
		return "role/addRole";
	}
	
	@RequestMapping("/createRole")
	public String createRole(HttpServletRequest request){
		String rolename = request.getParameter("rolename");
		String description = request.getParameter("description");
		String resourceid = request.getParameter("resourceids");
		Role role = new Role();
		role.setRole(rolename);
		role.setDescription(description);
		role.setResourceIds(resourceid);
		role.setAvailable(true);
		roleService.insert(role);
		return "redirect:/role/view";
	}
	@RequiresPermissions("asda:werwe")
	@RequestMapping("/role/view")
	public String view(HttpServletRequest request,Model model){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isPermitted("role:view")){
			List<Role> roles = roleService.selectAll();
			model.addAttribute("roles", roles);			
			return "role/view";
		}else{
			return "noPermission";
		}
	}
	
	@RequestMapping("/role/{id}/delete")
	public String deleteRole(@PathVariable("id") Long id,HttpServletRequest request,Model model){
		roleService.deleteByPrimaryKey(id);
		return "redirect:/role/view";
	}
	
	@RequestMapping("/searchAllRoles")
	public void searchAllRoles(HttpServletRequest request,Model model,HttpServletResponse response){
		Subject subject = SecurityUtils.getSubject();
		
		JSONArray ja = (JSONArray) JSONArray.toJSON(roleService.selectAll());
		try {
			response.getWriter().write(ja.toJSONString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
