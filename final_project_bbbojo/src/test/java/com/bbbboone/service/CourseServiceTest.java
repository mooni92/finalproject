package com.bbbboone.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CourseServiceTest {
	@Setter @Autowired
	private CourseService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(log::info);
	}
	
	@Test
	public void testGetList2() {
		service.getList2(201910101L).forEach(log::info);
	}
	
	@Test
	public void testRegister() {
		CourseVo vo = new CourseVo();
		vo.setName("서비스테스트 수업개설");
		vo.setStartTime(10L);
		vo.setEndTime(13L);
		vo.setMaxCnt(20);
		vo.setPic("최보원");
		vo.setProfno(260L);
		vo.setDeptno(101L);
		vo.setDay("화");
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(25L));
	}
	
	@Test
	public void testModify() {
		CourseVo vo = new CourseVo();
		vo.setCourno(25L);
		vo.setName("서비스테스트 수정 수업개설");
		vo.setStartTime(11L);
		vo.setEndTime(13L);
		vo.setMaxCnt(15);
		vo.setPic("오석호");
		vo.setProfno(250L);
		vo.setDeptno(101L);
		vo.setDay("화");
		log.info(service.modify(vo));
	}
	
	@Test
	public void testRemove() {
		log.info(service.get(25L));
		log.info(service.remove(25L));
		log.info(service.get(25L));
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		log.info(service.getTotal(cri));
	}
	
	@Test
	public void testGetCntCount() {
		log.info(service.getCnt(3L));
	}
}
