package com.sc.mytown.vo;

import java.sql.Date;

public class ReplyVo {

	private int no, contentNo, userNo, typeNo;
	private String contents;
	private Date regDate;
	
	public ReplyVo() {
		// TODO Auto-generated constructor stub
	}


	public ReplyVo(int contentNo, int userNo, String contents) {
		super();
		this.contentNo = contentNo;
		this.userNo = userNo;
		this.contents = contents;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
