package com.smi.trainingcenter.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SecurityController {
	@RequestMapping( "/")

	public String alluser() {
		return "AllPage";
	}

	
	@RequestMapping("/user")
	public String checkUser() {
	  return "UserPage";
	}
//	
//	@RequestMapping(value = "/user", method = RequestMethod.GET)
//	public ModelAndView index() {
//		return new ModelAndView("UserPage");
//	}

	
	
//	
//	
//	@GetMapping("/admin")
//	public String checkAdmin() {
//		return "UserPage";
//	}
//	
}
