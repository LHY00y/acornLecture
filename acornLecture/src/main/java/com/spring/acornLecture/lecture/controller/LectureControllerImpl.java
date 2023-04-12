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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.service.BoardService;
import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.dto.Member_LectureDTO;
import com.spring.acornLecture.lecture.service.LectureService;
import com.spring.acornLecture.member.dto.MemberDTO;

@Controller
@EnableAspectJAutoProxy
public class LectureControllerImpl implements LectureController {
	@Autowired
	private LectureService lectureService;
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value="/lecture/listLectures.do", method=RequestMethod.GET)
	public ModelAndView listLectures(Integer lecture_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		if(session != null) {
			// 로그인 상태일 경우에만 강의가 내 강의 목록에 있는지 확인
			if(session.getAttribute("isLogOn") != null) {
				String member_id = (String) session.getAttribute("member_id");
				
				Boolean isMine = lectureService.chkLecture(lecture_id, member_id);
				mav.addObject("isMine", isMine);
			}
		}
		
//		List<BoardDTO> boardList = boardService.listNotices();
		List<BoardDTO> boardList = boardService.listReviews();
		LectureDTO lecture = lectureService.lectureInfo(lecture_id);
		Member_LectureDTO dto = lectureService.stuCount(lecture_id);
		mav.addObject("boardList", boardList);
		mav.addObject("lecture", lecture);
		mav.addObject("dto", dto);
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
		List<String> categories = lectureService.categories();
		mav.addObject("categories",categories);
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
			String value = "";
			if(name.equals("daybox")) {
				for(String val : multipartRequest.getParameterValues(name)) {
					value += val;
				}
			}else {
				value = multipartRequest.getParameter(name);
			}
			
//			System.out.println(name+":"+value);
			lectureMap.put(name, value);
		}
		if(lectureMap.get("category").equals("add")) {
			lectureMap.put("category", lectureMap.get("category_add"));
		}
		lectureMap.put("time",lectureMap.get("daybox").toString() + " " + lectureMap.get("time").toString());
		
		HttpSession session = multipartRequest.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String member_id = member.getMember_id();
		lectureMap.put("member_id", member_id);
				
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int lectureNo = lectureService.addNewLecture(lectureMap);
			
			message = "<script>";
			message += "alert('새 강의를 추가했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/lecture/info.do?id="+lectureNo+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/lecture/lectureForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/lecture/modLectureForm.do", method=RequestMethod.GET)
	public ModelAndView modLectureForm(int lecture_id, String result, String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView(viewName);
		LectureDTO lecture = (LectureDTO) lectureService.lectureList(lecture_id);
		List<String> categories = lectureService.categories();
		String daybox = lectureService.daybox(lecture_id);
		mav.addObject("categories",categories);
		mav.addObject("lecture", lecture);
		mav.addObject("result", result);
		int idx = daybox.indexOf(" "); 
		mav.addObject("day", daybox.substring(0, idx));
		mav.addObject("time", daybox.substring(daybox.indexOf(" ")+1));
		return mav;
	}

	@Override
	@RequestMapping(value="/lecture/modLecture.do", method=RequestMethod.POST)
	public ResponseEntity modLecture(int lecture_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> lectureMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = "";
			if(name.equals("daybox")) {
				for(String val : multipartRequest.getParameterValues(name)) {
					value += val;
				}
			}else {
				value = multipartRequest.getParameter(name);
			}
			
//			System.out.println(name+":"+value);
			lectureMap.put(name, value);
			lectureMap.put("lecture_id", String.valueOf(lecture_id));
		}
		if(lectureMap.get("category").equals("add")) {
			lectureMap.put("category", lectureMap.get("category_add"));
		}
		lectureMap.put("time",lectureMap.get("daybox").toString() + " " + lectureMap.get("time").toString());
		
		HttpSession session = multipartRequest.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String member_id = member.getMember_id();
		lectureMap.put("member_id", member_id);
				
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int lectureNo = lectureService.modLecture(lectureMap);
			
			message = "<script>";
			message += "alert('강의를 수정했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/lecture/info.do?id="+lectureNo+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/lecture/lectureForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/lecture/delLecture", method=RequestMethod.GET)
	public ResponseEntity delLecture(int lecture_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			lectureService.delLecture(lecture_id);
			
			message = "<script>";
			message += "alert('강의를 삭제했습니다.');";
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
	@RequestMapping(value="/lecture/enrol", method=RequestMethod.GET)
	public ResponseEntity enrol(int lecture_id, String member_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			lectureService.enrol(lecture_id,member_id);
			
			message = "<script>";
			message += "alert('수강 신청이 완료되었습니다.');";
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
}