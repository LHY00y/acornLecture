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
	public List<BoardDTO> listReviews() {
		return boardDAO.selectAllReviews();
	}
	
	@Override
	public List<BoardDTO> listNotices() {
		return boardDAO.selectAllNotices();
	}
	
	@Override
	public List<BoardDTO> listNotices(int lecture_id) {
		return boardDAO.selectAllNotices(lecture_id);
	}
	
	@Override
	public List<BoardDTO> listReviews(int lecture_id) {
		return boardDAO.selectAllReviews(lecture_id);
	}
	
	@Override
	public int addNewArticle(Map<String, Object> articleMap, boolean imgflag) {
		int board_id = boardDAO.insertNewArticle(articleMap);
		articleMap.put("board_id", board_id);
		if(imgflag)
			boardDAO.insertNewImage(articleMap);
		return board_id;
	}
	
	@Override
	public Map viewArticle(int board_id) {
		Map articleMap = new HashMap();
		BoardDTO boardDTO = boardDAO.selectArticle(board_id);
		List<ImageDTO> imgFileList = boardDAO.selectImageFileList(board_id);
		articleMap.put("article", boardDTO);
		articleMap.put("imgFileList",imgFileList);
		return articleMap;
	}
	
	@Override
	public void removeArticle(int board_id) {
		boardDAO.deleteArticle(board_id);
	}
	
	@Override
	public void modArticle(Map<String, Object> articleMap) {
		boardDAO.updateArticle(articleMap);
		if(articleMap.containsKey("delFileNo")) {
			String[] sDelFileNo = (String[]) articleMap.get("delFileNo");
			int[] delFileNo = new int[sDelFileNo.length];
	        for(int i=0; i<sDelFileNo.length; i++) {
	            delFileNo[i] = Integer.parseInt(sDelFileNo[i]);
	        }
			
			boardDAO.deleteImage(delFileNo);
		}
		if(articleMap.containsKey("imageFileList"))
			boardDAO.insertNewImage(articleMap);
		
	}

}
