package com.bbbboone.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.StudentVo;
import com.bbbboone.domain.WithdrawVo;

@Service
public interface MemberService  {
	/*
	 * 회원 가입 
	 * 10.22 곽승협
	 */
	void join(MemberVo member);
	/*
	  * 회원 정보 수정 
	  * 10.22 곽승협
	  */
	void modify(MemberVo member);
	 /*
	  * 회원 개별 조회
	  * 10.22 곽승협
	  */
	void select(Long studno);
	 /*
	  * 회원 탈퇴
	  * 10.22 곽승협
	  */
	void withdraw(MemberVo vo);
	int deleteAuth(String id);
	
	public MemberVo read(String id);
	//회원가입시 중복값 제거를 위한 ajax 처리용 메서드
	int idCheck(String id);
	int emailCheck(String email);
	int phoneCheck(String phone);
	int studnoCheck(int studno);
	int studnoCheckatStudno(int studno);
	//탈퇴회원 중복값 체크용
	int wIdcheck(String id);
	/**
	 * 관리자<br>
	 * 수강신청한 학생 조회
	 * @author 최보원
	 */
	List<EnrollclassVo> getEnrollList(Long courno);
	/**
	  * 관리자<br>
	  * 회원 목록 조회
	  * @author 최보원
	  */
	 List<MemberVo> getList(Criteria cri);
	 /**
	  * 관리자<br>
	  * 회원 총 수
	  * @author 최보원
	  */
	int getTotal(Criteria cri);
	/**
	  * 관리자<br>
	  * 회원 정보 수정
	  * @author 최보원
	  */
	boolean modifyAdmin(MemberVo vo);
	/**
	  * 관리자<br>
	  * 회원 삭제
	  * @author 최보원
	  */
	 boolean remove(WithdrawVo vo);
	/**
	  * 핸드폰 인증<br>
	  * @author 오석호
	  */
	void confirmPhoneNumber(String phoneNumber, String cerNum);
	StudentVo studonovalue(long studno);
	
	
	/**
	  * 관리자<br>
	  * 관리자인지 체크
	  * @author 최보원
	  */
	 List<MemberVo> checkGrade(String grade);
}
