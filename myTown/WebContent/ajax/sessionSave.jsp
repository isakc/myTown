<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int addressNo = Integer.parseInt(request.getParameter("addressNo"));
	String category = request.getParameter("category");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	session.setAttribute("addressNo",addressNo);
	session.setAttribute("category",category);
	session.setAttribute("nowPage",nowPage);
%>
{"result":1}