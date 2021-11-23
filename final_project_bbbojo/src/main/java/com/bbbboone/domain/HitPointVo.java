package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("hitpoint")
public class HitPointVo {
	// 게시글 좋아요수
	private int hitCount;
	// 아이디
	private String id;
	// 게시글 번호
	private Long bno;
}
