package com.spring.acornLecture.member.service;

import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberService {

	void addMember(MemberDTO member);

	MemberDTO login(MemberDTO member);

	int idCheck(String id);

	MemberDTO selectMember(String id);

	void modMember(MemberDTO member);

}
