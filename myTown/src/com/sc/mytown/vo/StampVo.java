package com.sc.mytown.vo;

import java.sql.Date;

public class StampVo {

	private int no, contentNo, userNo, typeNo;
	private Date regDate;
	

	public StampVo(int contentNo, int userNo) {
		super();
		this.contentNo = contentNo;
		this.userNo = userNo;
	}
	
	public StampVo() {
		// TODO Auto-generated constructor stub
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
