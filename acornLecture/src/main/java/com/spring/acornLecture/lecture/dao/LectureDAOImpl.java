package com.spring.acornLecture.lecture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<LectureDTO> selectSearchLectureList(String keyword) {
		List<LectureDTO> lecturesList = sqlSession.selectList("mapper.lecture.selectSearchLectureList", keyword);
		return lecturesList;
	}	
	
	@Override
	public LectureDTO selectOneLecture(int lecture_id) {
		LectureDTO lecture = sqlSession.selectOne("mapper.lecture.selectOneLecture", lecture_id);
		return lecture;
	}

	@Override
	public Boolean chkLecture(int lecture_id, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecture_id", lecture_id);
		map.put("member_id", member_id);
		
		Boolean isMine = (sqlSession.selectOne("mapper.lecture.chkLecture", map) != null);
		return isMine;
	}
	
	@Override
	public int insertNewLecture(Map<String, Object> lectureMap) {
		int lectureNo = selectNewLectureNo();
		lectureMap.put("lectureNo", lectureNo);
		sqlSession.insert("mapper.lecture.insertNewLecture", lectureMap);
		return lectureNo;
	}
	
	private int selectNewLectureNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.lecture.selectNewLectureNo");
	}

	@Override
	public int updateLecture(Map<String, Object> lectureMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.lecture.updateLecture", lectureMap);
	}

	@Override
	public LectureDTO selectLecture(int lecture_id) {
		// TODO Auto-generated method stub
		LectureDTO list = sqlSession.selectOne("mapper.lecture.selectLecture", lecture_id); 
		return list;
	}

	@Override
	public void delLecture(int lecture_id) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.lecture.delLecture", lecture_id);
		sqlSession.delete("mapper.lecture.delMemberLecture", lecture_id);
		sqlSession.delete("mapper.lecture.delBoard", lecture_id);
	}

	@Override
	public String selectDaybox(int lecture_id) {
		// TODO Auto-generated method stub
		String daybox = sqlSession.selectOne("mapper.lecture.selectDaybox", lecture_id);
		return daybox;
	}
}
