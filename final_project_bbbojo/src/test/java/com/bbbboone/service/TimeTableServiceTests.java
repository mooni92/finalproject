package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.TimeTableVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class TimeTableServiceTests {
	@Setter @Autowired
	private TimeTableService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testGetList(){
		log.info(service.getList(123123L));
	}
	
	@Test
	public void testRegister() {
		TimeTableVo vo = new TimeTableVo();
		List<TimeTableVo> vo2 = new ArrayList<TimeTableVo>();
		vo2.add(new TimeTableVo("테스트", "0", new Date(2021, 10, 10), new Date(2021, 10, 10), 1231223L));
		service.register(vo2);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(123123L));
	}
	
	
	@Test
	public void testRemove(){
		log.info(service.remove(123123L));
	}
	@Test
	public void testRemoveOne(){
		log.info(service.removeOne(150L));
	}
	
}
