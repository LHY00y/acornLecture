package com.spring.acornLecture.lecture.service;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;

public interface LectureService {

	List<LectureDTO> listLectures();
	List<String> categories();
	List<LectureDTO> searchLectures(String keyword);
	LectureDTO lectureInfo(int lecture_id);
	Boolean chkLecture(int lecture_id, String member_id);
	int addNewLecture(Map<String, Object> lectureMap);
	LectureDTO lectureList(int lecture_id);
	int modLecture(Map<String, Object> lectureMap);
	void delLecture(int lecture_id);
	String daybox(int lecture_id);
	void enrol(int lecture_id, String member_id);
	Member_LectureDTO stuCount(int lecture_id);
}