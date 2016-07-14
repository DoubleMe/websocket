package com.chm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/index")
public class IndexController {
	
	@RequestMapping(value="/page")
	public String getIndex(){
		System.out.println("to ~~~~~~~~~~~~~~index");
		return "index";
	}

}
