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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class AdminWithdrawControllerTests {
	@Setter @Autowired
	private AdminWithdrawController controller;
	
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
	public void testList() throws Exception {
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/adminWithdraw/list")
				.param("pageNum", "1")
				.param("amount", "4")
				)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list = (List<?>) map.get("list");
		list.forEach(log::info);
	}
	
	@Test
	public void testGet() throws Exception {
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/adminWithdraw/get").param("id", "firstsiha"))
				.andReturn()
				.getModelAndView()
				.getModelMap();
		
		log.info(map.get("withdraw"));
	}
	
	@Test
	public void testModify() throws Exception {
		ModelAndView mav = mvc.perform(
				MockMvcRequestBuilders.post("/adminWithdraw/modify")
				.param("id", "firstsiha")
				.param("comments", "테스트 수정")
				)
				.andReturn()
				.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	@Test
	public void testRemove() throws Exception {
		ModelMap map = mvc.perform(
				MockMvcRequestBuilders.post("/adminWithdraw/remove")
				.param("id", "firstsiha"))
				.andReturn()
				.getModelAndView()
				.getModelMap();
		
		log.info("remove :: " + map);
	}
}
