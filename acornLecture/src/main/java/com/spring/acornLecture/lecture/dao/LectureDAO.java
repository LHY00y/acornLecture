package com.spring.acornLecture.lecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.member.dto.MyPageDTO;

@Repository
public class LectureDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<String> myLecture(MyPageDTO myPageDTO) {
		
		List<String> findLectureById = sqlSession.selectOne("mapper.lecture.findLectureById", myPageDTO);
		
		return findLectureById;
	}
}
