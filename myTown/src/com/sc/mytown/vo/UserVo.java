package com.sc.mytown.vo;

import java.sql.Date;
import java.util.Calendar;

public class UserVo {

	private int no, fstZipcode,secZipcode, guNo, dongNo, subGuNo, subDongNo;
	private String id, nickname, password, job, profile, fstAdd, fstdetailAdd, secAdd, secdetailAdd;
	private char gender;
	private Date birth, regDate;
	private Calendar cal;
	private int age, year, month, date, endDay;
	
	public UserVo() {
		cal = Calendar.getInstance();
	}
	
	public UserVo(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	
	public UserVo(String id, String nickname, String password, int fstZipcode, String fstAdd, String fstdetailAdd,
			int guNo, int dongNo, String profile, char gender, Date birth, String job, int secZipcode, String secAdd,
			String secdetailAdd, int subGuNo, int subDongNo) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.fstZipcode = fstZipcode;
		this.fstAdd = fstAdd;
		this.fstdetailAdd = fstdetailAdd;
		this.guNo = guNo;
		this.dongNo = dongNo;
		this.profile = profile;
		this.gender = gender;
		this.birth = birth;
		this.job = job;
		this.secZipcode = secZipcode;
		this.secAdd = secAdd;
		this.secdetailAdd = secdetailAdd;
		this.subGuNo = subGuNo;
		this.subDongNo = subDongNo;
	}

	
	public void setBirth(Date birth) {
		this.birth = birth;

		cal = Calendar.getInstance();

		int nowYear = cal.get(Calendar.YEAR);

		// 현재 날짜를 객체화,
		cal.setTime(birth);

		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		date = cal.get(Calendar.DATE);

		age = nowYear - year + 1;
		endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	}

	public String getProfile() {
		return profile;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDate() {
		return date;
	}

	public int getEndDay() {
		return endDay;
	}

	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFstZipcode() {
		return fstZipcode;
	}

	public void setFstZipcode(int fstZipcode) {
		this.fstZipcode = fstZipcode;
	}

	public int getSecZipcode() {
		return secZipcode;
	}

	public void setSecZipcode(int secZipcode) {
		this.secZipcode = secZipcode;
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

	public int getSubGuNo() {
		return subGuNo;
	}

	public void setSubGuNo(int subGuNo) {
		this.subGuNo = subGuNo;
	}

	public int getSubDongNo() {
		return subDongNo;
	}

	public void setSubDongNo(int subDongNo) {
		this.subDongNo = subDongNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String string() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getFstAdd() {
		return fstAdd;
	}

	public void setFstAdd(String fstAdd) {
		this.fstAdd = fstAdd;
	}

	public String getFstdetailAdd() {
		return fstdetailAdd;
	}

	public void setFstdetailAdd(String fstdetailAdd) {
		this.fstdetailAdd = fstdetailAdd;
	}

	public String getSecAdd() {
		return secAdd;
	}

	public void setSecAdd(String secAdd) {
		this.secAdd = secAdd;
	}

	public String getSecdetailAdd() {
		return secdetailAdd;
	}

	public void setSecdetailAdd(String secdetailAdd) {
		this.secdetailAdd = secdetailAdd;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}


	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Calendar getCal() {
		return cal;
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}
	
}
