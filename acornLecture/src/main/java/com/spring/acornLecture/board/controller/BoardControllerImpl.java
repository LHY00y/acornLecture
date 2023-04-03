package com.spring.acornLecture.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.acornLecture.board.service.BoardService;


@Controller
public class BoardControllerImpl implements BoardController{
	@Autowired
	private BoardService boardService;
}
