package com.bbbboone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;

public interface BoardMapper {
	/* 
	 * 게시물 목록 조회
	 * 김영문
	 * */
	public List<BoardVo> getList();
	/* 
	 * 페이지 당 게시물 목록 조회(카테고리별)
	 * 김영문
	 * */
	public List<BoardVo> getListWithPaging(@Param("cri") Criteria cri,@Param("category") int category);
	/**
	 * 관리자<br>
	 * 게시물 목록 전체 조회(페이징)
	 * @author 최보원
	 */
	public List<BoardVo> getListWithPaging2(Criteria cri);
	/* 
	 * 게시글 입력
	 * 김영문
	 * */
	void insert(BoardVo board);
	/* 
	 * 추가 행 갯수 출력
	 * 김영문
	 * */
	void insertSelectKey(BoardVo board);
	/* 
	 * 개별 게시글 조회
	 * 김영문
	 * */
	BoardVo read(Long bno);
	/* 
	 * 게시글 수정 
	 * 김영문
	 * */
	int update(BoardVo boardVo);
	/* 
	 * 탈퇴회원 게시글 수정 
	 * 오석호
	 * */
	int withdrawUpdate(String id);
	/* 
	 * 게시글 삭제
	 * 김영문
	 * */
	int delete(Long bno);
	/* 
	 * 게시글 총 갯수 조회
	 * 김영문
	 * */
	int getTotalCount(@Param("cri") Criteria cri,@Param("category") int category);
	/* 
	 * 댓글 수 갱신
	 * 김영문
	 * */
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	/**
	 * 관리자+회원<br>
	 * 회원 탈퇴 시 글 작성자 탈퇴회원으로 변경 
	 * @author 최보원
	 */
	int withdraw(@Param("id") String id, @Param("withdrawal") String withdrawal);
	/**
	 * 관리자<br>
	 * 게시글 총 수 
	 * @author 최보원
	 */
	int getTotalCountAdmin(Criteria cri);
}