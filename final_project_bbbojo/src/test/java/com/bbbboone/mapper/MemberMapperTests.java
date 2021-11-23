package com.bbbboone.mapper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.WithdrawVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {
	@Setter @Autowired
	private MemberMapper mapper;
	@Setter @Autowired
	private WithdrawMapper wmapper;
	/*
	 * 조인 테스트 코드 member 패스워드 암호화 테스트 코스
	 * 10.25 곽승협
	 */
	@Setter @Autowired
	private BCryptPasswordEncoder pwencoder;
	@Setter @Autowired
	private DataSource ds;
	@Test
	public void testInsertMember(){
		String sql = "INSERT INTO TBL_MEMBER(ID,PW,NAME,NICKNAME,EMAIL,PHONENUM,GRADE,STUDNO)"
				+ "VALUES(?,?,?,?,?,?,?,?)";
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		
  		try {
  			con =  ds.getConnection();
  	  		pstmt= con.prepareStatement(sql);
  	  		pstmt.setString(2, pwencoder.encode("pw00"));
  			pstmt.setString(1, "kang");
			pstmt.setString(3, "강민호");
			pstmt.setString(4, "대갈장군");
			pstmt.setString(5, "kang47@gmail.com");
			pstmt.setString(6, "010-1331-1351");
			pstmt.setString(7, "테스트");
			pstmt.setString(8,"201110104");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testInsertAuth(){
		String sql = "INSERT INTO TBL_AUTH(ID,AUTH) VALUES"
				+ "(?,?)";
		Connection con = null;
  		PreparedStatement pstmt = null;
  		try {
  			con =  ds.getConnection();
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, "firstsiha");
			pstmt.setString(2, "ROLE_USER");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testRead(){
		MemberVo vo = mapper.read("kwak");
		log.info(vo);
		vo.getAuths().forEach(log::info);
	}
	/*
	 * member 패스워드 암호화 테스트 코스
	 */
	@Test
	public void joinTest(){
		MemberVo member = new MemberVo();
		member.setId("park33");
		member.setPw("1234");
		member.setName("박용택");
		member.setNickname("찬물택");
		member.setEmail("park33@gmail.com");
		member.setPhonenum("010-1234-4567");
		member.setGrade("재학생");
		member.setStudno(201110102L);
		log.info(member);
		mapper.join(member);
	}
	@Test
	public void selectTest(){
		mapper.select(201110104L);
	}
	@Test
	public void selectTest1() {
		mapper.login("park33", "1234");
	}
	@Test
	public void modifyTest() {
		MemberVo member = new MemberVo();
		mapper.select(201510619L);
		member.setId("firstsiha");
		member.setPw(pwencoder.encode("pw00"));
		member.setName("장시하");
		member.setNickname("사회학과수석");
		member.setEmail("qwer20@naver.com");
		member.setPhonenum("01022552222");
		member.setStudno(201510619L);
		member.setGrade("졸업생");
		mapper.modify(member);
		mapper.select(201510619L);
	}
	
	@Test
	public void deleteTest() {
		MemberVo vo=new MemberVo();
		WithdrawVo wvo = new WithdrawVo();
		Date date =new java.sql.Date(new java.util.Date().getTime());
		vo.setPw(pwencoder.encode("pw00"));
		log.info(vo.getPw());
		vo.setId("kang");
		log.info(vo);
		wvo.setId(vo.getId());
		wvo.setWdate(date);
		wvo.setComments("재미없어서");
		log.info(wvo);
		mapper.deleteAuth(vo.getId());
		mapper.withdrawReplyupdate(vo.getId());
		mapper.withdrawBoardupdate(vo.getId());
		mapper.withdraw(vo);
		wmapper.insert(wvo);
		mapper.select(201110104L);
	}
	@Test
	public void readTest(){
		MemberVo vo = mapper.read("kokoji");
		log.info(vo);
		vo.getAuths().forEach(log::info);
	}
	// 아이디 중복검사
	@Test
	public void memberIdChk() throws Exception{
		String id = "qwcv";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		mapper.idCheck(id);
		mapper.idCheck(id2);
	}
	// 이메일 중복검사
	@Test
	public void memberEmailChk() throws Exception{
		String email = "qwcvxzber@naver.com";	// 존재하는 이메일
		String email2 = "test123@naver.com";	// 존재하지 않는 이메일
		mapper.emailCheck(email);
		mapper.emailCheck(email2);
	}
	// 전화번호 중복검사
	@Test
	public void memberPhoneChk() throws Exception{
		String phone = "010-2321-2312";	// 존재하는 이메일
		String phone2 = "010-2323-2313";	// 존재하지 않는 이메일
		mapper.phoneCheck(phone);
		mapper.phoneCheck(phone2);
	}
	@Test
	public void studnoValuechk() {
		Long studno1 = 201110103L;
		mapper.studnovalue(studno1);
		log.info(studno1);
	}
	@Test
	public void testGetEnrollList() {
		mapper.getEnrollList(1L).forEach(log::info);
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		mapper.getList(cri).forEach(log::info);
	}
	
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria();
		mapper.getListWithPaging(cri).forEach(log::info);
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		log.info(mapper.getTotalCount(cri));
	}
}
