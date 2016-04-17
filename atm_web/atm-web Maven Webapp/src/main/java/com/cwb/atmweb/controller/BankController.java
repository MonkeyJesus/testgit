package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cwb.atmweb.dao.AccountMapper;
import com.cwb.atmweb.entity.AtmInfo;
import com.cwb.atmweb.entity.Bank;
import com.cwb.atmweb.entity.City;
import com.cwb.atmweb.entity.param.BankEmployeeInfo;
import com.cwb.atmweb.service.AccountService;
import com.cwb.atmweb.service.AtmInfoService;
import com.cwb.atmweb.service.BankService;
import com.cwb.atmweb.service.EmployeeService;


@Controller
public class BankController {
	
	@Autowired
	private BankService bankService;
	@Autowired
	private AtmInfoService atmInfoService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/bank/addBank")
	public String addBank() {
		return "bank/addBank";
	}
	
	/**
	 * 显示银行列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/bank/view")
	public String view(HttpServletRequest request,Model model){
		Map<String, Object> condition = new HashMap<String, Object>();
		for ( String key : request.getParameterMap().keySet()) {
			condition.put(key, request.getParameterMap().get(key)[0]);
		}
		List<Bank> banks = bankService.selectAll(condition);
		model.addAttribute("banks", banks);			
		return "bank/view";
	}
	
	@RequestMapping("/bank/getBankById")
	@ResponseBody
	public void getBankById(HttpServletRequest request,HttpServletResponse response,String id){
		try {
			response.getWriter().write(JSONObject.toJSONString(bankService.selectByPrimaryKey(Long.parseLong(id))).toString());
			response.getWriter().flush();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/bank/createBank")
	public String createBank(String bankName,String provinceId,String cityId, String areaId, String streetId, String parentId,
			String level, String atm) {
		Map<String, Object> condition = new HashMap<String, Object>();
		Long id = null;
		//分行
		condition.put("level", level);
		if(Integer.parseInt(level) == 2l){
			condition.put("provinceId", provinceId);
		}else if(Integer.parseInt(level) == 3){
			condition.put("provinceId", cityId);
			
		}
		Long total = bankService.selectTotalCount(condition);
		id = Integer.parseInt(provinceId)*1000+total+1;
		Bank bank = new Bank();
		bank.setId(id);
		bank.setBankname(bankName);
		bank.setProvinceId(Integer.parseInt(provinceId));
		bank.setCityId(Integer.parseInt(cityId));
		bank.setAreaId(Integer.parseInt(areaId));
		bank.setStreetId(Integer.parseInt(streetId.equals("")?"0":streetId));
		bank.setParentid(Long.parseLong(parentId));
		bank.setParentIds(bankService.selectByPrimaryKey(Long.parseLong(parentId)).getParentIds()+"_"+parentId);
		bank.setLevel(Integer.parseInt(level));
		if(bankService.insert(bank)>0){
			JSONArray a = JSONArray.parseArray(atm);
			for(int i=0;i<a.size();i++){
				JSONObject oo = (JSONObject) JSONObject.parse(a.getString(i));
				AtmInfo atmInfo = new AtmInfo();
				atmInfo.setBankid(id);
				atmInfo.setBrand(oo.getString("brand"));
				atmInfo.setModel(oo.getString("model"));
				atmInfo.setFirstmoney(Long.parseLong(oo.getString("first_money")));
				atmInfoService.insert(atmInfo);
			}
		}
		return "bank/view";
	}
	
	/**
	 * 分页
	 * @param request
	 * @param page
	 * @param row
	 * @return
	 */
	@RequestMapping("/bank/showBanks")
	public void showBanks(HttpServletRequest request,HttpServletResponse response,int page,int row){
		Map<String, Object> condition = new HashMap<String, Object>();
		for ( String key : request.getParameterMap().keySet()) {
			condition.put(key, request.getParameterMap().get(key)[0]);
		}
		long totalRows = bankService.selectTotalCount(condition);
		long totalPages = totalRows%row==0?(totalRows/row):(totalRows/row+1);
		condition.put("start", (page-1)*row);
		condition.put("end", row);
		List<Bank> banks = bankService.selectAll(condition);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", banks);
		map.put("totalPage", totalPages);
		try {
			response.getWriter().write(JSONObject.toJSONString(map));
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 分页
	 * @param request
	 * @param page
	 * @param row
	 * @return
	 */
	@RequestMapping("/bank/showBankEmployees")
	public void showBankEmployees(HttpServletRequest request,HttpServletResponse response,int page,int row){
		List<BankEmployeeInfo> beInfos = new ArrayList<BankEmployeeInfo>();
		Map<String, Object> condition = new HashMap<String, Object>();
		for ( String key : request.getParameterMap().keySet()) {
			condition.put(key, request.getParameterMap().get(key)[0]);
		}
		long totalRows = bankService.selectTotalCount(condition);
		long totalPages = totalRows%row==0?(totalRows/row):(totalRows/row+1);
		condition.put("start", (page-1)*row);
		condition.put("end", row);
		List<Bank> banks = bankService.selectAll(condition);
		for (Bank bank : banks) {
			BankEmployeeInfo be = new BankEmployeeInfo();
			be.setBank(bank);
			be.setEmployeeNum(employeeService.selectEmployeeCountByBankId(bank.getId()));
			be.setAccountNum(accountService.selectAccountCountByBankId(bank.getId()));
			beInfos.add(be);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", beInfos);
		map.put("totalPage", totalPages);
		try {
			response.getWriter().write(JSONObject.toJSONString(map));
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 显示银行列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/bank/getCityInProvince")
	public void getCityInProvince(HttpServletResponse response, HttpServletRequest request, String code){
		try {
			response.getWriter().write(JSONArray.toJSONString(bankService.getCityByCode(code)).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/bank/selectAllBanks")
	public void selectAllBanks(HttpServletRequest request,HttpServletResponse response , Model model){
		Map<String, Object> condition = new HashMap<String, Object>();
		for ( String key : request.getParameterMap().keySet()) {
			condition.put(key, request.getParameterMap().get(key)[0]);
		}
		List<Bank> banks = bankService.selectAll(condition);
		try {
			response.getWriter().write(JSONArray.toJSONString(banks).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/bank/{id}/delete")
	public String deleteRole(@PathVariable("id") Long id,HttpServletRequest request,Model model){
		bankService.deleteByPrimaryKey(id);
		return "bank/view";
	}
	
//	
//	
//	@RequestMapping("/resource/{id}/addPermission")
//	public String addPermission(@PathVariable("id") Long id,HttpServletRequest request,Model model){
//		Resource parent = resourceService.selectByPrimaryKey(id);
//        model.addAttribute("resource", parent);
//        model.addAttribute("type", "add");
//		return "resource/addResource";
//	}
//	
//	
//	@RequestMapping("/resource/{id}/update")
//	public String update(@PathVariable("id") Long id,HttpServletRequest request,Model model){
//		Resource self = resourceService.selectByPrimaryKey(id);
//		model.addAttribute("resource", self);
//		model.addAttribute("type", "update");
//		return "resource/addResource";
//	}
//	
//	/**
//	 * 添加资源
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("/addResource")
//	public String addResource(HttpServletRequest request,Model model,Long id,String parentIds){
//		String resourcename = request.getParameter("resourcename");
//		String type = request.getParameter("type");
//		String url = "";
//		if(type.equals("menu")){
//			url = request.getParameter("url");
//		}
//		String permissionStr = request.getParameter("permissionStr");
//		Resource resource = new Resource();
//		resource.setName(resourcename);
//		resource.setType(type);
//		resource.setUrl(url);
//		resource.setParentId(id);
//		resource.setParentIds(parentIds);
//		resource.setPermission(permissionStr);
//		resource.setAvailable(true);
//		resourceService.insert(resource);
//		return "redirect:/resource/view";
//	}
//	/**
//	 * 编辑资源
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("/updateResource")
//	public String updateResource(HttpServletRequest request,Long id,Model model){
//		String resourcename = request.getParameter("resourcename");
//		String type = request.getParameter("type");
//		String url = "";
//		if(type.equals("menu")){
//			url = request.getParameter("url");
//		}
//		String permissionStr = request.getParameter("permissionStr");
//		Resource resource = resourceService.selectByPrimaryKey(id);
//		resource.setName(resourcename);
//		resource.setType(type);
//		resource.setUrl(url);
//		resource.setPermission(permissionStr);
//		
//		resourceService.updateByPrimaryKey(resource);
//		return "redirect:/resource/view";
//	}
//	
//	/**
//	 * 获取所有的资源
//	 * @param request
//	 * @param response
//	 * @param model
//	 */
//	@RequestMapping("/resource/searchAllResources")
//	public void searchAllResources(HttpServletRequest request,HttpServletResponse response,Model model){
//		Subject subject = SecurityUtils.getSubject();
//		
//		JSONArray ja = (JSONArray) JSONArray.toJSON(resourceService.selectAll());
//		try {
//			response.getWriter().write(ja.toJSONString());
//			response.getWriter().flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	/**
//	 * 获得资源树
//	 * @param response
//	 */
//	@RequestMapping("/resource/getResourceTree")
//	public void getResourceTree(HttpServletResponse response){
//		List<Object> list = new ArrayList<Object>();
//		
//		List<Resource> allresource = resourceService.selectAll();
//		for (Resource r : allresource) {
//			Map<String, Object> map = new HashMap<String, Object>();
//			if(r.getParentId() == 1){
//				map.put("title", r.getName());
//				map.put("key", r.getId());
//				map.put("expanded", false);
//				List<Map<String, Object>> children = new ArrayList<Map<String,Object>>();
//				if("menu".equals(r.getType())){
//					setChildren(children,r.getId());
//					map.put("folder", true);
//				}
//				map.put("children", children);
//				list.add(map);
//			}
//		}
//		try {
//			response.getWriter().write(JSONArray.toJSONString(list).toString());
//			response.getWriter().flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
//	public void setChildren(List<Map<String, Object>> childs, Long parentId){
//		List<Resource> rs = resourceService.selectByParentId(parentId);
//		if(rs!=null){
//			for (Resource r : rs) {
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("title", r.getName());
//				map.put("key", r.getId());
//				map.put("expanded", false);
//				Map<String, Object> children = new HashMap<String, Object>();
//				if("menu".equals(r.getType())){
//					List<Map<String, Object>> child = new ArrayList<Map<String,Object>>();
//					map.put("folder", true);
//					setChildren(child,r.getId());
//				}
//				map.put("children", children);
//				childs.add(map);
//			}
//		}
//	}
	
	
}
