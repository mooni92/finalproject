package com.bbbboone.service;


import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bbbboone.domain.AuthVo;
import com.bbbboone.domain.Criteria;
import com.bbbboone.domain.EnrollclassVo;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.StudentVo;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.mapper.BoardMapper;
import com.bbbboone.mapper.MemberMapper;
import com.bbbboone.mapper.ReplyMapper;
import com.bbbboone.mapper.WithdrawMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {



	private MemberMapper memberMapper;
	private BoardMapper boardMapper;
	private ReplyMapper replyMapper;
	private WithdrawMapper withdrawMapper;
	@Setter @Autowired
	BCryptPasswordEncoder pwdEncoder;
	private WithdrawService wService;
	@Override @Transactional
	public void join(MemberVo member) {
		member.setPw(pwdEncoder.encode(member.getPw()));
		memberMapper.join(member); // insert tbl_member
		member.setAuths(Arrays.asList(new AuthVo[] {new AuthVo(member.getId(), "ROLE_USER")}));
		member.getAuths().forEach(memberMapper::insertAuth);
	}	


	@Override
	public void modify(MemberVo member) {
		member.setPw(pwdEncoder.encode(member.getPw()));
		memberMapper.modify(member);
	}

	@Override
	public void select(Long studno) {
		memberMapper.select(studno);	
	}

	@Override
	public void withdraw(MemberVo member) {
		member.setPw(pwdEncoder.encode(member.getPw()));
		WithdrawVo vo = new WithdrawVo();
		Date date = new java.sql.Date(new java.util.Date().getTime());
		vo.setId(member.getId());
		vo.setWdate(date);
		vo.setComments(vo.getComments());
		wService.register(vo);
		memberMapper.deleteAuth(member.getId());	
		memberMapper.withdraw(member);
	}

	@Override
	public MemberVo read(String id) {
		return memberMapper.read(id);
	}

	@Override
	public int idCheck(String id){
		return memberMapper.idCheck(id);
	}
	@Override
	public int wIdcheck(String id) {
		return memberMapper.wIdcheck(id);
	}

	@Override
	public int emailCheck(String email) {
		return memberMapper.emailCheck(email);
	}

	@Override
	public int phoneCheck(String phone) {
		return memberMapper.phoneCheck(phone);
	}

	@Override
	public int studnoCheck(int studno) {
		return memberMapper.studnoCheck(studno);
	}

	@Override
	public int studnoCheckatStudno(int studno) {
		// TODO Auto-generated method stub
		return memberMapper.studnoCheckAtstudent(studno);
	}

	@Override
	public List<EnrollclassVo> getEnrollList(Long courno) {
		return memberMapper.getEnrollList(courno);
	}

	@Override
	public List<MemberVo> getList(Criteria cri) {
		return memberMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return memberMapper.getTotalCount(cri);
	}

	@Override
	public boolean modifyAdmin(MemberVo vo) {
		return memberMapper.update(vo) > 0;
	}

	@Override
	public boolean remove(WithdrawVo vo) {
		boardMapper.withdrawUpdate(vo.getId());
		replyMapper.withdrawUpdate(vo.getId());
		memberMapper.deleteAuth(vo.getId());
		memberMapper.delete(vo.getId());
		return  withdrawMapper.insert(vo)> 0;
	}

	@Override
	public void confirmPhoneNumber(String phoneNumber, String cerNum) {
        String api_key = "NCS2AJ4WLT3NYAWQ";
        String api_secret = "NZ2IENHP5XBZKBCYUD8OHUHJFSIRHMHT";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "01051292847");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "휴대폰인증 테스트 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}

	@Override
	public StudentVo studonovalue(long studno) {
		StudentVo vo = memberMapper.studnovalue(studno);
		return vo;
	}


	@Override
	public List<MemberVo> checkGrade(String grade) {
		return memberMapper.checkGrade(grade);
	}

	@Override
	public int deleteAuth(String id) {
		return memberMapper.deleteAuth(id);
	}



}


