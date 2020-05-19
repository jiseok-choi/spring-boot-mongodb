package com.dxteam.onboard.dto;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection = "board")
public class BoardDTO {
	
	@Id
	private String id;
	private String title, content, writer;
	
	//데이터를 입력하면 날짜형 데이터로 자동 바꿈
	@DateTimeFormat(pattern="YYYY-MM-DD")
	private Date writeDate;
	private int hit;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "BoardDTO [title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writeDate=" + writeDate + ", hit=" + hit + "]";
	}
}
