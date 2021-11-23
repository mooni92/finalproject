package com.bbbboone.mapper;

import java.util.List;

import com.bbbboone.domain.SubjectVo;

public interface SubjectMapper {
	/**
	 * 관리자<br>
	 * 과목추가
	 * @author 최보원
	 */
	void insert(SubjectVo vo);
	/**
	 * 관리자<br>
	 * 과목번호로 단일 조회
	 * @author 최보원
	 */
	SubjectVo read(String subno);
	/**
	 * 관리자<br>
	 * 수업별 과목 리스트 조회
	 * @author 최보원
	 */
	List<SubjectVo> getList(Long courno);
	/**
	 * 관리자<br>
	 * 과목 수정
	 * @author 최보원
	 */
	int update(SubjectVo vo);
	/**
	 * 관리자<br>
	 * 과목번호로 과목 삭제
	 * @author 최보원
	 */
	int delete(String subno);
	
}
