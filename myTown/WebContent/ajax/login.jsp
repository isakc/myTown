<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id, password;
	id = request.getParameter("id");
	password = request.getParameter("password");
	
	UserVo user = new UserVo(id,password);
	UserVo loginUser = UsersDAO.selectLogin(user);
	boolean flag = false;
	
	if(loginUser == null) {
		// 로그인 안되었다는 정보를 세션에 세팅
		session.setAttribute("msg", "아이디 / 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
	}else{
		session.setAttribute("loginUser", loginUser);
		flag = true;
	} 
%>
{"result":<%=flag %>}