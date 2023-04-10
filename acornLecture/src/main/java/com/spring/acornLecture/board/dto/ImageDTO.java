package com.spring.acornLecture.board.dto;

import java.sql.Date;

public class ImageDTO {
	private int imgFileNo;
	private String imgFileName;
	private Date regDate;
	private int board_id;
	
	public int getImgFileNo() {
		return imgFileNo;
	}
	public void setImgFileNo(int imgFileNo) {
		this.imgFileNo = imgFileNo;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
}