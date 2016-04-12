package com.cwb.atmweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

@Controller
public class DataController {
	@RequestMapping("/getdata")
	public void getdata(HttpServletResponse response){
		List<Object> list = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", "Animalia");
		map.put("expanded", true);
		map.put("folder", true);
		List<Object> list2 = new ArrayList<Object>();
		Map<String, Object> map11 = new HashMap<String, Object>();
		map11.put("title", "Chordate");
		map11.put("expanded", true);
		map11.put("folder", true);
//		Map<String, Object> map111 = new HashMap<String, Object>();
//		map111.put("title", "Chordate");
//		map111.put("expanded", true);
//		map111.put("folder", true);
//		Map<String, Object> map1111 = new HashMap<String, Object>();
//		map1111.put("children", null);
//		map111.put("children", map1111);
//		map11.put("children", map111);
		list2.add(map11);
		map.put("children", list2);
		list.add(map);
		try {
			response.getWriter().write(JSONArray.toJSONString(list).toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
