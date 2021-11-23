package com.bbbboone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbbboone.domain.EnrollclassVo;

public interface EnrollclassMapper {
	/**
	 * 학생<br> 
	 * 수강 신청
	 * @author 최보원
	 */
	int insert(EnrollclassVo vo);
	/**
	 * 학생+관리자<br>
	 * 학번과 수업번호로 수강신청 단일 조회
	 * @author 최보원
	 */
	EnrollclassVo read(EnrollclassVo vo);
	/**
	 * 관리자<br>
	 * 수업 리스트 조회
	 * @author 최보원
	 */
	List<EnrollclassVo> getList();
	/**
	 * 관리자<br>
	 * 수업별 학생 리스트 조회
	 * @author 최보원
	 */
	List<EnrollclassVo> getListAdmin();
	/**
	 * 학생+관리자<br>
	 * 수강신청 취소
	 * @author 최보원
	 */
	int delete(EnrollclassVo vo);
	/**
	 * 관리자<br>
	 * 수강과목 신청 학생 수
	 * @author 최보원
	 */
	int getCount(Long courno);
	
}
