package com.bbbboone.service;

import java.util.List;

import com.bbbboone.domain.AttachVo;
import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;

public interface BoardService {
	/*
	  * 게시판 글 등록
	  * 김영문
	  */
	void register(BoardVo boardVo);
	/*
	  * 게시판 글 조회
	  * 김영문
	  */
	BoardVo get(Long bno);
	/*
	  * 게시판 글 수정
	  * 김영문
	  */
	boolean modify(BoardVo boardVo);
	/*
	  * 게시판 글 삭제
	  * 김영문
	  */
	boolean remove(Long bno);
	/*
	  * 게시판 리스트 조회
	  * 김영문
	  */
	List<BoardVo> getList(Criteria cri, int category);
	/*
	  * 게시판 글 총 갯수 조회
	  * 김영문
	  */
	int getTotal(Criteria cri, int category);
	/*
	  * 게시판 첨부파일 리스트
	  * 김영문
	  */
	List<AttachVo> getAttachs(Long bno);
}
