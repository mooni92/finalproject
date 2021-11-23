package com.bbbboone.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bbbboone.domain.TimeTableVo;
import com.bbbboone.service.TimeTableService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/timeTable")
@AllArgsConstructor
public class TimeTableController {
	private TimeTableService service;
	
	@PostMapping("new")
	public String create(@RequestBody List<TimeTableVo> vo) {
		service.register(vo);
		return "success";
	}
	@DeleteMapping("remove/{studno}")
	public String create(@PathVariable Long studno) {
		service.remove(studno);
		return "success";
	}
	
	@GetMapping("{studno}")
	public List<TimeTableVo> get(@PathVariable Long studno){
		return service.getList(studno);
	}
	@DeleteMapping("{id}")
	public boolean delete(@PathVariable Long id){
		return service.removeOne(id);
	}

}
