package com.bbbboone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller @Log4j
public class LoginController {
	@GetMapping("customLogin")
	public String login(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
	
		if(error != null) {
			model.addAttribute("error","Login error check your account");
			log.info(model);
		}
		if(logout != null) {
			model.addAttribute("logout","Logout!");
			log.info(model);
		}
		return "/member/login";
	}
}
