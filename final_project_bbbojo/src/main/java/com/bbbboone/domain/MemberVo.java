package com.bbbboone.domain;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("member")
//10.22 MEMBERVO 곽승협
public class MemberVo {
	//아이디
	private String id;
	//패스워드
	private String pw;
	//이름
	private String name;
	//닉네임
	private String nickname;
	//이메일
	private String email;
	//전화번호
	private String phonenum;
	//학생 학년
	private String grade;
	//프로필 사진 uuid
	//private String uuid;
	//학생 번호
	private Long studno;
	private String enabled;
	//로그인 권한용
	private List<AuthVo> auths;
	//탈퇴 회원용 코멘트 및 탈퇴날짜
	private String comments;
	private Date wdate;
	
	//private List<MemberVo> member;
	
	/**
	 * 관리자<br>
	 * 수강신청한 학생 조회
	 * @author 최보원
	 */
	private List<EnrollclassVo> enrollclasses;

}
