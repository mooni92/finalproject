package com.bbbboone.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Alias("enrollclass")
@NoArgsConstructor
public class EnrollclassVo {
	// 수업과정번호
	private Long courno;
	// 학생번호
	private Long studno;
	// 신청일
	private Date edate;
	
	public EnrollclassVo(Long courno, Long studno) {
		this.courno = courno;
		this.studno = studno;
	}
	
}
