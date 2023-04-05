package com.spring.acornLecture.member.dao;

import java.util.List;

import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberDAO {

	void insertMember(MemberDTO member);

	MemberDTO loginById(MemberDTO member);

	int selectAllId(String id);

	MemberDTO selectMember(String id);

	void updateMember(MemberDTO member);

	MemberDTO selectGrade(String grade);

	List<Member_LectureDTO> selectLectureList(String member_id);
}
