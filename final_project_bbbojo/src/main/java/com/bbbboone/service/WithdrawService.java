package com.bbbboone.service;

import java.sql.Date;
import java.util.List;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.WithdrawVo;

public interface WithdrawService {
	/**
	 * 관리자<br>
	 * 탈퇴회원 추가
	 * @author 최보원
	 */
	void register(WithdrawVo vo);
	/**
	 * 관리자<br>
	 * 탈퇴회원 단일조회
	 * @author 최보원
	 */
	WithdrawVo get(String id);
	/**
	 * 관리자<br>
	 * 탈퇴 사유 수정
	 * @author 최보원
	 */
	boolean modify(WithdrawVo vo);
	/**
	 * 관리자<br>
	 * 탈퇴회원 삭제
	 * @author 최보원
	 */
	boolean remove(String id);
	/**
	 * 관리자<br>
	 * 탈퇴회원 리스트 조회
	 * @author 최보원
	 */
	List<WithdrawVo> getList();
	/**
	 * 관리자<br>
	 * 탈퇴회원 리스트 조회(페이징)
	 * @author 최보원
	 */
	List<WithdrawVo> getList(Criteria cri);
	/**
	 * 관리자<br>
	 * 탈퇴회원 총 수
	 * @author 최보원
	 */
	int getTotal(Criteria cri);
}
