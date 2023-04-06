package com.spring.acornLecture.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.board.dao.BoardDAO;
import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.dto.ImageDTO;

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
	
	@Override
	public Map viewArticle(int board_id) {
		Map articleMap = new HashMap();
		BoardDTO boardDTO = boardDAO.selectArticle(board_id);
		//List<ImageDTO> imageFileList = boardDAO.selectImageFileList(board_id);
		articleMap.put("article", boardDTO);
		//articleMap.put("imageFileList",imageFileList);
		return articleMap;
	}
	
	@Override
	public void deleteArticle(int articleNo) {
		// TODO Auto-generated method stub
		boardDAO.deleteArticle(articleNo);
	}
}
