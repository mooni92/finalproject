package com.bbbboone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.PageDTO;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.service.CourseService;
import com.bbbboone.service.MemberService;
import com.bbbboone.service.WithdrawService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminMember/*")
@AllArgsConstructor
public class AdminMemberController {
	private MemberService memberService;
	private CourseService courseService;
	
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", memberService.getList(cri));
		model.addAttribute("page", new PageDTO(memberService.getTotal(cri), cri));
	}
	
	@GetMapping({"get", "modify"})
	public void get(@RequestParam("id") String id, @RequestParam("studno") Long studno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("member", memberService.read(id));
		model.addAttribute("course", courseService.getList2(studno));
	}
	
	@PostMapping("modify")
	public String modify(MemberVo vo, RedirectAttributes rttr, Criteria cri) {
		if(memberService.modifyAdmin(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminMember/list";
	}
	
	@GetMapping("remove")
	public void remove(@RequestParam("id") String id, RedirectAttributes rttr, Criteria cri) {
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
	}
	
	@PostMapping("withdraw")
	public String withdraw(WithdrawVo vo, RedirectAttributes rttr, Criteria cri) {
		if(memberService.idCheck(vo.getId()) == 1) {
			memberService.remove(vo);
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminMember/list";
	}
}
