package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("credit")
public class CreditVo {
	
	// 수업과정번호
	private Long credno;
	// 학생번호
	private Long studno;
	// 과목명
	private String courname;
	
	public CreditVo() {
	}

	
	public CreditVo(Long studno, String courname) {
		super();
		this.studno = studno;
		this.courname = courname;
	}
	
	
}
