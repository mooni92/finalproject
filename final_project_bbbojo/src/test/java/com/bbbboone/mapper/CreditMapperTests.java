package com.bbbboone.mapper;

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
public class CreditMapperTests {
	
	@Setter @Autowired
	private CreditMapper mapper;
	
	/*
	 * 학점 입력 테스트
	 * */
	@Test
	public void testInsert() {
		mapper.insert(new CreditVo(123123L, "테스트과목"));
		
	}

	/*
	 * 학점 삭제 테스트
	 * */
	@Test
	public void testDelete() {
		mapper.delete(123123L);
	}
	/*
	 * 학점 삭제 테스트
	 * */
	@Test
	public void testDeleteOne() {
		mapper.deleteOne(4L);
	}
	@Test
	public void testgetStudent() {
		mapper.getStudent(123123L).forEach(log::info);
	}
	
}
