package com.spring.acornLecture.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.service.BoardService;
import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.member.dto.MemberDTO;
import com.spring.acornLecture.member.service.MemberService;

@Controller
@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;

	@Override
	@RequestMapping(value= {"/main.do"})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<BoardDTO> reviewList = boardService.listReviews();		
		mav.addObject("reviewList", reviewList);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		member = memberService.login(member);
		ModelAndView mav = new ModelAndView();

		if(member != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("member", member);
			session.setAttribute("member_id", member.getMember_id());
			
			session.setAttribute("isLogOn", true);
			session.setAttribute("grade", member.getGrade());
			rAttr.addAttribute("msg", "login");
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");

			if(action != null) {
				mav.setViewName("redirect:"+action);
			} else {
				mav.setViewName("redirect:/main.do");
			}
		} else {
			rAttr.addAttribute("result", "loginfailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");

		ModelAndView mav = new ModelAndView();

		if(session != null && isLogOn != null) {			
			session.invalidate();
			rAttr.addAttribute("result", "logout");
		} else {
			rAttr.addAttribute("result", "notLogin");
		}
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/member/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(String result, String action, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		return mav;
	}

	@Override
	@RequestMapping("/member/dbCheckId.do")
	public ModelAndView dbCkeckId(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView("/member/dbCheckId");
		String member_id = request.getParameter("member_id");
		int result = memberService.idCheck(member_id);
		mav.addObject("result", result);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/modMemberForm.do", method=RequestMethod.GET)
	public ModelAndView modMemberForm(String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		member_id = (String) session.getAttribute("member_id");
		MemberDTO dto = memberService.selectMember(member_id);

		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", dto);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/modMember.do", method=RequestMethod.POST)
	public ModelAndView modMember(MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		memberService.modMember(member);

		ModelAndView mav = new ModelAndView("redirect:/main.do");

		return mav;
	}

	@Override
	@RequestMapping(value="/member/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDTO dto1 = (MemberDTO) session.getAttribute("member");
		
		member_id = (String) session.getAttribute("member_id");
		MemberDTO dto = memberService.selectGrade(member_id);
		String grade = (String) session.getAttribute("grade");
		List<LectureDTO> lectureList;
		if(grade.equals("학생")) {
			lectureList = memberService.selectStuLectureList(member_id);
		}
		else {	
			lectureList = memberService.selectProLectureList(member_id);
		}

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", dto1);
		mav.addObject("lectureList", lectureList);
		return mav;
	}
	

	@Override
	@RequestMapping(value="/member/dropLecture.do", method=RequestMethod.GET)
	public ResponseEntity dropLecture(int lecture_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			memberService.dropLecture(member_id,lecture_id);
			
			message = "<script>";
			message += "alert('수강을 취소 했습니다.');";
			message += "location.href='"+request.getContextPath()+"/member/myPage.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='"+request.getContextPath()+"/member/myPage.do';";
			message += "</script>";
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/member/removeMember.do", method=RequestMethod.POST)
	public ModelAndView removeMember(String member_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		memberService.removeMemBoard(member_id);
		memberService.removeMemLecture(member_id);
		memberService.removeMember(member_id);
		ModelAndView mav = new ModelAndView("redirect:/member/logout.do");
				
		return mav;
	}
}
