package com.bbbboone.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.service.CourseService;
import com.bbbboone.service.EnrollclassService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@Log4j
@RequestMapping("/enrollclass")
public class EnrollclassController {
	private EnrollclassService enrollclassService;
	private CourseService courseService;
	
	
	@PostMapping("new")
	@PreAuthorize("isAuthenticated()")
	public String create(@RequestBody EnrollclassVo vo) {
		enrollclassService.register(vo);
		courseService.getCnt(vo.getCourno());
		return "success";
	}
	
	@GetMapping("{courno}/{studno}")
	public EnrollclassVo get(@PathVariable Long courno, @PathVariable Long studno) {
		return enrollclassService.get(new EnrollclassVo(courno, studno));
	}
	
	@DeleteMapping("{courno}/{studno}")
	public String remove(@PathVariable Long courno, @PathVariable Long studno) {
		enrollclassService.remove(new EnrollclassVo(courno, studno));
		courseService.getCnt(courno);
		return "success";
	}
	
}
