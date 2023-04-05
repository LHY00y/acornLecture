package com.spring.acornLecture.lecture.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		String member_id = (String) session.getAttribute("member_id");
		
		LectureDTO lecture = lectureService.lectureInfo(lecture_id);
		Boolean isMine = lectureService.chkLecture(lecture_id, member_id);
		mav.addObject("lecture", lecture);
		mav.addObject("isMine", isMine);
		return mav;
	}
}