package com.bbbboone.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.bbbboone.domain.ReplyVo;
import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class ReplyControllerTests {
	
	  @Autowired @Setter
	   private BoardController controller;
	  @Autowired @Setter
	   private ReplyController replyController;
	  
	   @Autowired @Setter
	   private WebApplicationContext ctx;
	   private MockMvc mvc;
	   
	   @org.junit.Before
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
		public void testCreate() throws Exception {
			ReplyVo vo = new ReplyVo();
			vo.setBno(328L);
			vo.setContent("컨트롤러 테스트 댓글");
			vo.setWriter("테스터");
			Gson gson = new Gson();
			String jsonStr = gson.toJson(vo);
			
			log.info("jsonStr :: " + jsonStr);
			
			mvc.perform(post("/replies/new")
					.contentType(MediaType.APPLICATION_JSON_VALUE)
					.content(jsonStr))
					.andExpect(status().is(200));
		}
	   
		@Test
		public void testCreate2() throws Exception {
			ReplyVo vo = new ReplyVo();
			vo.setBno(328L);
			vo.setContent("컨트롤러 테스트 댓글");
			vo.setWriter("테스터");
			Gson gson = new Gson();
			String jsonStr = gson.toJson(vo);
			
			log.info("jsonStr :: " + jsonStr);
			
			mvc.perform(post("/replies/new2")
					.contentType(MediaType.APPLICATION_JSON_VALUE)
					.content(jsonStr))
					.andExpect(status().is(200));
		}
		
		@Test
		public void testGet() throws Exception{
			MvcResult reply = mvc.perform(MockMvcRequestBuilders.get("/replies/get/547"))
					.andReturn();
			
			log.info("로그 ::"+reply);
		}
		
		@Test
		public void testModify() throws Exception{
			MvcResult reply = mvc.perform(MockMvcRequestBuilders.put("/replies/modify/547"))
					.andReturn();
			
			log.info("로그 ::"+reply);
		}
		@Test
		public void testRemove() throws Exception{
			MvcResult reply = mvc.perform(MockMvcRequestBuilders.delete("/replies/remove/547"))
					.andReturn();
			
			log.info("로그 ::"+ reply);
		}
		@Test
		public void testgetList() throws Exception{
			MvcResult reply = mvc.perform(MockMvcRequestBuilders.get("/replies/308/2/548"))
					.andReturn();
			
			log.info("로그 ::"+ reply);
		}

}
