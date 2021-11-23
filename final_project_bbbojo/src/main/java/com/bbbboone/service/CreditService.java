package com.bbbboone.service;

import java.util.List;

import com.bbbboone.domain.CreditVo;

public interface CreditService {
	/**
	 * 관리자<br> 
	 * 학생 학점 입력
	 * @author 최보원
	 */
	void register(List<CreditVo> vo);
	/**
	 * 관리자<br> 
	 * 학생 학점 삭제
	 * @author 최보원
	 */
	boolean remove(Long studno);
	/**
	 * 관리자<br> 
	 * 학생 학점 삭제
	 * @author 최보원
	 */
	boolean removeOne(Long credno);
	/**
	 * 학생<br> 
	 * 학생 학점 조회
	 * @author 최보원
	 */
	List<CreditVo> getList(Long studno);
}
