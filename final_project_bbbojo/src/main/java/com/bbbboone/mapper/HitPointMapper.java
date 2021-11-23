package com.bbbboone.mapper;

import com.bbbboone.domain.HitPointVo;

public interface HitPointMapper {
	/* 
	 * 좋아요 처음 누를때 
	 * 김영문
	 * */
	void insert(HitPointVo hitpoint);
	/* 
	 * 좋아요 버튼 취소 
	 * 김영문
	 * */
	void hitDown(HitPointVo hitpoint);
	/* 
	 * 좋아요 게시글 번호에 따른 갯수 조회
	 * 김영문
	 * */
	String countByBno(Long bno);

	

}
