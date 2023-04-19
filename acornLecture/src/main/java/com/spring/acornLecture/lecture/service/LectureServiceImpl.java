package com.spring.acornLecture.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.lecture.dao.LectureDAO;
import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.lecture.dto.MovieDTO;

@Service
public class LectureServiceImpl implements LectureService{

	@Autowired
	private LectureDAO lectureDAO;
	
	@Override
	public List<LectureDTO> listLectures() {
		return lectureDAO.selectAllLectureList();
	}
	
	@Override
	public List<String> categories() {
		return lectureDAO.selectAllCategories();
	}
	
	@Override
	public List<LectureDTO> searchLectures(String keyword) {
		return lectureDAO.selectSearchLectureList(keyword);
	}
	
	@Override
	public LectureDTO lectureInfo(int lecture_id) {
		return lectureDAO.selectOneLecture(lecture_id);
	}

	@Override
	public Boolean chkLecture(int lecture_id, String member_id) {
		return lectureDAO.chkLecture(lecture_id, member_id);
	}
	
	@Override
	public int addNewLecture(Map<String, Object> lectureMap) {
		int lectureNo = lectureDAO.insertNewLecture(lectureMap);
		return lectureNo;
	}

	@Override
	public LectureDTO lectureList(int lecture_id) {
		// TODO Auto-generated method stub
		return lectureDAO.selectLecture(lecture_id);
	}

	@Override
	public int modLecture(Map<String, Object> lectureMap) {
		// TODO Auto-generated method stub
		int modLectureNo = lectureDAO.updateLecture(lectureMap);
		return modLectureNo;
	}

	@Override
	public void delLecture(int lecture_id) {
		// TODO Auto-generated method stub
		lectureDAO.delLecture(lecture_id);
	}

	@Override
	public String daybox(int lecture_id) {
		// TODO Auto-generated method stub
		return lectureDAO.selectDaybox(lecture_id);
	}

	@Override
	public void enrol(int lecture_id, String member_id) {
		// TODO Auto-generated method stub
		lectureDAO.insertEnrol(lecture_id, member_id);
	}

	@Override
	public Member_LectureDTO stuCount(int lecture_id) {
		// TODO Auto-generated method stub
		Member_LectureDTO stuCount = lectureDAO.selectStuCount(lecture_id);
		return stuCount;
	}
	
	@Override
	public int addNewMovie( Map<String, Object> mvMap) {
		int mvNo = lectureDAO.selectMvCount() + 1;
		mvMap.put("mvFileNo", mvNo);
		lectureDAO.insertNewMv(mvMap);
		return mvNo;
	}
	
	@Override
	public MovieDTO mvInfo(int mvFileNo) {
		return lectureDAO.selectOneMv(mvFileNo);
	}
	@Override
	public List<MovieDTO> mvList(int lecture_id) {
		return lectureDAO.selectMvList(lecture_id);
	}
}
