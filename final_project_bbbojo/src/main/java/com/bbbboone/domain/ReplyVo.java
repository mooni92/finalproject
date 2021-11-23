package com.bbbboone.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("reply")
public class ReplyVo {
		// 댓글번호
		private Long rno;
		// 댓글 내용
		private String content;
		// 댓글 작성일
		private Date replyDate;
		// 댓글 작성자
		private String writer;
		// 댓글 좋아요수
		private Long hitCount;
		// 게시글 번호
		private Long bno;
		// 원글 번호
		private Long originNo = 0L;
		// 대댓글 순서번호
		private Long groupOrd = 0L;
		// 구분 번호
		private Long groupLayer = 0L;

	}
