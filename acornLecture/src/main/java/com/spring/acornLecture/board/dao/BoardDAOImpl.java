package com.spring.acornLecture.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.lecture.dto.LectureDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectAllBoard");
		return boardList;
	}
}
