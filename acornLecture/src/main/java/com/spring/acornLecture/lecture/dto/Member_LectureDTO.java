package com.spring.acornLecture.lecture.dto;

import org.springframework.stereotype.Component;

@Component
public class Member_LectureDTO {
	private int ml_index;
	private String member_id;
	private int lecture_id;
	private int stuCount;
	public int getStuCount() {
		return stuCount;
	}
	public void setStuCount(int stuCount) {
		this.stuCount = stuCount;
	}
	public int getMl_index() {
		return ml_index;
	}
	public void setMl_index(int ml_index) {
		this.ml_index = ml_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	
	
}
