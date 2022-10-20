package com.smi.trainingcenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smi.trainingcenter.model.CourseBean;
import com.smi.trainingcenter.service.CourseService;

@Controller
public class CourseController {
	@Autowired
	CourseService courseservice;

	@RequestMapping("/CourseView")
	public String viewCourse(Model model) {
		List<CourseBean> list = courseservice.viewCourse();
		model.addAttribute("courseList", list);
		return "CourseView";
	}
	
	@RequestMapping("/CourseReg")
	public String insert(Model model) {
		model.addAttribute("coursedetails", new CourseBean());
		return "CourseReg";

	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("coursedetails") CourseBean coursebean, Model model) {
		courseservice.insertCourse(coursebean);
		List<CourseBean> list = courseservice.viewCourse();
		model.addAttribute("courseList", list);
		return "redirect:/";

	}

	
	
	

}
