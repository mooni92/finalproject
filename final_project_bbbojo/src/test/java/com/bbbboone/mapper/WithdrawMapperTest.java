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
import com.bbbboone.domain.WithdrawVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class WithdrawMapperTest {
	@Setter @Autowired
	private WithdrawMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
	}
	
	@Test
	public void testGetListPaging() {
		mapper.getListWithPaging(new Criteria()).forEach(log::info);
	}
	
	@Test
	public void testInsert() {
		WithdrawVo vo = new WithdrawVo();
		vo.setId("sichanzz");
		vo.setComments("매퍼 테스트");
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read("sichanzz"));
	}
	
	@Test
	public void testUpdate() {
		WithdrawVo vo = new WithdrawVo();
		vo.setComments("매퍼 테스트 수정");
		vo.setId("sichanzz");
		log.info(mapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete("sichanzz"));
	}
	
	@Test
	public void testGetTotalCount() {
		log.info(mapper.getTotalCount(new Criteria()));
	}
	
}
