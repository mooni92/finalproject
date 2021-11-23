package com.bbbboone.controller;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class CourseControllerTests {
	@Setter @Autowired
	private CourseController controller;
	
	@Setter @Autowired
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testExist() {
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	
	@Test
	public void testEnrollclass() throws Exception {
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/course/enrollclass")
				.param("pageNum", "1")
				.param("amount", "4")
				)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list = (List<?>) map.get("courseList");
		list.forEach(log::info);
	}
	
	@Test
	public void testGet() throws Exception {
		MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/course/1")
				//.param("courno", "1")
				)
				.andReturn()
				//.getModelAndView()
				//.getModelMap()
				;
		
		log.info("get :: " + result);
	}
	
	@Test
	public void testList() throws Exception {
		MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/course/list/201910101"))
				.andReturn();
		
		log.info("list :: " + result);
	}
	
	@Test
	public void testCheck() throws Exception	 {
		MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/course/201910101/월"))
				.andReturn();
		
		log.info("check ::" + result);
	}
}
