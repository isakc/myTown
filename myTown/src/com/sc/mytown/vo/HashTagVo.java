package com.sc.mytown.vo;

import java.sql.Date;

public class HashTagVo {
	private int no, tagType;
	private String tag;
	private Date regDate;
	
	public HashTagVo(int tagType, String tag) {
		super();
		this.tagType = tagType;
		this.tag = tag;
	}
	public HashTagVo(String tag) {
		super();
		this.tag = tag;
	}

	
	public HashTagVo() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getTagType() {
		return tagType;
	}
	public void setTagType(int tagType) {
		this.tagType = tagType;
	}
	
}
