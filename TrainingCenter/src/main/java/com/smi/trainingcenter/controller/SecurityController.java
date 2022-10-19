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

	@RequestMapping("/")
	public String alluser() {
		return "CourseReg";
	}

	@GetMapping("/user")
	public String checkUser() {
		return "UserPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("errorMsg", "Your username and password are invalid.");

		if (logout != null)
			model.addAttribute("msg", "You have been logged out successfully.");

		return "LoginPage";

	}

	@RequestMapping("/stafftakeattendance")
	public String stafftakeattendance() {
		return "stafftakeattendance";
	}

	@RequestMapping("/staffviewcomplaint")
	public String staffviewcomplaint() {
		return "staffviewcomplaint";
	}

	@RequestMapping("/stafftotalstudents")
	public String stafftotalstudents() {
		return "stafftotalstudents";
	}

	@RequestMapping("/staffexam")
	public String staffexam() {
		return "staffexam";
	}

	@RequestMapping("/staffmark")
	public String staffmark() {
		return "staffmark";
	}

	@RequestMapping("/staffaddperformance")
	public String staffaddperformance() {
		return "staffaddperformance";
	}

	@RequestMapping("/staffcourseschedule")
	public String staffcourseschedule() {
		return "staffcourseschedule";
	}

	@RequestMapping("/stafftaskassign")
	public String stafftaskassign() {
		return "stafftaskassign";
	}

	@RequestMapping("/staffviewattendance")
	public String staffviewattendance() {
		return "staffviewattendance";
	}

	@RequestMapping("/bootintex")
	public String homepage() {
		return "bootintex";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/staffindex")
	public String staffindex() {
		return "staffindex";
	}

	@RequestMapping("/adminindex")
	public String adminindex() {
		return "adminindex";
	}

	@RequestMapping("/add")
	public String add() {
		return "add";
	}

	@RequestMapping("/adminheader")
	public String adminheader() {
		return "adminheader";
	}

	@RequestMapping("/attendance")
	public String attendance() {
		return "attendance";
	}

	@RequestMapping("/takeattendance")
	public String takeattendance() {
		return "takeattendance";
	}

	@RequestMapping("/idcard")
	public String idcard() {
		return "idcard";
	}

	@RequestMapping("/task")
	public String task() {
		return "task";
	}

	@RequestMapping("/salaryupdation")
	public String salaryupdation() {
		return "salaryupdation";
	}

	@RequestMapping("/viewperformance")
	public String viewperformance() {
		return "viewperformance";
	}

	@RequestMapping("/viewcomplaint")
	public String viewcomplaint() {
		return "viewcomplaint";
	}

	@RequestMapping("/userindex")
	public String userindex() {
		return "userindex";
	}

	@RequestMapping("/usernav")
	public String usernav() {
		return "usernav";
	}

	@RequestMapping("/Courses")
	public String Courses() {
		return "Courses";
	}
}
