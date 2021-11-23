package com.bbbboone.mapper;

import java.util.List;

import com.bbbboone.domain.TimeTableVo;


public interface TimeTableMapper {
	/**
	 * 시간표<br> 
	 * 시간표 등록
	 * @author 오석호
	 */
	int insert(TimeTableVo vo);
	/**
	 * 시간표<br>
	 * 시간표 단일조회 (아직 안쓰임)
	 * @author 오석호
	 */
	TimeTableVo read(Long studno);
	/**
	 * 학생
	 * 수업 리스트 조회
	 * @author 오석호
	 */
	List<TimeTableVo> getList(Long studno);
	/**
	 * 학생+관리자<br>
	 * 시간표 삭제
	 * @author 오석호
	 */
	int delete(Long studno);
	/**
	 * 학생+관리자<br>
	 * 시간표 하나씩 삭제
	 * @author 오석호
	 */
	int deleteOne(Long id);
}
