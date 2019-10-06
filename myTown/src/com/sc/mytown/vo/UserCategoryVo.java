package com.sc.mytown.vo;

import java.sql.Date;

public class UserCategoryVo {

	private int no, userNo, hashTagNo;
	private Date regDate;
	
	public UserCategoryVo() {
		// TODO Auto-generated constructor stub
	}


	public UserCategoryVo(int userNo, int hashTagNo) {
		super();
		this.userNo = userNo;
		this.hashTagNo = hashTagNo;
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

	public void setUserNo(int usrNo) {
		this.userNo = usrNo;
	}

	public int getHashTagNo() {
		return hashTagNo;
	}

	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
