package com.bbbboone.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class BoardMapperTests {
	@Setter @Autowired
	private BoardMapper mapper;
	
	/*
	 * 전체 게시글 조회 테스트
	 * */
	@Test
	public void tetGetList() {
		mapper.getList().forEach(log::info);
	}
	
	/*
	 * 페이지당 게시글 조회 테스트
	 * */
	@Test
	public void tetGetListPaging() {
		Criteria cri =  new Criteria();
		cri.setCategory(2);
		mapper.getListWithPaging(cri,2).forEach(log::info);
	}
	
	/*
	 * 게시글 입력 테스트
	 * */
	@Test
	public void testInsert(){
		BoardVo board = new BoardVo();
		board.setTitle("영속 테스트 제목");
		board.setContent("1영속 테스트 내용");
		board.setWriter("kokoji");
		mapper.insert(board);
	}
	
	/*
	 * 추가 행 게시글 출력 테스트
	 * */
	@Test
	public void testInsertSelectKey(){
		BoardVo board = new BoardVo();
		board.setTitle("영속 테스트 제목");
		board.setContent("영속 테스트 내용");
		board.setWriter("kokoji");
		log.info("before :: " +  board);
		mapper.insertSelectKey(board);
		log.info("after :: " + board);
	}
	
	/*
	 * 개별 게시글 조회 테스트
	 * */
	@Test
	public void testRead() {
		log.info(mapper.read(23L));
		
	}
	
	/*
	 * 게시글 수정 테스트
	 * */
	@Test
	public void testUpdate() {
		BoardVo board = new BoardVo();
		board.setTitle("수정된 영속 테스트 제목");
		board.setContent("수정된 영속 테스트 내용");
		board.setWriter("kokoji");
		board.setBno(25L);
		log.info(mapper.update(board));
		log.info(mapper.read(10L));
	}
	
	/*
	 * 게시글 삭제 테스트
	 * */
	@Test
	public void testDelete() {
		log.info(mapper.read(23L));
		log.info(mapper.delete(23L));
		log.info(mapper.read(23L));
		
	}
	
	
	/*
	 * 전체 게시글 갯수 조회
	 * */
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
//		cri.setType("T");
		cri.setKeyword("테스트");
		log.info(mapper.getTotalCount(cri,2));
	}
	@Test
	public void testWithdrawUpdate() {
		log.info(mapper.withdrawUpdate("firstsiha"));
	}
}