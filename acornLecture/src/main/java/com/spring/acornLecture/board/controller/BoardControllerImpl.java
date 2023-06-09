package com.spring.acornLecture.board.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.acornLecture.board.dto.BoardDTO;
import com.spring.acornLecture.board.dto.ImageDTO;
import com.spring.acornLecture.board.service.BoardService;
import com.spring.acornLecture.lecture.dto.LectureDTO;
import com.spring.acornLecture.lecture.service.LectureService;
import com.spring.acornLecture.member.dto.MemberDTO;


@Controller
public class BoardControllerImpl implements BoardController{
	
	//경로 각자 바꾸셔야 합니다.
	private static final String CURR_IMAGE_REPO_PATH = "C:\\Users\\leeha\\git\\acornLecture\\acornLecture\\article_imageFile";
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private LectureService lectureService;
	
	@Override
	@RequestMapping(value= {"/board/review.do"})
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<BoardDTO> reviewList = boardService.listReviews();
		
		mav.addObject("boardList", reviewList);
		return mav;
	}
	
	@Override
	@RequestMapping(value= {"/board/notice.do"})
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<BoardDTO> noticeList = boardService.listNotices();
		
		mav.addObject("boardList", noticeList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/addNewArticle.do", method=RequestMethod.POST)
	public ResponseEntity addNewArticle( MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		boolean imgflag = false;
		List<String> fileList = upload(multipartRequest);
		List<ImageDTO> imageFileList = new ArrayList<ImageDTO>();
		if(fileList != null && fileList.size() != 0) {
			for(String fileName : fileList) {
				ImageDTO image = new ImageDTO();
				image.setImgFileName(fileName);
				imageFileList.add(image);
			}
			imgflag=true;
			articleMap.put("imageFileList", imageFileList);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String member_id = member.getMember_id();
		articleMap.put("member_id", member_id);
				
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int board_id =boardService.addNewArticle(articleMap, imgflag);
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageDTO imageDTO : imageFileList) {
					System.out.println("파일 이름 : "  +imageDTO.getImgFileName());
					File srcFile = new File(CURR_IMAGE_REPO_PATH+ "\\temp\\" 
							+ imageDTO.getImgFileName());
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+board_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += "alert('새글을 추가했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/board/boardPage.do?board_id="+board_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageDTO imageDTO : imageFileList) {
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\temp\\"
							+imageDTO.getImgFileName());
					srcFile.delete();
				}
			}
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath()
				+"/board/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/board/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		int lecture_id = Integer.parseInt(request.getParameter("lecture_id"));
		LectureDTO lecture = lectureService.lectureInfo(lecture_id);
		
		mav.addObject("lecture",lecture);
		
		return mav;
	}
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Map<String, String> articleMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\temp\\"+originalFileName));
			}
		}
		return fileList;
	}
	

	@Override
	@RequestMapping(value="/board/boardPage.do", method=RequestMethod.GET)
	public ModelAndView viewArticle(int board_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		Map articleMap = boardService.viewArticle(board_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articleMap", articleMap);
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value="/board/removeArticle", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(int board_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			boardService.removeArticle(board_id);
			File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + board_id);
			FileUtils.deleteDirectory(destDir);
			
			message = "<script>";
			message += "alert('삭제가 완료 되었습니다.');";
			message += "location.href='"+request.getContextPath()+"/board/review.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += "alert('삭제에 실패 하었습니다. 다시 시도해 주세요.');";
			message += "location.href='"+request.getContextPath()+"/board/boardPage.do?board_id="+board_id+"';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	
	@Override
	@RequestMapping(value="/board/modArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
	
		String board_id = multipartRequest.getParameter("board_id");
		articleMap.put("board_id", Integer.parseInt(board_id));
		
		String content = multipartRequest.getParameter("content");
		articleMap.put("content", content);
		
		String title = multipartRequest.getParameter("title");
		articleMap.put("title", title);

		String[] delFileNo = multipartRequest.getParameterValues("delImgNo");
		if(delFileNo != null && delFileNo.length != 0) {
//			System.out.println("DelFileNO: "+delFileNo[0]);
			articleMap.put("delFileNo", delFileNo);
		}
		
		List<String> fileList= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String id = member.getMember_id();
		articleMap.put("id", id);
		List<ImageDTO> imageFileList = new ArrayList<ImageDTO>();
		if(fileList != null && fileList.size() != 0) {
			for(String fileName : fileList) {
				ImageDTO image = new ImageDTO();
				image.setImgFileName(fileName);
				imageFileList.add(image);
			}
			articleMap.put("imageFileList", imageFileList);
		}
		 
		
		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			boardService.modArticle(articleMap);
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageDTO imageDTO : imageFileList) {
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\temp\\" + imageDTO.getImgFileName());
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + board_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);	
				}
			}
			
			String[] delFileName = multipartRequest.getParameterValues("delImg");
			if(delFileName != null && delFileName.length != 0) {
				for(String FileName : delFileName) {
//					System.out.println("delFileName:"+oldFileName);
					File oldFile = new File(CURR_IMAGE_REPO_PATH + "\\" + board_id + "\\" + FileName);
				}
			}
			message = "<script>";
			message += "alert('글이 수정 되었습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()
				+"/board/boardPage.do?board_id="+board_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageDTO imageDTO : imageFileList) {
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\temp\\"
							+imageDTO.getImgFileName());
					srcFile.delete();
				}
			}
			message = "<script>";
			message += "alert('글 수정 중 에러가 발생했습니다. 다시 시도 하세요.');";
			message += "location.href='"+multipartRequest.getContextPath()
				+"/board/boardPage.do?board_id="+board_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
}