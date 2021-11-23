package com.bbbboone.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor 
public class ReplyCriteria extends Criteria{
	// 마지막 댓글 번호
	private Long lastRno =0L;

	public ReplyCriteria() {
		this(10);
	}
	
	
	public ReplyCriteria(int amount) {
		setAmount(amount);
	}
	
	
	public ReplyCriteria(Long lastBno, int amount) {
		this(lastBno);
		setAmount(amount);
	}
}
