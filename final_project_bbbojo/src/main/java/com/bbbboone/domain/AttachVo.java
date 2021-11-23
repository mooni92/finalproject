package com.bbbboone.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper=true) @Alias("attach")
public class AttachVo extends AttachDto{
	// 게시글 번호
	private Long bno;
}
