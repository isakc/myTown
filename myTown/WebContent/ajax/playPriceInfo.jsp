<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int contentNo = Integer.parseInt(request.getParameter("contentNo"));
int argPrice = Integer.parseInt(request.getParameter("argPrice"));

SpotVo spotVo = new SpotVo(contentNo, argPrice);

int result = SpotsDAO.updateSpotPrice(spotVo);

boolean flag = false;

if(result==1) {
	flag = true;
}else {
	new Exception();
}

%>
{"result":<%=flag %>}