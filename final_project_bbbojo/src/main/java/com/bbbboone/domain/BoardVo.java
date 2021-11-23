package com.bbbboone.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("board")
public class BoardVo {
	// 게시글 번호
	private Long bno;
	// 게시글 제목
	private String title;
	// 게시글 내용
	private String content;
	// 게시글 작성일
	private Date regDate;
	// 게시글 작성자
	private String writer;
	// 게시글 카테고리
	private int category = 2;
	// 조회수
	private Long recCount;
	// 댓글 수
	private Long replyCount;
	// 학생번호
	private Long studno;
	// 첨부 파일 리스트
	private List<AttachVo> attachs = new ArrayList<>();
	
}
