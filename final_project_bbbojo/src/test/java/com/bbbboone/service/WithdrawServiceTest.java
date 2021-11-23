package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.WithdrawVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class WithdrawServiceTest {
	@Setter @Autowired
	private WithdrawService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(log::info);
	}
	
	@Test
	public void testGetListWithPaging() {
		service.getList(new Criteria()).forEach(log::info);
	}
	
	
	@Test
	public void testRegister() {
		WithdrawVo vo = new WithdrawVo();
		vo.setId("sichanzz");
		vo.setComments("서비스 테스트");
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get("sichanzz"));
	}
	
	@Test
	public void testModify() {
		WithdrawVo vo = new WithdrawVo();
		vo.setComments("매퍼 테스트 수정");
		vo.setId("sichanzz");
		log.info(service.modify(vo));
	}
	
	@Test
	public void testRemove() {
		log.info(service.remove("sichanzz"));
	}
	
	@Test
	public void testGetTotalCount() {
		log.info(service.getTotal(new Criteria()));
	}
	
}
