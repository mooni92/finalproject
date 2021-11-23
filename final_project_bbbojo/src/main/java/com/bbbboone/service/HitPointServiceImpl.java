package com.bbbboone.service;

import org.springframework.stereotype.Service;

import com.bbbboone.mapper.HitPointMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HitPointServiceImpl implements HitPointService{
	private HitPointMapper mapper;
	
	@Override
	public String get(Long bno) {
		return mapper.countByBno(bno);
	}
	

}
