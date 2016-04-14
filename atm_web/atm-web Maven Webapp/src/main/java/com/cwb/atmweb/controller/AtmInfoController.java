package com.cwb.atmweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AtmInfoController {
	
	@RequestMapping("/atminfo/getNewAtmId")
	public Long getNewAtmId(){
		return null;
	}
}
