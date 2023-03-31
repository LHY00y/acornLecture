package com.spring.acornLecture.lecture.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface LectureController {

	ModelAndView listLectures(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
