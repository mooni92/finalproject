package com.bbbboone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.PageDTO;
import com.bbbboone.service.BoardService;
import com.bbbboone.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeBoardController {
	private BoardService boardService;
	private ReplyService replyService;
	private UploadController uploadController;
	
	@GetMapping("noticeList")
	public void list(Model model, Criteria cri){
		model.addAttribute("list", boardService.getList(cri,1));
		model.addAttribute("page", new PageDTO(boardService.getTotal(cri,1),cri));
	}
	
	  @GetMapping("noticeGet")
	   public void get(@RequestParam("bno") Long bno, Model model,@ModelAttribute("cri") Criteria cri) {
	      model.addAttribute("board", boardService.get(bno));
	   }
	  
	  
}
