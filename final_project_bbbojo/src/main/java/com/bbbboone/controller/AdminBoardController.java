package com.bbbboone.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbbboone.domain.AttachVo;
import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.PageDTO;
import com.bbbboone.service.BoardService;
import com.bbbboone.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminBoard/*")
@AllArgsConstructor
public class AdminBoardController {
	private BoardService boardService;
	private ReplyService replyService;
	private UploadController uploadController;

	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", boardService.getList(cri, cri.getCategory()));
		model.addAttribute("page", new PageDTO(boardService.getTotal(cri,cri.getCategory()), cri));
	}
	@GetMapping({"get", "modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", boardService.get(bno));
	}
	
	@PostMapping("modify")
	public String modify(BoardVo boardVo, RedirectAttributes rttr, Criteria cri) {
		boardVo.setCategory(cri.getCategory());
		if(boardService.modify(boardVo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("category", cri.getCategory());
		return "redirect:/adminBoard/list";
	}

	@PostMapping("remove")
	public String remove(BoardVo boardVo, RedirectAttributes rttr, Criteria cri) {
		replyService.removeReply(boardVo.getBno());
		List<AttachVo> list = boardService.getAttachs(boardVo.getBno());
		if (boardService.remove(boardVo.getBno())) {
			list.forEach(vo -> {
				uploadController.deleteFile(vo.getFullPath(), vo.isImage());
			});
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("category", cri.getCategory());
		return "redirect:/adminBoard/list";
	}
	
//	@PostMapping("remove")
//	public void remove(HttpServletRequest req, @RequestParam("bno") Long bno, Criteria cri) {
//		Enumeration<String> e = req.getParameterNames();
//		while(e.hasMoreElements()) {
//			String name = e.nextElement();
//			String value = req.getParameter(name);
//			log.info(name + "::" + value);
//		}
//	}
	
	@GetMapping("register") 
	@PreAuthorize("isAuthenticated()")
	public void register() {
	}
	
	@PostMapping("register")  
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVo boardVo, RedirectAttributes rttr, Criteria cri) {
		boardVo.setCategory(cri.getCategory());
		boardService.register(boardVo);
		rttr.addFlashAttribute("result", boardVo.getBno());
			return "redirect:/adminBoard/list";
	}
}
