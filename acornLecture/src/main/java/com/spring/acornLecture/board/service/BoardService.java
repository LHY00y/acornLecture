package com.spring.acornLecture.board.service;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.board.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> listReviews();

	List<BoardDTO> listNotices();

	List<BoardDTO> listReviews(int lecture_id);

	List<BoardDTO> listNotices(int lecture_id);

	int addNewArticle(Map<String, Object> articleMap, boolean imgflag);

	Map viewArticle(int board_id);


	void removeArticle(int board_id);

	void modArticle(Map<String, Object> articleMap);

}
