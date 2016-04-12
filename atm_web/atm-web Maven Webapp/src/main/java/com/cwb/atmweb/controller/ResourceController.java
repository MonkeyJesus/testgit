package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.cwb.atmweb.entity.ResourceInfo;
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
		List<Resource> resources = resourceService.selectAll();
		model.addAttribute("resources", resources);			
		return "resource/view";
//		if(subject.isPermitted("resource:view")){
//			return "noPermission";
//		}else{
//			return "noPermission";
//		}
	}
	@RequestMapping("/select/view")
	public String select(HttpServletRequest request,Model model){
		return "select/select";
//		if(subject.isPermitted("resource:view")){
//			return "noPermission";
//		}else{
//			return "noPermission";
//		}
	}
	
	
	@RequestMapping("/resource/{id}/addPermission")
	public String addPermission(@PathVariable("id") Long id,HttpServletRequest request,Model model){
		Resource parent = resourceService.selectByPrimaryKey(id);
        model.addAttribute("resource", parent);
        model.addAttribute("type", "add");
		return "resource/addResource";
	}
	
	
	@RequestMapping("/resource/{id}/update")
	public String update(@PathVariable("id") Long id,HttpServletRequest request,Model model){
		Resource self = resourceService.selectByPrimaryKey(id);
		model.addAttribute("resource", self);
		model.addAttribute("type", "update");
		return "resource/addResource";
	}
	
	/**
	 * 添加资源
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/addResource")
	public String addResource(HttpServletRequest request,Model model,Long id,String parentIds){
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
		resource.setParentId(id);
		resource.setParentIds(parentIds);
		resource.setPermission(permissionStr);
		resource.setAvailable(true);
		resourceService.insert(resource);
		return "redirect:/resource/view";
	}
	/**
	 * 编辑资源
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateResource")
	public String updateResource(HttpServletRequest request,Long id,Model model){
		String resourcename = request.getParameter("resourcename");
		String type = request.getParameter("type");
		String url = "";
		if(type.equals("menu")){
			url = request.getParameter("url");
		}
		String permissionStr = request.getParameter("permissionStr");
		Resource resource = resourceService.selectByPrimaryKey(id);
		resource.setName(resourcename);
		resource.setType(type);
		resource.setUrl(url);
		resource.setPermission(permissionStr);
		
		resourceService.updateByPrimaryKey(resource);
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
	
	@RequestMapping("/resource/getResourceTree")
	public void getResourceTree(HttpServletResponse response){
		List<Object> list = new ArrayList<Object>();
		
		List<Resource> allresource = resourceService.selectAll();
		for (Resource r : allresource) {
			Map<String, Object> map = new HashMap<String, Object>();
			if(r.getParentId() == 1){
				map.put("title", r.getName());
				map.put("expanded", true);
				List<Map<String, Object>> children = new ArrayList<Map<String,Object>>();
				if("menu".equals(r.getType())){
					setChildren(children,r.getId());
					map.put("folder", true);
				}
				map.put("children", children);
				list.add(map);
			}
		}
		try {
			response.getWriter().write(JSONArray.toJSONString(list).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void setChildren(List<Map<String, Object>> childs, Long parentId){
		List<Resource> rs = resourceService.selectByParentId(parentId);
		if(rs!=null){
			for (Resource r : rs) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("title", r.getName());
				map.put("expanded", true);
				Map<String, Object> children = new HashMap<String, Object>();
				if("menu".equals(r.getType())){
					List<Map<String, Object>> child = new ArrayList<Map<String,Object>>();
					map.put("folder", true);
					setChildren(child,r.getId());
				}
				map.put("children", children);
				childs.add(map);
			}
		}
	}
}
