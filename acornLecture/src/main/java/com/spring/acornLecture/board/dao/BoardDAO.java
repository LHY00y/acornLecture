package com.spring.acornLecture.board.dao;

import java.util.List;
import java.util.Map;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.dto.ImageDTO;

public interface BoardDAO {

	List<BoardDTO> selectAllReviews();
	List<BoardDTO> selectAllNotices();

	int insertNewArticle(Map<String, Object> articleMap);

	void insertNewImage(Map<String, Object> articleMap);

	BoardDTO selectArticle(int board_id);

	void deleteArticle(int board_id);
	List<ImageDTO> selectImageFileList(int board_id);
	void updateArticle(Map<String, Object> articleMap);
	void deleteImage(int[] delFileNo);

}
