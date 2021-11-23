package com.bbbboone.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.bbbboone.domain.MemberVo;
import lombok.Getter;

@Getter
public class CustomUser extends User{
	private MemberVo memberVo;
	
	public CustomUser(String id, String pw, Collection<? extends GrantedAuthority> authorities) {
		super(id, pw, authorities);
	}

	public CustomUser(MemberVo vo) {
		super(vo.getId(),vo.getPw(),
				vo.getAuths().stream().map(
						a->new SimpleGrantedAuthority(a.getAuth())).collect(Collectors.toList()));
		this.memberVo = vo;
	}
}
