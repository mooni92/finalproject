package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bbbboone.domain.ReplyCriteria;
import com.bbbboone.domain.ReplyVo;
import com.bbbboone.mapper.BoardMapper;
import com.bbbboone.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor @Service
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper mapper;
	private BoardMapper boardMapper;
	
	@Override
	@Transactional
	public void register(ReplyVo vo) {
		// 작업1
		mapper.insert(vo);
		// 작업2
		boardMapper.updateReplyCnt(vo.getBno(),	1);
	}
	@Override
	@Transactional
	public void register2(ReplyVo vo) {
		// 작업1
		if(vo.getGroupOrd() == null){
			
		}
		vo.setGroupOrd(mapper.count(vo.getOriginNo()));
		mapper.insert2(vo);
	}

	@Override
	public ReplyVo get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public boolean modify(ReplyVo vo) {
		return mapper.update(vo) > 0;
	}

	@Override
	@Transactional
	public boolean remove(Long rno) {
		return mapper.delete(rno) > 0;
	}

	@Override
	public boolean removeReply(Long bno) {
		return mapper.deleteReply(bno) > 0;
	}
	 @Override
	   public List<ReplyVo> getList(ReplyCriteria cri, Long bno) {
	      return mapper.getList(bno, cri);
	   }
	
}
