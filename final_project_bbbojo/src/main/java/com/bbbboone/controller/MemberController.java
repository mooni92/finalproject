package com.bbbboone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbbboone.domain.AuthVo;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.StudentVo;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.mapper.MemberMapper;
import com.bbbboone.service.MemberService;
import com.bbbboone.service.WithdrawService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController{
	@Setter @Autowired
	private MemberService service;
	@GetMapping("/myinfo")
	public void myinfo() {}
	@GetMapping("/register")
	public void register(MemberVo vo,RedirectAttributes rttr) {}
	@PostMapping("/register")
	public String join(MemberVo vo,RedirectAttributes rttr){
		service.join(vo);
		rttr.addFlashAttribute("id", vo.getId());
		return "redirect:/customLogin";
	}
	
	@GetMapping("{phoneNumber}")
	@ResponseBody
	public String sendSMS(@PathVariable String phoneNumber){
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i<6; i++){
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		service.confirmPhoneNumber(phoneNumber, numStr);
		return numStr;
	}
	
	
	@GetMapping("/modify")
	public void modify(MemberVo vo,RedirectAttributes rttr) {}
	@PostMapping("/modify")
	public String moidfy(MemberVo vo,RedirectAttributes rttr){
		rttr.addFlashAttribute("id", vo.getId());
		return "redirect:/customLogin";
	}
	@GetMapping("/withdraw")
	public void withdraw() {}
	@PostMapping("/withdraw")
	public String withdraw(MemberVo vo,RedirectAttributes rttr) {
		service.withdraw(vo);
		rttr.addFlashAttribute("id", vo.getId());
		return "redirect:/common/index";
	}
	/*
	 * @GetMapping("test") public void test(MemberVo memberVo) { log.info(memberVo);
	 * }
	 * 
	 * @PostMapping("test") public void test2(MemberVo memberVo) {
	 * log.info(memberVo); }
	 */
	// 아이디 중복 검사
	@GetMapping("/idcheck")
	@ResponseBody
	public int idCheck(String id){
		int cnt = service.idCheck(id);
		return cnt;
	} 
	// 탈퇴 회원 아이디 중복 검사
	@GetMapping("/widcheck")
	@ResponseBody
	public int WIdcheck(String id){
		int cnt = service.wIdcheck(id);
		return cnt;
	} 
	@GetMapping("/emailcheck")
	@ResponseBody
	public int emailCheck(String email){
		int cnt = service.emailCheck(email);
		return cnt;
	} 
	@GetMapping("/phonecheck")
	@ResponseBody
	public int phoneCheck(String phone){
		int cnt = service.phoneCheck(phone);
		return cnt;
	} 
	@GetMapping("/studnocheck")
	@ResponseBody
	public int studnoCheck(int studno) {
		int cnt = service.studnoCheck(studno);
		return cnt;
	}
	@GetMapping("/studnocheckatstudent")
	@ResponseBody
	public StudentVo studnoCheckAtstudent(int studno) {
		int cnt = service.studnoCheckatStudno(studno);
		StudentVo vo = new StudentVo();
		return vo;
	}
	@GetMapping("/pwcheck")
	public String pwCheck(String pw) {
		return pw;
	}
	@GetMapping("/studnovalue")
	@ResponseBody
	public StudentVo studnovalue(Long studno) {
		StudentVo vo = service.studonovalue(studno);
		return vo;
	}
}



