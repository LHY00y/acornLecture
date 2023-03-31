package com.spring.acornLecture.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.mypage.service.MyPageService;

@Controller
@SessionAttributes("member")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value="/member/mypage", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberDTO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean) session.getAttribute("isLogon");
		
		if(isLogOn == true) {
			List<LectureDTO> myLectureList = myPageService.myLecture(member);
			mav.addObject("myLectureList", myLectureList);
			mav.setViewName("/mypageFrom");
		} else {
			mav.setViewName("redirect:/login.do");
		}
		
		return mav;
	}
}
