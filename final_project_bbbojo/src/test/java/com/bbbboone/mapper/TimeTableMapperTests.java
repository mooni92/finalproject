package com.bbbboone.mapper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.TimeTableVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class TimeTableMapperTests {
	@Setter @Autowired
	private TimeTableMapper mapper;
	
	@Test
	public void testGet(){
		log.info(mapper.getList(202110113L));
	}
	@Test
	public void testInsert(){
		TimeTableVo vo = new TimeTableVo();
		vo.setTitle("테스트 제목");
		vo.setAllday("0");
		vo.setStart(new Date(2021, 10, 10));
		vo.setEnd(new Date(2021, 10, 10));
		vo.setStudno(123123L);
		log.info(mapper.insert(vo));
	}
	@Test
	public void testDelete(){
		log.info(mapper.delete(123123L));
	}
	@Test
	public void testDeleteOne(){
		log.info(mapper.deleteOne(143L));
	}
	@Test
	public void testRead(){
		log.info(mapper.read(123123L));
	}
	

}
