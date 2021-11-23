package com.bbbboone.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("course")
public class CourseVo {
	// 수업과정번호
	private Long courno;
	// 수업과정명
	private String name;
	// 수업시작시간
	private Long startTime;
	// 수업끝나는시간
	private Long endTime;
	// 신청인원
	private int cnt;
	// 신청최대인원
	private int maxCnt;
	// 담당교수명
	private String pic;
	// 교수번호
	private Long profno;
	// 학과번호
	private Long deptno;
	// 수업요일
	private String day;
	
	private List<EnrollclassVo> enrollclasses;
}
