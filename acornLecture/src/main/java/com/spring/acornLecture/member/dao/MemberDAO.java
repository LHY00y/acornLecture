package com.spring.acornLecture.member.dao;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberDAO {

	void insertMember(MemberDTO member);

	MemberDTO loginById(MemberDTO member);

	int selectAllId(String id);

	MemberDTO selectMember(String id);

	void updateMember(MemberDTO member);

	MemberDTO selectGrade(String grade);

	List<LectureDTO> selectStuLectureList(String member_id);
	
	List<LectureDTO> selectProLectureList(String member_id);

	void deleteLecture(String member_id, Integer lecture_id);
	
	void removeMember(String member_id);

	void removeMemBoard(String member_id);

	void removeMemLecture(String member_id);
}
