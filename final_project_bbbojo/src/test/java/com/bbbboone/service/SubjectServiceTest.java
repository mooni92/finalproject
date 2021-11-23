package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.SubjectVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class SubjectServiceTest {
	@Setter @Autowired
	private SubjectService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testGetList() {
		service.getList(1L).forEach(log::info);
	}
	
	@Test
	public void testRegister() {
		SubjectVo vo = new SubjectVo();
		vo.setSubno("A05");
		vo.setName("서비스테스트 과목명");
		vo.setCourno(1L);
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get("A05"));
	}
	
	@Test
	public void testModify() {
		SubjectVo vo = new SubjectVo();
		vo.setSubno("A05");
		vo.setName("수정된 서비스테스트 과목명");
		vo.setCourno(1L);
		log.info(service.modify(vo));
	}
	
	@Test
	public void testRemove() {
		log.info(service.get("A05"));
		log.info(service.remove("A05"));
		log.info(service.get("A05"));
	}
}
