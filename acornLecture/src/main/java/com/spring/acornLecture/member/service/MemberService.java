package com.spring.acornLecture.member.service;

import java.util.List;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberService {

	void addMember(MemberDTO member);

	MemberDTO login(MemberDTO member);

	int idCheck(String id);

	MemberDTO selectMember(String id);

	void modMember(MemberDTO member);

	MemberDTO selectGrade(String grade);

	List<LectureDTO> selectStuLectureList(String member_id);
	
	List<LectureDTO> selectProLectureList(String member_id);
}
