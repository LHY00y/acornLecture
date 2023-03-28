package com.spring.acornLecture.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.acornLecture.member.dao.MemberDAO;
import com.spring.acornLecture.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;
	@Override
	public void addMember(MemberDTO member) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(member);
	}
}
