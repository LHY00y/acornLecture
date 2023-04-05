package com.spring.acornLecture.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.dto.ImageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectAllBoard");
		return boardList;
	}
	
	@Override
	public int insertNewArticle(Map<String, Object> articleMap) {
		int articleNo = selectNewArticleNo();
		articleMap.put("articleNo", articleNo);
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		return articleNo;
	}
	
	private int selectNewArticleNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.board.selectNewArticleNo");
	}
	
	@Override
	public void insertNewImage(Map<String, Object> articleMap) {
		List<ImageDTO> imageFileList = (List<ImageDTO>) articleMap.get("imageFileList");
		int articleNo = (Integer)articleMap.get("articleNo");
		int imageFileNo = selectNewImageFileNo();
		for(ImageDTO image:imageFileList) {
			image.setImageFileNo(++imageFileNo);
			image.setArticleNo(articleNo);
		}
		sqlSession.insert("mapper.board.insertNewImage", imageFileList);
		
	}
	
	private int selectNewImageFileNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.board.selectNewImageFileNo");
	}

}
