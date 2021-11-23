package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.SubjectVo;
import com.bbbboone.mapper.SubjectMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SubjectServiceImpl implements SubjectService{
	private SubjectMapper subjectMapper;

	@Override
	public void register(SubjectVo vo) {
		subjectMapper.insert(vo);
	}

	@Override
	public SubjectVo get(String subno) {
		return subjectMapper.read(subno);
	}

	@Override
	public List<SubjectVo> getList(Long courno) {
		return subjectMapper.getList(courno);
	}

	@Override
	public boolean modify(SubjectVo vo) {
		return subjectMapper.update(vo) > 0;
	}

	@Override
	public boolean remove(String subno) {
		return subjectMapper.delete(subno) > 0;
	}

}
