package com.spring.acornLecture.member.service;

import java.util.List;

import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberService {

	void addMember(MemberDTO member);

	MemberDTO login(MemberDTO member);

	int idCheck(String id);

	MemberDTO selectMember(String id);

	void modMember(MemberDTO member);

	MemberDTO selectGrade(String grade);

	List<String> selectStuLectureList(String member_id);
	
	List<String> selectProLectureList(String member_id);
}
