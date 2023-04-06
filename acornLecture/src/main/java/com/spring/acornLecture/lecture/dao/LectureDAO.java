package com.spring.acornLecture.lecture.dao;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.lecture.dto.LectureDTO;

public interface LectureDAO {

	List<LectureDTO> selectAllLectureList();
	List<String> selectAllCategories();
	List<LectureDTO> selectSearchLectureList(String keyword);
	LectureDTO selectOneLecture(int lecture_id);
	Boolean chkLecture(int lecture_id, String member_id);
	int insertNewLecture(Map<String, Object> lectureMap);
	int updateLecture(Map<String, Object> lectureMap);
	LectureDTO selectLecture(int lecture_id);
}
