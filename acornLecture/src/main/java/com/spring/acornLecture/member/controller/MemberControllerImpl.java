package com.spring.acornLecture.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.member.service.MemberService;

@Controller
@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	
	@Override
	@RequestMapping(value= {"/main.do"})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/#");
		return mav;
	}

}
