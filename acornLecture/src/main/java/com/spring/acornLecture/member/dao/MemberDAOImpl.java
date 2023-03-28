package com.spring.acornLecture.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.acornLecture.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insertMember(MemberDTO member) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.insertMember", member);
	}


}
