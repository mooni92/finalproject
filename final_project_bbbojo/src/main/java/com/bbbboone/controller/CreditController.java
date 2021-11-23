package com.bbbboone.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bbbboone.domain.CreditVo;
import com.bbbboone.service.CreditService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/credit/*")
@AllArgsConstructor
public class CreditController {
	CreditService service;
	
	@PostMapping("new")
	@PreAuthorize("isAuthenticated()")
	public String create(@RequestBody List<CreditVo> vo) {
		service.register(vo);
		
		return "success";
	}
	
	@GetMapping("get/{studno}")
	@PreAuthorize("isAuthenticated()")
	public List<CreditVo> get(@PathVariable Long studno) {
		return service.getList(studno);
	}
}
