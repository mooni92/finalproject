package com.bbbboone.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.BoardVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.HitPointVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class HitPointMapperTests {
	@Setter @Autowired
	private HitPointMapper mapper;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	/*
	 * 전체 게시글 조회 테스트
	 * */
	@Test
	public void textInsert() {
		HitPointVo hitpoint = new HitPointVo();
		hitpoint.setId("kwak");
		hitpoint.setBno(128L);
		mapper.insert(hitpoint);
	}
	
	@Test
	public void testHitdown() {
		HitPointVo hitpoint = new HitPointVo();
		hitpoint.setId("kwak");
		hitpoint.setBno(128L);
		mapper.hitDown(hitpoint);
	}
	
	@Test
	public void testCountByBno() {
		mapper.countByBno(128L);
	}
	
	
	
	
}