package com.spring.acornLecture.lecture.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.service.LectureService;

@Controller
@EnableAspectJAutoProxy
public class LectureControllerImpl implements LectureController {
	@Autowired
	private LectureService lectureService;
	
	@Override
	@RequestMapping(value="/lecture/listLectures.do", method=RequestMethod.GET)
	public ModelAndView listLectures(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<LectureDTO> lecturesList = lectureService.listLectures();
		List<String> categories = lectureService.categories();
		
		
		mav.addObject("lecturesList", lecturesList);
		mav.addObject("categories", categories);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/lecture/search.do", method=RequestMethod.GET)
	public ModelAndView searchLectures(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//ModelAndView mav = new ModelAndView("redirect:/lecture/listLectures.do");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		if(keyword == null || keyword.equals("")) {
			mav.setViewName("redirect:/lecture/listLectures.do");
			return mav;
		} 
		List<LectureDTO> lecturesList = lectureService.searchLectures(keyword);
		List<String> categories = lectureService.categories();

		mav.addObject("lecturesList", lecturesList);
		mav.addObject("categories", categories);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/lecture/info.do", method=RequestMethod.GET)
	public ModelAndView showLectureInfo(@RequestParam("id") int lecture_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession(false);
		
		// 로그인 상태일 경우에만 강의가 내 강의 목록에 있는지 확인
		if(session.getAttribute("isLogOn") != null) {
			String member_id = (String) session.getAttribute("member_id");
			
			Boolean isMine = lectureService.chkLecture(lecture_id, member_id);
			mav.addObject("isMine", isMine);
		}
		
		LectureDTO lecture = lectureService.lectureInfo(lecture_id);
		mav.addObject("lecture", lecture);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/lecture/*Form.do", method=RequestMethod.GET)
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
	@RequestMapping(value="/lecture/addNewLecture.do", method=RequestMethod.POST)
	public ResponseEntity addNewLecture( MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> lectureMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println(name+" : "+value);
			lectureMap.put(name, value);
		}
		return null;
	}
}