package com.spring.acornLecture.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<LectureDTO> selectMyLecture(MemberDTO member) {
		
		List<LectureDTO> myLectureList = sqlSession.selectList(
				"mapper.mypage.findMyLectureList", member);
		
		return myLectureList;
	}

}
