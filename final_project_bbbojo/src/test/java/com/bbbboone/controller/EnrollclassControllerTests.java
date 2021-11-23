package com.bbbboone.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.bbbboone.domain.EnrollclassVo;
import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class EnrollclassControllerTests {
	@Autowired @Setter
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testCreate() throws Exception {
		EnrollclassVo vo = new EnrollclassVo();
		vo.setCourno(1L);
		vo.setStudno(201110101L);
		
		String jsonStr = new Gson().toJson(vo);
		
		log.info("jsonStr :: " + jsonStr);
		
		mvc.perform(post("/enrollclass/new")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
				.andExpect(status().is(415));
	}
	
	@Test
	public void testGet() throws Exception {
		MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/enrollclass/1/201910101")
				)
				.andReturn();
		
		log.info("get :: " + result);
	}
	
	@Test
	public void testRemove() throws Exception {
		MvcResult result = mvc.perform(MockMvcRequestBuilders.delete("/enrollclass/1/201910101"))
				.andReturn();
		
		log.info("remove :: " + result);
	}
}
