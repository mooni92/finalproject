package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.CreditVo;
import com.bbbboone.domain.TimeTableVo;
import com.bbbboone.mapper.CreditMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CreditServiceImple implements CreditService{
	private CreditMapper creditMapper;

	@Override
	public void register(List<CreditVo> vo) {
		creditMapper.delete(vo.get(0).getStudno());
		for(int i =0; i < vo.size(); i++){
		CreditVo vo2 = new CreditVo();
		vo2.setCourname(vo.get(i).getCourname());
		vo2.setStudno(vo.get(i).getStudno());
		creditMapper.insert(vo2);
		}
	}


	@Override
	public boolean remove(Long studno) {
		return creditMapper.delete(studno) > 0;
	}
	@Override
	public boolean removeOne(Long credno) {
		return creditMapper.deleteOne(credno) > 0;
	}


	@Override
	public List<CreditVo> getList(Long studno) {
		return creditMapper.getStudent(studno);
	}
}
