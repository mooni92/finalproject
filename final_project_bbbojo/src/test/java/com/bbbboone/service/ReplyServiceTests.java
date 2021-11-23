package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

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
public class ReplyServiceTests {
	@Setter @Autowired
	private ReplyService service;
	
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	
	@Test
	   public void testGetList(){
	      service.getList(new ReplyCriteria(),49L).forEach(log::info);
	   }
	
	@Test
	public void testRegister() {
		ReplyVo replyVo = new ReplyVo();
		replyVo.setContent("서비스 테스트 등록글 제목");
		replyVo.setWriter("kokoji");
		replyVo.setBno(54L);
		service.register(replyVo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(41L));
	}
	
	@Test
	public void testModify() {
		ReplyVo replyVo = new ReplyVo();
		replyVo.setContent("서비스 테스트 수정글 제목");
		replyVo.setWriter("kokoji");
		replyVo.setRno(7L);
		service.modify(replyVo);
	}
	
	@Test
	public void testRemove(){
		log.info(service.get(24L));
		log.info(service.remove(24L));
		log.info(service.get(24L));
	}
}
