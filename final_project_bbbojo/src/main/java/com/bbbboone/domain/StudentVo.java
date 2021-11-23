package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("student")
public class StudentVo {
	//학생번호
	Long studno;
	//학생학년
	private Long grade;
	//이메일
	private String email;
	//주민등록번호
	private String idnum;
	//이름
	private String name;
	//학과번호
	private Long deptno;
	//교수번호
	private Long profno;
}
