package com.spring.acornLecture.member.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.lecture.dao.LectureDAO;
import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.member.dto.MyPageDTO;
import com.spring.acornLecture.member.dto.ResponseMyLectureListDTO;

@Service
public class MyPageService {

	
	private final LectureDAO lectureDAO;
	
	@Autowired
	public MyPageService(LectureDAO lectureDAO) {
		// TODO Auto-generated constructor stub
		this.lectureDAO = lectureDAO;
	}
	
	public List<String> myPageForm(MyPageDTO myPageDTO) {
		
		List<String> lectureList = lectureDAO.myLecture(myPageDTO);
		ResponseMyLectureListDTO rmd = new ResponseMyLectureListDTO();
		for(List<String> result : lectureList) {
			rmd.setLecture_title(result);
		}
		return rmd.getLecture_title();
	}
}
