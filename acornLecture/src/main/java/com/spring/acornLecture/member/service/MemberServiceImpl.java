package com.spring.acornLecture.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dao.MemberDAO;
import com.spring.acornLecture.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;
	@Override
	public void addMember(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(member);
	}
	@Override
	public MemberDTO login(MemberDTO member) {
		// TODO Auto-generated method stub
		return memberDAO.loginById(member);
	}
	@Override
	public int idCheck(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectAllId(member_id);
	}
	@Override
	public MemberDTO selectMember(String id) {
		// TODO Auto-generated method stub
		return memberDAO.selectMember(id);
	}

	@Override
	public void modMember(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(member);
	}
	@Override
	public MemberDTO selectGrade(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectGrade(member_id);
	}
	@Override
	public List<LectureDTO> selectStuLectureList(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectStuLectureList(member_id);
	}
	@Override
	public List<LectureDTO> selectProLectureList(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectProLectureList(member_id);
	}
	@Override
	public void dropLecture(String member_id, int lecture_id) {
		// TODO Auto-generated method stub
		memberDAO.deleteLecture(member_id, lecture_id);
	}
	@Override
	public void removeMember(String member_id) {
		// TODO Auto-generated method stub
		memberDAO.removeMember(member_id);
		
	}
	@Override
	public void removeMemBoard(String member_id) {
		// TODO Auto-generated method stub
		memberDAO.removeMemBoard(member_id);
	}
	@Override
	public void removeMemLecture(String member_id) {
		// TODO Auto-generated method stub
		memberDAO.removeMemLecture(member_id);
	}
}
