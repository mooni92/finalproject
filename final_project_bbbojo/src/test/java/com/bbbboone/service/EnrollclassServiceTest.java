package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.EnrollclassVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class EnrollclassServiceTest {
	@Setter @Autowired
	private EnrollclassService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(log::info);
	}
	
	@Test
	public void testRegister() {
		EnrollclassVo vo = new EnrollclassVo();
		vo.setCourno(4L);
		vo.setStudno(202110113L);
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(new EnrollclassVo(1L, 202110113L)));
	}
	
	@Test
	public void testRemove() {
		log.info(service.get(new EnrollclassVo(2L, 202110112L)));
		log.info(service.remove(new EnrollclassVo(2L, 202110112L)));
		log.info(service.get(new EnrollclassVo(2L, 202110112L)));
	}
	
	@Test
	public void testGetCount() {
		log.info(service.getCount(1L));
	}
}
