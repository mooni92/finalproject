package com.bbbboone.service;

import java.util.List;

import com.bbbboone.domain.EnrollclassVo;

public interface EnrollclassService {
	/**
	 * 학생<br> 
	 * 수강 신청
	 * @author 최보원
	 */
	void register(EnrollclassVo vo);
	/**
	 * 학생+관리자<br>
	 * 학번으로 수강신청 단일 조회
	 * @author 최보원
	 */
	EnrollclassVo get(EnrollclassVo vo);
	/**
	 * 관리자<br>
	 * 수업 리스트 조회
	 * @author 최보원
	 */
	List<EnrollclassVo> getList();
	/**
	 * 학생+관리자<br>
	 * 수강신청 취소
	 * @author 최보원
	 */
	boolean remove(EnrollclassVo vo);
	/**
	 * 관리자<br>
	 * 수강과목 신청 학생 수
	 * @author 최보원
	 */
	int getCount(Long courno);
}
