package com.bbbboone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.mapper.BoardMapper;
import com.bbbboone.mapper.MemberMapper;
import com.bbbboone.mapper.ReplyMapper;
import com.bbbboone.mapper.WithdrawMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class WithdrawServiceImpl implements WithdrawService{
	private WithdrawMapper withdrawMapper;
	private BoardMapper boardMapper;
	private ReplyMapper replyMapper;
	private MemberMapper memberMapper;

	@Override
	public void register(WithdrawVo vo) {
		replyMapper.withdraw(vo.getId(), "탈퇴회원");
		boardMapper.withdraw(vo.getId(), "탈퇴회원");
		memberMapper.delete(vo.getId());
		withdrawMapper.insert(vo);
	}

	@Override
	public WithdrawVo get(String id) {
		return withdrawMapper.read(id);
	}

	@Override
	public boolean modify(WithdrawVo vo) {
		return withdrawMapper.update(vo) > 0;
	}

	@Override
	public boolean remove(String id) {
		return withdrawMapper.delete(id) > 0;
	}

	@Override
	public List<WithdrawVo> getList() {
		return withdrawMapper.getList();
	}

	@Override
	public List<WithdrawVo> getList(Criteria cri) {
		return withdrawMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return withdrawMapper.getTotalCount(cri);
	}
}
