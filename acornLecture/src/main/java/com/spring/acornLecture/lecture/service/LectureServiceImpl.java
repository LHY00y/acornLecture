package com.spring.acornLecture.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.lecture.dao.LectureDAO;
import com.spring.acornLecture.lecture.dto.LectureDTO;

@Service
public class LectureServiceImpl implements LectureService{

	@Autowired
	private LectureDAO lectureDAO;
	
	@Override
	public List<LectureDTO> listLectures() {
		return lectureDAO.selectAllLectureList();
	}
	
	@Override
	public List<String> categories() {
		return lectureDAO.selectAllCategories();
	}
	
	@Override
	public List<LectureDTO> searchLectures(String keyword) {
		return lectureDAO.selectSearchLectureList(keyword);
	}
	
	@Override
	public LectureDTO lectureInfo(int lecture_id) {
		return lectureDAO.selectOneLecture(lecture_id);
	}

	@Override
	public Boolean chkLecture(int lecture_id, String member_id) {
		return lectureDAO.chkLecture(lecture_id, member_id);
	}
	
	@Override
	public int addNewLecture(Map<String, Object> lectureMap) {
		int lectureNo = lectureDAO.insertNewLecture(lectureMap);
		return lectureNo;
	}
}
