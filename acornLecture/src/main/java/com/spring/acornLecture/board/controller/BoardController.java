package com.spring.acornLecture.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	ModelAndView review(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView notice(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	ModelAndView viewArticle(int board_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ResponseEntity removeArticle(int board_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

}
