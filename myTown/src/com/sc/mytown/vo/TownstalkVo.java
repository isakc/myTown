package com.sc.mytown.vo;

import java.sql.Date;

import oracle.sql.CLOB;


public class TownstalkVo {

	private int no, userNo, guNo, dongNo;
	private String subject, title, repPicture, profile;
	private CLOB contents;
	private Date regDate;
	private String nickname;
	private int userGu, userDong, likeCount;
	
	public TownstalkVo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUserGu() {
		return userGu;
	}

	public void setUserGu(int userGu) {
		this.userGu = userGu;
	}

	public int getUserDong() {
		return userDong;
	}

	public void setUserDong(int userDong) {
		this.userDong = userDong;
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

	public int getGuNo() {
		return guNo;
	}

	public void setGuNo(int guNo) {
		this.guNo = guNo;
	}

	public int getDongNo() {
		return dongNo;
	}

	public void setDongNo(int dongNo) {
		this.dongNo = dongNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRepPicture() {
		return repPicture;
	}

	public void setRepPicture(String repPicture) {
		this.repPicture = repPicture;
	}

	public CLOB getContents() {
		return contents;
	}

	public void setContents(CLOB contents) {
		this.contents = contents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
