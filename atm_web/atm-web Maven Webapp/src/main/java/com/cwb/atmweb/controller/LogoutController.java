package com.cwb.atmweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	@RequestMapping("/logout11")
	public String logout(){
		System.out.println("=======");
		return "login";
	}
}
