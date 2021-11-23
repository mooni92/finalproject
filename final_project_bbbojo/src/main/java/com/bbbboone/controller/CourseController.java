package com.bbbboone.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.CreditVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.service.CourseService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/course/*")
@AllArgsConstructor
public class CourseController {
	private CourseService service;
	
	@GetMapping("enrollclass")
	@PreAuthorize("isAuthenticated()")
	public void enrollclass(Model model) {
		model.addAttribute("courseList", service.getList());
	}
	
	@GetMapping("credit")
	@PreAuthorize("isAuthenticated()")
	public void credit(Model model) {
	}
	
	@GetMapping("{courno}")
	@ResponseBody
	public CourseVo get(@PathVariable Long courno) {
		return service.get(courno);
	}

	@GetMapping("/list/{studno}")
	public @ResponseBody List<CourseVo> getList2(@PathVariable Long studno) {
		return service.getList2(studno);
	}	
	
	@GetMapping("{studno}/{day}")
	public @ResponseBody List<EnrollclassVo> check(@PathVariable Long studno, @PathVariable String day) {
		return service.getOverlap(studno, day);
	}
}
