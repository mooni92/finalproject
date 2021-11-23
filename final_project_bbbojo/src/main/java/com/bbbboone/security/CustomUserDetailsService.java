package com.bbbboone.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.bbbboone.domain.MemberVo;
import com.bbbboone.mapper.MemberMapper;
import com.bbbboone.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Component
@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired @Setter
	private MemberMapper mapper;
	@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		log.warn(arg0);
		MemberVo vo = mapper.read(arg0);
		return vo == null ? null : new CustomUser(vo);
	}

}
