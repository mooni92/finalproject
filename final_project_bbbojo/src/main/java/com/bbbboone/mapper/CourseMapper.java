package com.bbbboone.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;

public interface CourseMapper {
	/**
	 * 관리자<br>
	 * 수업개설
	 * @author 최보원
	 */
	void insert(CourseVo vo);
	/**
	 * 관리자<br>
	 * 수업번호로 단일 조회
	 * @author 최보원
	 */
	CourseVo read(Long courno);
	/**
	 * 관리자<br>
	 * 수업 수정
	 * @author 최보원
	 */
	int update(CourseVo vo);
	/**
	 * 관리자<br>
	 * 수업번호로 수업 삭제
	 * @author 최보원
	 */
	int delete(Long courno);
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
	List<CourseVo> getListWithPaging(Criteria cri);
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
	int getTotalCount(Criteria cri);
	/**
	 * 관리자+학생<br>
	 * 수업 신청 인원
	 * @author 최보원
	 */
	int getCntCount(Long courno);
	/**
	 * 학생<br>
	 * 수강신청시 시간 중복 체크
	 * @author 최보원
	 */
	List<EnrollclassVo> getOverlap(@Param("studno") Long studno, @Param("day") String day);
}
