<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int guNo = Integer.parseInt(request.getParameter("guNo"));

	int typeNo = Integer.parseInt(request.getParameter("typeNo"));
	
	SpotVo spot = new SpotVo(guNo, typeNo);
	
	List<HashTagVo> list = AddHashTagsDAO.selectGuAddHashTagVo(spot);
	ObjectMapper om = new ObjectMapper();

	String json = om.writeValueAsString(list);
%>

<%=json%>