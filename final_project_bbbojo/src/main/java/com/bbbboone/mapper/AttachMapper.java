package com.bbbboone.mapper;

import java.util.List;

import com.bbbboone.domain.AttachVo;

public interface AttachMapper {
	/* 
	 * 첨부파일 등록 
	 * 김영문
	 * */
	void insert(AttachVo vo);
	/* 
	 * 첨부파일 삭제
	 * 김영문
	 * */
	void delete(String uuid);
	/* 
	 * 첨부파일 개별 조회
	 * 김영문
	 * */
	List<AttachVo> findByBno(Long bno);
	/* 
	 * 첨부파일 uuid 조회
	 * 김영문
	 * */
	AttachVo findBy(String uuid);
	/* 
	 * 첨부파일 전체 삭제
	 * 김영문
	 * */
	void deleteAll(Long bno);
	
	/* 
	 * 오래된 날짜 파일 조회
	 * 김영문
	 * */
	List<AttachVo> getOldFiles();
}
