<%@page import="com.sc.mytown.util.PaginateUtilsim"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.TownstalksDAO"%>
<%@page import="com.sc.mytown.vo.TownstalkVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String addressNoStr = request.getParameter("addressNo");
	String pageStr = request.getParameter("nowPage");
	String category = request.getParameter("category");
	
	session.setAttribute("addressNo", addressNoStr);
	session.setAttribute("nowPage", pageStr);
	session.setAttribute("category", category);
	
	int addressNo = Integer.parseInt(addressNoStr);
	
	Map<String, Object> bestTalkList = new HashMap<>();
	
	int now = 1;
	if(pageStr!=null) {
		now = Integer.parseInt(pageStr);
	}
	
	// 한 페이지에 보여질 목록 개수
	int numPage = 10;
	PageVo pageVo = new PageVo(now,numPage,addressNo,category);
	
	int total = 0;
	
	bestTalkList.put("list",TownstalksDAO.bestTalkList(pageVo));
	total = TownstalksDAO.bestTalkSelectTotal(addressNo);
	
	int numBlock = 10;
	
	bestTalkList.put("page",PaginateUtilsim.paginate(now, total, numPage, numBlock, "talkList.jsp", "page="));
	
	ObjectMapper talkOm = new ObjectMapper();
	String json = talkOm.writeValueAsString(bestTalkList);

%>
<%=json %>