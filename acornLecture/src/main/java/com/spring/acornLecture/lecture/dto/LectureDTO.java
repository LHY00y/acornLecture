package com.spring.acornLecture.lecture.dto;

import org.springframework.stereotype.Component;

@Component
public class LectureDTO {

	 private int lecture_id;
	 private String lecture_title;
	 private String professor_id;
	 private String category;
	 private int count;
	 private String schedule;
	 private String lecture_content;
	
	 public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getLecture_title() {
		return lecture_title;
	}
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	public String getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getLecture_content() {
		return lecture_content;
	}
	public void setLecture_content(String lecture_content) {
		this.lecture_content = lecture_content;
	}
	 
	 
}
