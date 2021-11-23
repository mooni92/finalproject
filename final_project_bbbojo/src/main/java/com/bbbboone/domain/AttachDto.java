package com.bbbboone.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttachDto {
	// 원본 이름
	private String origin;
	// 파일 경로
	private String path;
	// 파일 이름
	private String uuid;
	// 확장자
	private String ext;
	// 타입
	private String mime;
	// 파일 크기
	private Long size;
	// 이미지
	private boolean image;

	public AttachDto(String fullPath) {
		ext = fullPath.substring(fullPath.lastIndexOf(".") + 1);
		fullPath = fullPath.replace("." + ext, "");
		path = fullPath.substring(0, fullPath.lastIndexOf("/"));
		uuid = fullPath.substring(fullPath.lastIndexOf("/") + 1);
	}

	public String getThumb() {
		return path + "/s_" + uuid + "." + ext;
	}

	public String getFullPath() {
		return path + "/" + uuid + "." + ext;
	}
}
