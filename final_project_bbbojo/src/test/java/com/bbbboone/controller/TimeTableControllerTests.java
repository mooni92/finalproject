package com.bbbboone.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.bbbboone.domain.CreditVo;
import com.bbbboone.domain.TimeTableVo;
import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class TimeTableControllerTests {
	@Setter @Autowired 
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup(){
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	@Test
	public void testExist(){
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	@Test
	public void testCreate() throws Exception{
		List<TimeTableVo> list = new ArrayList<>();
		list.add(new TimeTableVo("테스트시간", "0", new Date(11), new Date(12), 201110101L));
		Gson gson = new Gson();
		String content = gson.toJson(list);
		ResultActions mav = mvc.perform(MockMvcRequestBuilders.post("/timeTable/new")
//				.param("studno", "201910101")
//				.param("courname", "생물"))
//				.param("vo", content))
				.contentType(MediaType.APPLICATION_PROBLEM_JSON)
				.content(content))
				.andDo(print());
		
		log.info("콘텐츠"+content);
	}
	@Test
	public void testGet() throws Exception{
		MvcResult view = mvc.perform(MockMvcRequestBuilders.get("/timeTable/get/201910101"))
				.andReturn();
		
		log.info("로그 ::"+view);
	}
	@Test
	public void testDelete() throws Exception{
		MvcResult view = mvc.perform(MockMvcRequestBuilders.delete("/timeTable/remove/201910101"))
				.andReturn();
		
		log.info("로그 ::"+view);
	}
	@Test
	public void testDeleteId() throws Exception{
		MvcResult view = mvc.perform(MockMvcRequestBuilders.delete("/timeTable/243"))
				.andReturn();
		
		log.info("로그 ::"+view);
	}
}
