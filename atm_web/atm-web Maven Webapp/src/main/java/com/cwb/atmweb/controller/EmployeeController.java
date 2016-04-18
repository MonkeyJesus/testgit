package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cwb.atmweb.entity.Employee;
import com.cwb.atmweb.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/employee/view")
	public String view(){
		return "employee/view";
	}
	
	
	/**
	 * 根据银行Id获得员工列表
	 * @param response
	 * @param bankId
	 */
	@RequestMapping("/employee/getEmployeesBybankId")
	public void getEmployeesBybankId(HttpServletResponse response,HttpServletRequest request){
		Map<String, Object> condition = new HashMap<String, Object>();
		for ( String key : request.getParameterMap().keySet()) {
			condition.put(key, request.getParameterMap().get(key)[0]);
		}
		List<Employee> employees = employeeService.selectAll(condition);
		try {
			response.getWriter().write(JSONObject.toJSONString(employees));
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳到addEmployee界面
	 * @return
	 */
	@RequestMapping("employee/{bankId}/addEmployee")
	public String addEmployee(@PathVariable("bankId") Long bankId,Model model){
		model.addAttribute("bankId", bankId);
		return "employee/addEmployee";
	}
	
}
