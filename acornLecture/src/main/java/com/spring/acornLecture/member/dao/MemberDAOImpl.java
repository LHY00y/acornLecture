package com.spring.acornLecture.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberDTO member) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.insertMember", member);
	}

	@Override
	public MemberDTO loginById(MemberDTO member) {
		// TODO Auto-generated method stub
		member = sqlSession.selectOne("mapper.member.loginById", member);
		return member;
	}

	@Override
	public int selectAllId(String member_id) {
		// TODO Auto-generated method stub
		System.out.println("dao1");
		int result = sqlSession.selectOne("mapper.member.selectId", member_id);
		System.out.println("dao2");
		return result;
	}
	
	@Override
	public MemberDTO selectMember(String id) {
		// TODO Auto-generated method stub
		MemberDTO dto = (MemberDTO) sqlSession.selectOne("mapper.member.selectMember", id);
		System.out.println(dto.getMember_id());
		return dto;
	}

	@Override
	public void updateMember(MemberDTO member) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("mapper.member.updateMember", member);
	}

	@Override
	public MemberDTO selectGrade(String id) {
		// TODO Auto-generated method stub
		MemberDTO dto = sqlSession.selectOne("mapper.member.selectGrade", id);
		return dto;
	}

	@Override
	public List<LectureDTO> selectStuLectureList(String member_id) {
		// TODO Auto-generated method stub
		List<LectureDTO> list = sqlSession.selectList("mapper.member.selectStuLectureList",member_id);
		return list;
	}
	@Override
	public List<LectureDTO> selectProLectureList(String member_id) {
		// TODO Auto-generated method stub
		List<LectureDTO> list = sqlSession.selectList("mapper.member.selectProLectureList",member_id);
		return list;
	}

	@Override
	public void deleteLecture(String member_id, Integer lecture_id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("lecture_id", String.valueOf(lecture_id));
		int result = sqlSession.delete("mapper.member.deleteLecture", map);
	}

	public void removeMember(String member_id) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.member.removeMember", member_id);
	}
}
