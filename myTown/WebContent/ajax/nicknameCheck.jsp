<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String nickName = request.getParameter("nickname");

int num = UsersDAO.selectCheckId(nickName);

boolean flag = false;

if(num==0) {
	flag = true;
}

%>
{"result":<%=flag %>}    
