package com.sc.mytown.vo;

public class PageVo {

	private int start, end, typeNo, addressNo, founderNo, userNo, argPrice, contentNo;
	private String query;
	private String category;

	public PageVo() {
		// TODO Auto-generated constructor stub
	}

	public PageVo(int now, int numPage, int contentNo,float a) {
		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.contentNo = contentNo;
	}

	public PageVo(int now, int numPage, int userNo, double a) {
		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.userNo = userNo;
		// TODO Auto-generated constructor stub
	}

	public PageVo(int now, int numPage, int addressNo) {
		super();
		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.addressNo = addressNo;
	}

	public PageVo(int now, int numPage, int addressNo, String category) {
		super();
		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.addressNo = addressNo;
		this.category = category;
	}

	public PageVo(int now, int numPage) {
		this.end = now * numPage;
		this.start = end - (numPage - 1);
	}

	public PageVo(int now, int numPage, int founderNo, int a) {
		super();
		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.founderNo = founderNo;
	}

	public PageVo(int now, int numPage, int addressNo, int typeNo, String query, int argPrice) {

		this.end = now * numPage;
		this.start = end - (numPage - 1);
		this.typeNo = typeNo;
		this.addressNo = addressNo;
		this.query = query;
		this.argPrice = argPrice;
	}
	
	

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public int getArgPrice() {
		return argPrice;
	}

	public void setArgPrice(int argPrice) {
		this.argPrice = argPrice;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getFounderNo() {
		return founderNo;
	}

	public void setFounderNo(int founderNo) {
		this.founderNo = founderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
