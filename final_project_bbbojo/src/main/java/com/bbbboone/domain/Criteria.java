package com.bbbboone.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor
public class Criteria {
	// 페이지 번호(최초값)
	private int pageNum;
	// 페이지당 표시되는 열의 갯수
	private int amount;
	// 타입
	private String type;
	// 키워드
	private String keyword;
	// 카테고리
	private int category;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	public Criteria(int pageNum, int amount, int category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
		
	}
	
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getParams() {
		return UriComponentsBuilder.newInstance()
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword)
				.build().toString();
	}
}
