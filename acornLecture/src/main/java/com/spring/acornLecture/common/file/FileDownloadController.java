package com.spring.acornLecture.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	// 경로 각자 바꿔주세요
	private static final String CURR_IMAGE_REPO_PATH = "C:\\Users\\leeha\\git\\acornLecture\\acornLecture\\article_imageFile";
	private static final String CURR_MOVIE_REPO_PATH = "C:\\Users\\leeha\\git\\acornLecture\\acornLecture\\lecture_movie";
	
	@RequestMapping("/download.do")
	public void download(@RequestParam("imageFileName") String imageFileName,
			@RequestParam("board_id") String board_id,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + board_id + "\\" + imageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/mvdownload.do")
	public void mvdownload(@RequestParam("mvFileName") String mvFileName,
			@RequestParam("mvFileNo") String mvFileNo,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_MOVIE_REPO_PATH + "\\" + mvFileNo + "\\" + mvFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName="+mvFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}