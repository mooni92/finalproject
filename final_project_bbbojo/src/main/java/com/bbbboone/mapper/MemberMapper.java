package com.bbbboone.mapper;

import java.util.List;
import java.util.Map;

import com.bbbboone.domain.AuthVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.StudentVo;

public interface MemberMapper {
	/*
	 * 회원 가입 
	 * 10.22 곽승협
	 */
	 public void join(MemberVo member);
	 public void insertAuth(AuthVo auth);
	 void login(String id,String pw);
	 /*
	  * 회원 정보 수정 
	  * 10.22 곽승협
	  */
	 public void modify(MemberVo member);
	 /*
	  * 회원 개별 조회
	  * 10.22 곽승협
	  */
	 public void select(Long studno);
	 public MemberVo read(String id);
	 /*
	  * 회원 탈퇴
	  * 10.22 곽승협
	  */
	 public void withdraw(MemberVo vo);
	 public void withdrawBoardupdate(String id);
	 public void withdrawReplyupdate(String id);
	 //회원 가입시 id 체크
	 public int idCheck(String memberId);
	//회원 가입시 email 체크
	 public int emailCheck(String email);
	//회원 가입시 phonenum 체크
	 public int phoneCheck(String phone);
	 //회원 가입시 studno 체크
	 public int studnoCheck(int studno);
	 // //회원 가입시 학생테이블 studno 체크
	 public int studnoCheckAtstudent(int studno);
	 public int wIdcheck(String id);
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
	  * 회원 목록 조회(페이징)
	  * @author 최보원
	  */
	 List<MemberVo> getListWithPaging(Criteria cri);
	 /**
	  * 관리자<br>
	  * 회원 총 수
	  * @author 최보원
	  */
	 int getTotalCount(Criteria cri);
	 /**
	  * 관리자<br>
	  * 회원 정보 수정
	  * @author 최보원
	  */
	 int update(MemberVo vo);
	 /**
	  * 관리자<br>
	  * 회원 삭제
	  * @author 최보원
	  */
	 int delete(String id);
	 /**
	  * 관리자<br>
	  * 회원 삭제시 권한 삭제
	  * @author 오석호
	  */
	 int deleteAuth(String id);
	 StudentVo studnovalue(long studno);
	 /**
	  * 관리자<br>
	  * 관리자인지 체크
	  * @author 최보원
	  */
	 List<MemberVo> checkGrade(String grade);
	
}