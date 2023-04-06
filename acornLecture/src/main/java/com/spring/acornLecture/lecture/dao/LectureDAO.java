package com.spring.acornLecture.lecture.dao;

import java.util.List;

import com.spring.acornLecture.lecture.dto.LectureDTO;

public interface LectureDAO {

	List<LectureDTO> selectAllLectureList();
	List<String> selectAllCategories();
	List<LectureDTO> selectSearchLectureList(String keyword);
	LectureDTO selectOneLecture(int lecture_id);
	Boolean chkLecture(int lecture_id, String member_id);
}
