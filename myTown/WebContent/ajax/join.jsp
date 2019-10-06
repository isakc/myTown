<%@page import="com.sc.mytown.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id, nickname, password, fstZipCodeStr, fstAdd, fstDetailAdd,
		foodCategory, playCategory, genderStr, year, month, day, jop,
		secZipCodeStr, secAdd, secDetailAdd;
	id = request.getParameter("id");
	nickname = request.getParameter("nickname");
	password = request.getParameter("password");
	fstZipCodeStr = request.getParameter("fstZipCode");
	int fstZipCode = Integer.parseInt(fstZipCodeStr);
	fstAdd = request.getParameter("fstAdd");
	fstDetailAdd = request.getParameter("fstDetailAdd");
	
	genderStr = request.getParameter("gender");
	char gender;
	if(request.getParameter("gender")!=null){
		
	}
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	String dayStr = request.getParameter("day");
	if(!(yearStr.equals("선택")) && !(monthStr.equals("선택")) && !(dayStr.equals("선택"))) {
		year = yearStr;
		month = monthStr;
		day = dayStr;
	}
	secZipCodeStr = request.getParameter("secZipCode");
	String secAddStr = request.getParameter("secAdd");
	String secDetailAddStr = request.getParameter("secDetailAdd");
	int secZipCode;
	if(secZipCodeStr!=null && secAddStr!=null) {
		secZipCode = Integer.parseInt(secZipCodeStr);
		secAdd = secAddStr;
	}
	if(secDetailAddStr!=null) {
		secDetailAdd = secDetailAddStr;
	}
	
	UserVo userVo = new UserVo();
	
	
	/*
	String[] preferredArr = request.getParameterValues("preferred");
	if(preferredArr.length>0) {
		for(String preferred : preferredArr){
			int hashtagNo = Integer.parseInt(preferred);
			UserCategoryVo userCategoryVo = new UserCategoryVo(no,hashtagNo);
			UserCategoriesDAO.insertUser(userCategoryVo);
		}
	}
	*/
%>
{"result":0}

