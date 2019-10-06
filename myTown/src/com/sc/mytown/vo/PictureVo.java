package com.sc.mytown.vo;

import java.sql.Date;

public class PictureVo {
	
	private int no, contentNo, reviewNo, typeNo;
	private Date regDate;
	private String picture;
	
	public PictureVo(int contentNo, int reviewNo, String picture) {
		super();
		this.contentNo = contentNo;
		this.reviewNo = reviewNo;
		this.picture = picture;
	}

	public PictureVo(int contentNo, int reviewNo) {
		super();
		this.contentNo = contentNo;
		this.reviewNo = reviewNo;
	}
	
	public PictureVo() {
		// TODO Auto-generated constructor stub
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
