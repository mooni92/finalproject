package com.bbbboone.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.CourseVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.SubjectVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CourseMapperTest {
	@Setter @Autowired
	private CourseMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
	}
	
	@Test
	public void testGetList2() {
		mapper.getList2(201910101L).forEach(log::info);
	}
	
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria();
//		cri.setType("N");
//		cri.setKeyword("응용");
		mapper.getListWithPaging(cri).forEach(log::info);
	}
	
	@Test
	public void testInsert() {
		CourseVo vo = new CourseVo();
		vo.setName("테스트 수업개설");
		vo.setStartTime(10L);
		vo.setEndTime(13L);
		vo.setMaxCnt(20);
		vo.setPic("최보원");
		vo.setProfno(260L);
		vo.setDeptno(101L);
		vo.setDay("화");
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(23L));
	}
	
	@Test
	public void testUpdate() {
		CourseVo vo = new CourseVo();
		vo.setCourno(21L);
		vo.setName("테스트 수정 수업개설");
		vo.setStartTime(11L);
		vo.setEndTime(13L);
		vo.setMaxCnt(15);
		vo.setPic("오석호");
		vo.setProfno(250L);
		vo.setDeptno(101L);
		vo.setDay("화");
		log.info(mapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(61L));
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		log.info(mapper.getTotalCount(cri));
	}
	
	@Test
	public void testGetCntCount() {
		log.info(mapper.getCntCount(2L));
	}
}
