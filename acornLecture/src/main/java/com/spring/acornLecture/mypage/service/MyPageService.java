package com.spring.acornLecture.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.mypage.dao.MyPageDAO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	
	public List<LectureDTO> myLecture(MemberDTO member) {
		
		List<LectureDTO> lectureList = myPageDAO.selectMyLecture(member);
		
		return lectureList;
	}
}
