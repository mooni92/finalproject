package com.bbbboone.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.bbbboone.domain.AttachDto;
import com.bbbboone.domain.TimeTableVo;
import com.bbbboone.mapper.AttachMapper;
import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class UploadControllerTests {
	  @Autowired @Setter
	   private BoardController controller;
	  @Autowired @Setter
	   private UploadController uploadController;
	  @Setter @Autowired
	  private AttachMapper attachMapper;
		
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
		public void testUpload() throws Exception{
			List<AttachDto> list = new ArrayList<>();
			list.add(new AttachDto());
			Gson gson = new Gson();
			String file = gson.toJson(list);
			ResultActions mav = mvc.perform(MockMvcRequestBuilders.post("/upload")
					.contentType(MediaType.APPLICATION_PROBLEM_JSON)
					.content(file))
					.andDo(print());
			
			log.info("file"+ file);
		}
	   
}
