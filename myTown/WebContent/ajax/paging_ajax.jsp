<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.dao.GradesDAO"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int guNo = Integer.parseInt(request.getParameter("guNo"));
	String pageStr = request.getParameter("nowPage");
	
	int typeNo = Integer.parseInt(request.getParameter("typeNo"));
	int argPrice = Integer.parseInt(request.getParameter("argPrice"));
	String query = request.getParameter("query");
	Map<String, Object> spotList = new HashMap<>();
	
	int now = 1;
	if(pageStr!=null) {
		now = Integer.parseInt(pageStr);
	}
	// 한 페이지에 보여질 목록 개수
	int numPage = 6;
	PageVo pageVO = new PageVo(now,numPage, guNo, typeNo, query, argPrice);
	
	List<SpotVo> list =  SpotsDAO.spotsSelectList(pageVO);
	for(SpotVo spot : list){
		double grade = GradesDAO.selectGradeSpot(spot.getNo());
		spot.setGrade(grade);
		UserVo founder = UsersDAO.selectByFounderNo(spot.getFounderNo());
		spot.setProfile(founder.getProfile());
		List<HashTagVo> hashList = HashTagsDAO.selectPostsHashTags(spot.getNo());
		for(HashTagVo hashTag: hashList){
			String hashTagStr = "";
			hashTagStr+=hashTag.getTag();
			spot.setTag(hashTagStr);
		}
		if(spot.getGuNo()== founder.getGuNo()){
			spot.setJumin(true);
		}else{
			spot.setJumin(false);
		}
	}
	
	spotList.put("list",list);
	int numBlock = 10;
	int total = SpotsDAO.selectTotalsung( pageVO );
	
	spotList.put("page",PaginateUtil.paginate(now, total, numPage, numBlock,  "spotList.jsp" , "page="));
	
	ObjectMapper spotOm = new ObjectMapper();
	String json =  spotOm.writeValueAsString(spotList);
%>

<%=json %>