package com.spring.acornLecture.board.service;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.board.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> listReviews();

	int addNewArticle(Map<String, Object> articleMap, boolean imgflag);

	Map viewArticle(int board_id);

	void deleteArticle(int board_id);

	List<BoardDTO> listNotices();

}
