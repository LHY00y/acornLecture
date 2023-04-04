package com.spring.acornLecture.board.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.service.BoardService;


@Controller
public class BoardControllerImpl implements BoardController{
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value= {"/lecture/board.do"})
	public ModelAndView board(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<BoardDTO> boardList = boardService.listBoards();
		
		mav.addObject("boardList", boardList);
		return mav;
	}
}
