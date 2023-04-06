package com.spring.acornLecture.lecture.service;

import java.util.List;

import com.spring.acornLecture.lecture.dto.LectureDTO;

public interface LectureService {

	List<LectureDTO> listLectures();
	List<String> categories();
	List<LectureDTO> searchLectures(String keyword);
	LectureDTO lectureInfo(int lecture_id);
	Boolean chkLecture(int lecture_id, String member_id);
}