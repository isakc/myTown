<%@page import="com.sc.mytown.dao.MenuDAO"%>
<%@page import="com.sc.mytown.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int spotNo = Integer.parseInt(request.getParameter("contentNo"));
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));

MenuVo menuVo = new MenuVo(spotNo,price,name);

int result = MenuDAO.insertMenu(menuVo);

boolean flag = false;

if(result==1) {
	flag = true;
}else {
	new Exception();
}

%>
{"result":<%=flag %>}