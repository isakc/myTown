package com.sc.mytown.vo;

import java.sql.Date;

public class MenuVo {

	private int no, spotNo, price;
	private String name;
	private Date regDate;
	

	public MenuVo(int spotNo, int price, String name) {
		super();
		this.spotNo = spotNo;
		this.price = price;
		this.name = name;
	}

	
	public MenuVo() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
