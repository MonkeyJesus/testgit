package com.cwb.atmweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AtmInfoController {
	
	@RequestMapping("/atm/getNewAtmId")
	public Long getNewAtmId(){
		return null;
	}
	
	@RequestMapping("/atm/atmdata/view")
	public String view(){
		return "atm/atmdata/view";
	}
}
