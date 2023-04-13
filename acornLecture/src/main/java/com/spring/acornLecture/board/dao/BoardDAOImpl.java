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
	public List<BoardDTO> selectAllReviews() {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectAllReviews");
		return boardList;
	}
	
	@Override
	public List<BoardDTO> selectAllNotices() {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectAllNotices");
		return boardList;
	}
	
	@Override
	public List<BoardDTO> selectAllReviews(int lecture_id) {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectCertainLecReviews", lecture_id);
		return boardList;
	}
	
	@Override
	public List<BoardDTO> selectAllNotices(int lecture_id) {
		List<BoardDTO> boardList = sqlSession.selectList("mapper.board.selectCertainLecNotices", lecture_id);
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
		return sqlSession.selectOne("mapper.board.selectNewArticleNo");
	}
	
	@Override
	public void insertNewImage(Map<String, Object> articleMap) {
		List<ImageDTO> imageFileList = (List<ImageDTO>) articleMap.get("imageFileList");
		int board_id = (Integer)articleMap.get("board_id");
		int imageFileNo = selectNewImageFileNo();
		for(ImageDTO image:imageFileList) {
			image.setImgFileNo(++imageFileNo);
			image.setBoard_id(board_id);
		}
		sqlSession.insert("mapper.board.insertNewImage", imageFileList);
		
	}
	
	private int selectNewImageFileNo() {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNo");
	}
	
	@Override
	public BoardDTO selectArticle(int board_id) {
		return sqlSession.selectOne("mapper.board.selectArticle", board_id);
	}

	@Override
	public void deleteArticle(int board_id) {
		sqlSession.selectOne("mapper.board.deleteArticle", board_id);
	}
	
	@Override
	public void updateArticle(Map<String, Object> articleMap) {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override
	public List<ImageDTO> selectImageFileList(int articleNo) {
		List<ImageDTO> imageFileList = sqlSession.selectList
				("mapper.board.selectImageFileList", articleNo);
//		for(ImageDTO image : imageFileList) {
//			System.out.println(image.getImgFileName());
//		}
		return imageFileList;
	}
	
	@Override
	public void deleteImage(int[] delFileNo) {
		for(int fileNo : delFileNo) {
			sqlSession.delete("mapper.board.deleteImage", fileNo);
			
		}
	}
}
