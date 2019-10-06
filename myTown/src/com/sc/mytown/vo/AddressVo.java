package com.sc.mytown.vo;

import java.sql.Date;

public class AddressVo {

	private int no, parentsNo;
	private double lat, lng;
	private String name;
	private Date regDate;
	
	/* 추가 멤버필드 */
	private boolean isFavorite;
	/* 추가 getter setter */
	
	
	public boolean isFavorite() {
		return isFavorite;
	}

	public void setFavorite(boolean isFavorite) {
		this.isFavorite = isFavorite;
	}
	
	public AddressVo() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getParentsNo() {
		return parentsNo;
	}

	public void setParentsNo(int parentsNo) {
		this.parentsNo = parentsNo;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
