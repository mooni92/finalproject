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
import com.bbbboone.domain.PageDTO;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.service.WithdrawService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminWithdraw/*")
@AllArgsConstructor
public class AdminWithdrawController {
	private WithdrawService service;
	
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("page", new PageDTO(service.getTotal(cri), cri));
	}
	
	@GetMapping({"get","modify"})
	public void get(@RequestParam("id") String id, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("withdraw", service.get(id));
	}
	
	@PostMapping("modify")
	public String modify(WithdrawVo vo, RedirectAttributes rttr, Criteria cri) {
		if(service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminWithdraw/list";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr, Criteria cri) {
		service.remove(id);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/adminWithdraw/list";
	}
}
