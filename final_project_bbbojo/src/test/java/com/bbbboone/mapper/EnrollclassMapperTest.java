package com.bbbboone.mapper;

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
public class EnrollclassMapperTest {
	@Setter @Autowired
	private EnrollclassMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
	}
	
	@Test
	public void testInsert() {
		EnrollclassVo vo = new EnrollclassVo();
		vo.setCourno(2L);
		vo.setStudno(202110112L);
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(new EnrollclassVo(1L, 202110112L)));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(new EnrollclassVo(1L, 202110112L)));
	}
	
	@Test
	public void testGetCount() {
		log.info(mapper.getCount(1L));
	}
	
}
