package com.spring.acornLecture.lecture.dto;

import java.sql.Date;

public class MovieDTO {
	private int mvFileNo;
	private String mvFileName;
	private int lecture_id;
	private String mvTitle;
	private Date regDate;
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}
	public int getMvFileNo() {
		return mvFileNo;
	}
	public void setMvFileNo(int mvFileNo) {
		this.mvFileNo = mvFileNo;
	}
	public String getMvFileName() {
		return mvFileName;
	}
	public void setMvFileName(String mvFileName) {
		this.mvFileName = mvFileName;
	}
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	
	
}
