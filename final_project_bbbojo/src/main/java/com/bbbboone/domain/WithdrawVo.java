package com.bbbboone.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @Alias("withdraw")
public class WithdrawVo {
	private String id;
	private Date wdate;
	private String comments;
	
	public WithdrawVo() { }
	
	public WithdrawVo(String id, String comments) {
		this.id = id;
		this.comments = comments;
	}

}
