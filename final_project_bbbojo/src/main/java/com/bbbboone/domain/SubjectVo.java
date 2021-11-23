package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("subject")
public class SubjectVo {
	// 과목번호
	private String subno;
	// 과목명
	private String name;
	// 수업번호
	private Long courno;
}
