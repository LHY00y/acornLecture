package com.spring.acornLecture.member.dao;

import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberDAO {

	void insertMember(MemberDTO member);

	MemberDTO loginById(MemberDTO member);

	int selectAllId(String id);

	MemberDTO selectMember(String id);

	void updateMember(MemberDTO member);

}
