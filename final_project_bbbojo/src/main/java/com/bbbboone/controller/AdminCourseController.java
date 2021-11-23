package com.bbbboone.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.PageDTO;
import com.bbbboone.domain.SubjectVo;
import com.bbbboone.service.CourseService;
import com.bbbboone.service.MemberService;
import com.bbbboone.service.SubjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminCourse/*")
@AllArgsConstructor
public class AdminCourseController {
	private CourseService courseService;
	private MemberService memberService;
	private SubjectService subjectService;
	
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", courseService.getList(cri));
		model.addAttribute("page", new PageDTO(courseService.getTotal(cri), cri));
		
	}
	
	@GetMapping("register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String register(CourseVo vo, RedirectAttributes rttr) {
		courseService.register(vo);
		rttr.addFlashAttribute("result", vo.getCourno());
		return "redirect:/adminCourse/list";
	}
	
	@GetMapping({"get", "modify"})
	public void get(@RequestParam("courno") Long courno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("course", courseService.get(courno));
		model.addAttribute("member", memberService.getEnrollList(courno));
		model.addAttribute("subject", subjectService.getList(courno));
	}
	
	@PostMapping("modify")
	public String modify(CourseVo vo, RedirectAttributes rttr, Criteria cri) {
		if(courseService.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminCourse/list";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("courno") Long courno, RedirectAttributes rttr, Criteria cri) {
		courseService.remove(courno);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminCourse/list";
	}
	
	@PostMapping("new")
	@ResponseBody
	public String create(@RequestBody SubjectVo vo) {
		subjectService.register(vo);
		return "success";
	}
	
	@DeleteMapping("{subno}")
	@ResponseBody
	public String remove(@PathVariable String subno) {
		subjectService.remove(subno);
		return "success";
	}
}
