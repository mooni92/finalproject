package com.bbbboone.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.SubjectVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class SubjectMapperTest {
	@Setter @Autowired
	private SubjectMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList(1L).forEach(log::info);
	}
	
	@Test
	public void testInsert() {
		SubjectVo vo = new SubjectVo();
		vo.setSubno("A05");
		vo.setName("다시 추가한 과목명");
		vo.setCourno(1L);
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read("A05"));
	}
	
	@Test
	public void testUpdate() {
		SubjectVo vo = new SubjectVo();
		vo.setName("수정한 과목명");
		vo.setSubno("A05");
		log.info(mapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete("A05"));
	}
	
}
