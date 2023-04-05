package com.spring.acornLecture.board.dao;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.board.dto.BoardDTO;

public interface BoardDAO {

	List<BoardDTO> selectAllBoard();

	int insertNewArticle(Map<String, Object> articleMap);

	void insertNewImage(Map<String, Object> articleMap);

}
