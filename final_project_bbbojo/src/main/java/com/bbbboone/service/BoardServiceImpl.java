package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bbbboone.domain.AttachVo;
import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.mapper.AttachMapper;
import com.bbbboone.mapper.BoardMapper;
import com.bbbboone.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;
	private AttachMapper attachMapper;
	
	@Override @Transactional
	public void register(BoardVo boardVo) {
		boardMapper.insertSelectKey(boardVo);
		
		boardVo.getAttachs().forEach(attach->{
			attach.setBno(boardVo.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVo get(Long bno) {
		return boardMapper.read(bno);
	}

	@Override @Transactional
	public boolean modify(BoardVo boardVo) {
		boolean result = boardMapper.update(boardVo) > 0;
		
		attachMapper.deleteAll(boardVo.getBno());
		if(result) {
			boardVo.getAttachs().forEach(vo-> {
				vo.setBno(boardVo.getBno());
				attachMapper.insert(vo);
			});
		}
		
		return result;
	}

	@Override @Transactional
	public boolean remove(Long bno) {
		attachMapper.deleteAll(bno);
		return boardMapper.delete(bno) >0 ;
	}

	@Override
	public List<BoardVo> getList(Criteria cri, int category) {
		return boardMapper.getListWithPaging(cri, category);
	}

	@Override
	public int getTotal(Criteria cri, int category) {
		return boardMapper.getTotalCount(cri, category);
	}

	@Override
	public List<AttachVo> getAttachs(Long bno) {
		return attachMapper.findByBno(bno);
	}

}

