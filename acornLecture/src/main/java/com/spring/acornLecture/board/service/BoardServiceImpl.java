package com.spring.acornLecture.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.board.dao.BoardDAO;
import com.spring.acornLecture.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> listBoards() {
		return boardDAO.selectAllBoard();
	}
	
	@Override
	public int addNewArticle(Map<String, Object> articleMap, boolean imgflag) {
		int articleNo = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNo", articleNo);
		if(imgflag)
			boardDAO.insertNewImage(articleMap);
		return articleNo;
	}
}
