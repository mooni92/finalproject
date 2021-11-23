package com.bbbboone.mapper;

import java.util.List;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.WithdrawVo;

public interface WithdrawMapper {
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
	List<WithdrawVo> getListWithPaging(Criteria cri);
	/**
	 * 관리자<br>
	 * 탈퇴회원 총 수
	 * @author 최보원
	 */
	int getTotalCount(Criteria cri);
	/**
	 * 관리자<br>
	 * 탈퇴회원 삭제
	 * @author 최보원
	 */
	int delete(String id);
	/**
	 * 관리자<br>
	 * 탈퇴회원 단일조회
	 * @author 최보원
	 */
	WithdrawVo read(String id);
	/**
	 * 관리자<br>
	 * 탈퇴회원 추가
	 * @author 최보원
	 */
	int insert(WithdrawVo vo);
	/**
	 * 관리자<br>
	 * 탈퇴 사유 수정
	 * @author 최보원
	 */
	int update(WithdrawVo vo);
}
