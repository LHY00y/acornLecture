package com.spring.acornLecture.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	ModelAndView board(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
