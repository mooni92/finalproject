package com.bbbboone.domain;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("timeTable")
public class TimeTableVo {
	private String title;
	private String allday;
	private Date end;
	private Date start;
	private Long studno;
	private Long id;
	
	public TimeTableVo(Long studno, String courno) {
		super();
		this.studno = studno;
		this.title = courno;
	}

	public TimeTableVo() {
		super();
	}

	public TimeTableVo(String title, String allday, Date end, Date start, Long studno) {
		super();
		this.title = title;
		this.allday = allday;
		this.end = end;
		this.start = start;
		this.studno = studno;
	}

	
	
}
