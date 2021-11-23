package com.bbbboone.mapper;

import java.util.List;

import com.bbbboone.domain.CreditVo;

public interface CreditMapper {
	/* 
	 * 학생 과목명 입력
	 * 오석호
	 * */
	void insert(CreditVo vo);
	/* 
	 * 학생 과목명 삭제
	 * 오석호
	 * */
	int delete(Long studno);
	/* 
	 * 학생 과목명 삭제
	 * 오석호
	 * */
	int deleteOne(Long credno);
	/* 
	 * 학생 학점 조회
	 * 오석호
	 * */
	List<CreditVo> getStudent(Long studno);
}
