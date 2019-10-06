package com.sc.mytown.vo;

import java.sql.Date;

public class AddHashTagVo {

	private int no, contentNo, reviewNo, hashTagNo, typeNo, userNo, tagTypeNo;
	private Date regDate;
	private String tag;
	
	public AddHashTagVo(int contentNo, int reviewNo, int hashTagNo, int userNo) {
		super();
		this.contentNo = contentNo;
		this.reviewNo = reviewNo;
		this.hashTagNo = hashTagNo;
		this.userNo = userNo;
	}

	public AddHashTagVo(int contentNo, int hashTagNo,int reviewNo) {
		super();
		this.contentNo = contentNo;
		this.reviewNo = reviewNo;
		this.hashTagNo = hashTagNo;
	}
	
	public AddHashTagVo(int contentNo, int reviewNo) {
	      super();
	      this.contentNo = contentNo;
	      this.reviewNo = reviewNo;
	   }
	
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public AddHashTagVo() {
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
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getHashTagNo() {
		return hashTagNo;
	}
	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTagTypeNo() {
		return tagTypeNo;
	}
	public void setTagTypeNo(int tagTypeNo) {
		this.tagTypeNo = tagTypeNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
