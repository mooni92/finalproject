package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.CreditVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CreditServiceTest {
	@Setter @Autowired
	private CreditService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		List<CreditVo> list = new ArrayList<>();
		list.add(new CreditVo(1234L,"테스트1"));
		service.register(list);
	}
	
	@Test
	public void testGetList2() {
		service.getList(201110102L).forEach(log::info);
	}
	@Test
	public void testRemove(){
		log.info(service.remove(1234L));
	}
	@Test
	public void testRemoveOne(){
		log.info(service.removeOne(5L));
		
	}
}
