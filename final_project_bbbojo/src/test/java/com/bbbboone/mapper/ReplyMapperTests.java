package com.bbbboone.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.ReplyCriteria;
import com.bbbboone.domain.ReplyVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyMapperTests {
	@Setter @Autowired
	private ReplyMapper mapper;
	
	/*
	 * 널 값 테스트
	 * */
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	/*
	 * 댓글 입력 테스트
	 * */
	@Test
	public void testInsert() {
		IntStream.range(0,2).forEach(i->{
			ReplyVo vo = new ReplyVo();
			
			vo.setBno(49L);
			vo.setContent("댓글 테스트 " + i);
			vo.setWriter("kokoji");
			
			mapper.insert(vo);
		});
	}
	
	/*
	 * 댓글 조회 테스트
	 * */
	@Test
	public void testRead() {
		log.info(mapper.read(41L));
		
	}
	
	/*
	 * 댓글 수정 테스트
	 * */
	@Test
	public void testUpdate() {
		ReplyVo reply = new ReplyVo();
		reply.setContent("수정된 댓글 테스트 내용");
		reply.setWriter("kokoji");
		reply.setRno(3L);
		log.info(mapper.update(reply));
		log.info(mapper.read(5L));
	}
	
	/*
	 * 댓글 삭제 테스트
	 * */
	@Test
	public void testRemove() {
		log.info(mapper.delete(14L));
		
	}
	
	/*
	 * 해당 게시글 전체 댓글 조회 테스트
	 * */
	@Test
	public void testGetList() {
		ReplyCriteria criteria = new ReplyCriteria();
		mapper.getList(13L, criteria).forEach(log::info);
	}
	@Test
	public void testWithdrawUpdate() {
		log.info(mapper.withdrawUpdate("firstsiha"));
	}
}

