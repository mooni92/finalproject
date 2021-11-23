package com.bbbboone.service;

import java.util.List;

import com.bbbboone.domain.ReplyCriteria;
import com.bbbboone.domain.ReplyVo;

public interface ReplyService {
	void register(ReplyVo vo);
	void register2(ReplyVo vo);
	ReplyVo get(Long rno);
	boolean modify(ReplyVo vo);
	boolean remove(Long rno);
	boolean removeReply(Long bno);
	List<ReplyVo> getList(ReplyCriteria cri, Long bno);
}
