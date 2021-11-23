package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.mapper.CourseMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CourseServiceImpl implements CourseService{
	private CourseMapper courseMapper;
	
	@Override
	public void register(CourseVo vo) {
		courseMapper.insert(vo);
	}

	@Override
	public CourseVo get(Long courno) {
		return courseMapper.read(courno);
	}

	@Override
	public boolean modify(CourseVo vo) {
		return courseMapper.update(vo) > 0;
	}

	@Override
	public boolean remove(Long courno) {
		return courseMapper.delete(courno) > 0;
	}

	@Override
	public List<CourseVo> getList() {
		return courseMapper.getList();
	}

	@Override
	public List<CourseVo> getList2(Long studno) {
		return courseMapper.getList2(studno);
	}

	@Override
	public List<CourseVo> getList(Criteria cri) {
		return courseMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return courseMapper.getTotalCount(cri);
	}

	@Override
	public int getCnt(Long courno) {
		return courseMapper.getCntCount(courno);
	}

	@Override
	public List<EnrollclassVo> getOverlap(Long studno, String day) {
		return courseMapper.getOverlap(studno, day);
	}
}
