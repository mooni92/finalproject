package com.bbbboone.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;

public interface CourseService {
	/**
	 * 관리자<br>
	 * 수업개설
	 * @author 최보원
	 */
	void register(CourseVo vo);
	/**
	 * 관리자<br>
	 * 수업번호로 단일 조회
	 * @author 최보원
	 */
	CourseVo get(Long courno);
	/**
	 * 관리자<br>
	 * 수업 수정
	 * @author 최보원
	 */
	boolean modify(CourseVo vo);
	/**
	 * 관리자<br>
	 * 수업번호로 수업 삭제
	 * @author 최보원
	 */
	boolean remove(Long courno);
	/**
	 * 관리자+학생<br>
	 * 수업 리스트 조회
	 * @author 최보원
	 */
	List<CourseVo> getList();
	/**
	 * 관리자<br>
	 * 수업 리스트 조회(패이징)
	 * @author 최보원
	 */
	List<CourseVo> getList(Criteria cri);
	/**
	 * 관리자+학생<br>
	 * 학번으로 수업 리스트 조회
	 * @author 최보원
	 */
	List<CourseVo> getList2(Long studno);
	/**
	 * 관리자<br>
	 * 수업 총 갯수
	 * @author 최보원
	 */
	int getTotal(Criteria cri);
	/**
	 * 관리자+학생<br>
	 * 수업 신청 인원
	 * @author 최보원
	 */
	int getCnt(Long courno);
	/**
	 * 학생<br>
	 * 수강신청시 시간 중복 체크
	 * @author 최보원
	 */
	List<EnrollclassVo> getOverlap(@Param("studno") Long studno, String day);
}
