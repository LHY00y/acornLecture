package com.spring.acornLecture.board.dao;

import java.util.List;

import com.spring.acornLecture.board.dto.BoardDTO;

public interface BoardDAO {

	List<BoardDTO> selectAllBoard();

}
