package com.bbbboone.service;

import java.util.List;

import com.bbbboone.domain.TimeTableVo;

public interface TimeTableService {
	/**
	 * 시간표<br> 
	 * 시간표 등록
	 * @author 오석호
	 */
	boolean register(List<TimeTableVo> vo);
	/**
	 * 시간표<br>
	 * 시간표 단일조회 미완성
	 * @author 오석호
	 */
	TimeTableVo get(Long studno);
	/**
	 * 학생+관리자<br>
	 * 시간표 삭제
	 * @author 오석호
	 */
	boolean remove(Long studno);
	/**
	 * 학생+관리자<br>
	 * 시간표 삭제
	 * @author 오석호
	 */
	boolean removeOne(Long id);
	/**
	 * 학생
	 * 수업 리스트 조회
	 * @author 오석호
	 */
	List<TimeTableVo> getList(Long studno);
}
