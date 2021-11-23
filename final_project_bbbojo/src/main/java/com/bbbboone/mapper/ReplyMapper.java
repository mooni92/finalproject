package com.bbbboone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbbboone.domain.ReplyCriteria;
import com.bbbboone.domain.ReplyVo;

public interface ReplyMapper {
	/* 
	 * 댓글 입력
	 * 김영문
	 * */
	int insert(ReplyVo vo);
	/* 
	 * 대댓글 입력
	 * 오석호
	 * */
	int insert2(ReplyVo vo);
	/* 
	 * 댓글 조회
	 * 김영문
	 * */
	ReplyVo read(Long rno);
	/* 
	 * 댓글 수정
	 * 김영문
	 * */
	int update(ReplyVo vo);
	/* 
	 * 탈퇴회원 댓글 수정
	 * 오석호
	 * */
	int withdrawUpdate(String id);
	/* 
	 * 댓글 삭제(댓글번호)
	 * 김영문
	 * */
	int delete(Long rno);
	/* 
	 * 댓글 삭제(게시글번호)
	 * 김영문
	 * */
	int deleteReply(Long bno);
	/* 
	 * 대댓글 개수
	 * 오석호
	 * */
	Long count(Long originNo);
	/* 
	 * 전체 댓글 조회
	 * 김영문
	 * */
	List<ReplyVo> getList(@Param("bno") Long bno, @Param("cri") ReplyCriteria cri);
	/**
	 * 관리자+회원<br>
	 * 회웥 탈퇴 시 댓글 작성자 탈퇴회원으로 변경 
	 * @author 최보원
	 */
	int withdraw(@Param("id") String id, @Param("withdrawal") String withdrawal);
}
