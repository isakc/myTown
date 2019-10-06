<%@page import="com.sc.mytown.dao.StampsDAO"%>
<%@page import="com.sc.mytown.vo.StampVo"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.sc.mytown.dao.AddressDAO"%>
<%@page import="com.sc.mytown.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int userNo = 3;
	int guNo = Integer.parseInt(request.getParameter("guNo"));
	session.setAttribute("addressNo", guNo);
	
	List<AddressVo> dongList = AddressDAO.dongSelectList(guNo);
	List<StampVo> favoriteList = StampsDAO.getFavotiteList(userNo);
	
	for(AddressVo addressVo : dongList){
		
		for(StampVo stampVo :favoriteList) {
			if(stampVo.getContentNo()==addressVo.getNo()) {
				addressVo.setFavorite(true);
				break;
			}
		}
	}
	
	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(dongList);
	
	out.print(json);
%>