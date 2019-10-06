package com.sc.mytown.vo;

import java.sql.Date;

public class LikeVo {

	private int no, userNo, typeNo, contentNo, likes;
	private Date regDate;
	
	public LikeVo(int userNo, int contentNo) {
		super();
		this.userNo = userNo;
		this.contentNo = contentNo;
	}
	
	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public LikeVo() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
