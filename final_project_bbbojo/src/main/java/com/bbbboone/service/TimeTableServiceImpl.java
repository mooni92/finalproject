package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.TimeTableVo;
import com.bbbboone.mapper.TimeTableMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TimeTableServiceImpl implements TimeTableService {
	private TimeTableMapper mapper;
	
	@Override
	public boolean register(List<TimeTableVo> vo) {
		int a = 0;
		mapper.delete(vo.get(0).getStudno());
		for(int i =0; i < vo.size(); i++){
		TimeTableVo vo2 = new TimeTableVo();
		vo2.setTitle(vo.get(i).getTitle());
		vo2.setStart(vo.get(i).getStart());
		vo2.setEnd(vo.get(i).getEnd());
		vo2.setAllday(vo.get(i).getAllday());
		vo2.setStudno(vo.get(i).getStudno());
		a = mapper.insert(vo2);
		}
		return a > 0;
		
	}

	@Override
	public boolean remove(Long studno) {
		return mapper.delete(studno) > 0;
	}


	@Override
	public TimeTableVo get(Long studno) {
		// TODO Auto-generated method stub
		return mapper.read(studno);
	}

	@Override
	public List<TimeTableVo> getList(Long studno) {
		// TODO Auto-generated method stub
		return mapper.getList(studno);
	}

	@Override
	public boolean removeOne(Long id) {
		return mapper.deleteOne(id) > 0;
	}

}
