package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.MemberVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberServiceTests {
	@Setter @Autowired
	private MemberService service;
	@Setter @Autowired
	PasswordEncoder Encoder;
	@Test
	public void testExist() {
		assertNotNull(service);
		assertNotNull(Encoder);
		log.info(service);
		log.info(Encoder);
	
	}
	@Test
	public void wIdcheck() {
		MemberVo vo = new MemberVo();
		vo.setId("five2244");
		service.wIdcheck(vo.getId());
		vo.setId("test");
		service.wIdcheck(vo.getId());
	}
	@Test
	public void testGetEnrollList() {
		service.getEnrollList(1L).forEach(log::info);
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		service.getList(cri).forEach(log::info);
	}
	
	@Test
	public void testGetTotal() {
		Criteria cri = new Criteria();
		log.info(service.getTotal(cri));
	}
}
