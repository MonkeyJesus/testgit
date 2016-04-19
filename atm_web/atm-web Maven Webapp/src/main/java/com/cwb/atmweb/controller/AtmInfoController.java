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
	
	@RequestMapping("/atm/view")
	public String viewatm(){
		return "atm/atmbug/view";
	}
	
	@RequestMapping("/atm/atmdata/daytop")
	public String daytop(){
		return "atm/atmdata/dayTop";
	}
	
	@RequestMapping("/atm/atmdata/operater")
	public String operater(){
		return "atm/atmdata/operater";
	}
	
	@RequestMapping("/atm/atmbug/view")
	public String viewBug(){
		return "atm/atmbug/view";
	}
	
	@RequestMapping("/atm/atmdata/atmgrowth")
	public String detail(){
		return "atm/atmdata/atmgrowth";
	}
}
