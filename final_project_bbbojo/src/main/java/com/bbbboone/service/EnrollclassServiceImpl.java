package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.mapper.EnrollclassMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EnrollclassServiceImpl implements EnrollclassService{
	private EnrollclassMapper enrollclassMapper;
	
	@Override
	public void register(EnrollclassVo vo) {
		System.out.println(vo);
		enrollclassMapper.insert(vo);
	}

	@Override
	public EnrollclassVo get(EnrollclassVo vo) {
		return enrollclassMapper.read(vo);
	}

	@Override
	public List<EnrollclassVo> getList() {
		return enrollclassMapper.getList();
	}

	@Override
	public boolean remove(EnrollclassVo vo) {
		return enrollclassMapper.delete(vo) > 0;
	}

	@Override
	public int getCount(Long courno) {
		return enrollclassMapper.getCount(courno);
	}
}
