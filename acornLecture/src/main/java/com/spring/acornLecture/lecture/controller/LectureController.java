package com.spring.acornLecture.lecture.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface LectureController {

	ModelAndView listLectures(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView searchLectures(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView showLectureInfo(@RequestParam("id") int lecture_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView form(String result, String action, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	ResponseEntity addNewLecture(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	ModelAndView modLectureForm(@RequestParam("lecture_id")int lecture_id,String result, String action, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	ResponseEntity modLecture(@RequestParam("lecture_id")int lecture_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	ResponseEntity delLecture(@RequestParam("lecture_id")int lecture_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	ResponseEntity enrol(@RequestParam("lecture_id")int lecture_id,@RequestParam("member_id")String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}