package com.spring.acornLecture.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberDTO member) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.insertMember", member);
	}

	@Override
	public MemberDTO loginById(MemberDTO member) {
		// TODO Auto-generated method stub
		member = sqlSession.selectOne("mapper.member.loginById", member);
		return member;
	}

	@Override
	public int selectAllId(String member_id) {
		// TODO Auto-generated method stub
		System.out.println("dao1");
		String resultStr = sqlSession.selectOne("mapper.member.selectId", member_id);
		int result;
		if(resultStr != "" || resultStr.length() != 0) {
			result = 1;
		}else {
			result = 0;
		}
		System.out.println("dao2");
		return result;
	}
}
