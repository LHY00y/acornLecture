package com.spring.acornLecture.lecture.service;

import java.util.List;

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
}
