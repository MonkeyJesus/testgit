package com.cwb.atmweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	@RequestMapping("/employee/view")
	public String view(){
		return "employee/view";
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
