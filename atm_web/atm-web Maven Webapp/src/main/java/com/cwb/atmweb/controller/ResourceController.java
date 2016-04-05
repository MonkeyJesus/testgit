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
import com.cwb.atmweb.entity.Resource;
import com.cwb.atmweb.service.ResourceService;


@Controller
public class ResourceController {

	@Autowired
	private ResourceService resourceService;
	
	
	/**
	 * 显示资源列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/resource/view")
	public String view(HttpServletRequest request,Model model){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isPermitted("resource:view")){
			List<Resource> resources = resourceService.selectAll();
			model.addAttribute("resources", resources);			
			return "resource/view";
		}else{
			return "noPermission";
		}
	}
	
	
	@RequestMapping("/resource/{id}/addPermission")
	public String addPermission(@PathVariable("id") Long id,HttpServletRequest request,Model model){
		return "resource/addResource";
	}
	
	/**
	 * 添加资源
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/addResource")
	public String addResource(HttpServletRequest request,Model model){
		String resourcename = request.getParameter("resourcename");
		String type = request.getParameter("type");
		String url = "";
		if(type.equals("menu")){
			url = request.getParameter("url");
		}
		String permissionStr = request.getParameter("permissionStr");
		Resource resource = new Resource();
		resource.setName(resourcename);
		resource.setType(type);
		resource.setUrl(url);
		resource.setPermission(permissionStr);
		
		resourceService.insert(resource);
		return "redirect:/resource/view";
	}
	
	/**
	 * 获取所有的资源
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/resource/searchAllResources")
	public void searchAllResources(HttpServletRequest request,HttpServletResponse response,Model model){
		Subject subject = SecurityUtils.getSubject();
		
		JSONArray ja = (JSONArray) JSONArray.toJSON(resourceService.selectAll());
		try {
			response.getWriter().write(ja.toJSONString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
