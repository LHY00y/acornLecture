package com.spring.acornLecture.lecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.lecture.dto.LectureDTO;

@Repository
public class LectureDAOImpl implements LectureDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<LectureDTO> selectAllLectureList() {
		List<LectureDTO> lecturesList = sqlSession.selectList("mapper.lecture.selectAllLectureList");
		return lecturesList;
	}
	
	@Override
	public List<String> selectAllCategories() {
		List<String> categories = sqlSession.selectList("mapper.lecture.selectAllCategories");
		return categories;
	}
}
