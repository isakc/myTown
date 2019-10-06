package com.sc.mytown.vo;

import java.sql.Date;

public class SpotVo {

	private int no, zipcode, typeNo, argPrice, founderNo, guNo, dongNo;
	private double lat, lng;
	private String name, address, detailAdd, repPicture, description, tell, openTime, site;
	private String wifi, parking, delivery;
	private Date regDate;

	private int hashTagNo;
	private boolean jumin;
	
	private String tag, profile;
	private int count;
	private double grade;
	
	public SpotVo() {
		// TODO Auto-generated constructor stub
	}
	
	public SpotVo(int zipcode, int typeNo, int founderNo, int guNo, int dongNo, double lat, double lng, String name,
			String address, String repPicture, String description, String tell, String openTime, String site, String wifi,
			String parking, String delivery) {
		super();
		this.zipcode = zipcode;
		this.typeNo = typeNo;
		this.founderNo = founderNo;
		this.guNo = guNo;
		this.dongNo = dongNo;
		this.lat = lat;
		this.lng = lng;
		this.name = name;
		this.address = address;
		this.repPicture = repPicture;
		this.description = description;
		this.tell = tell;
		this.openTime = openTime;
		this.site = site;
		this.wifi = wifi;
		this.parking = parking;
		this.delivery = delivery;
	}

	public SpotVo(int guNo, int typeNo) {
		this.typeNo = typeNo;
		this.guNo = guNo;
	}

	
	public SpotVo(int typeNo, int guNo, int dongNo) {
		super();
		this.typeNo = typeNo;
		this.guNo = guNo;
		this.dongNo = dongNo;
	}

	public SpotVo(int no, int argPrice, String a) {
		super();
		this.no = no;
		this.argPrice = argPrice;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}


	
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWifi() {
		return wifi;
	}

	public String getParking() {
		return parking;
	}

	public String getDelivery() {
		return delivery;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getArgPrice() {
		return argPrice;
	}

	public void setArgPrice(int argPrice) {
		this.argPrice = argPrice;
	}

	public int getFounderNo() {
		return founderNo;
	}

	public void setFounderNo(int founderNo) {
		this.founderNo = founderNo;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAdd() {
		return detailAdd;
	}

	public void setDetailAdd(String detailAdd) {
		this.detailAdd = detailAdd;
	}

	public String getRepPicture() {
		return repPicture;
	}

	public void setRepPicture(String repPicture) {
		this.repPicture = repPicture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}


	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getHashTagNo() {
		return hashTagNo;
	}

	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}

	public boolean isJumin() {
		return jumin;
	}

	public void setJumin(boolean jumin) {
		this.jumin = jumin;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	

	
}
