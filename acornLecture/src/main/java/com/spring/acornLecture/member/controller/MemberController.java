package com.spring.acornLecture.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.acornLecture.member.dto.MemberDTO;

public interface MemberController {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("member") MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberDTO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(@RequestParam(value="result", required=false) String result,
			@RequestParam(value="action", required=false) String action,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView dbCkeckId(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView logout(RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMemberForm(@RequestParam("member_id") String member_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(@ModelAttribute("member") MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage(@RequestParam("member_id") String member_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
