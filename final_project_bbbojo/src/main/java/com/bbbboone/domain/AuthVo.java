package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Alias("auth") @NoArgsConstructor @AllArgsConstructor
public class AuthVo {
	private String id;
	private String auth;
}
