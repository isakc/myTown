<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.vo.StampVo"%>
<%@page import="com.sc.mytown.dao.StampsDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int contentNo = Integer.parseInt(request.getParameter("contentNo"));
//int typeNo = Integer.parseInt(request.getParameter("typeNo"));
//int userNo = ((UserVo)session.getAttribute("loginTowner")).getNo();
int userNo = 51;

StampVo stampVo = new StampVo(contentNo,userNo);

//1) select를 해

int result = StampsDAO.selectStamp(stampVo);

boolean flag = false;

if(result>=1) {
	result = StampsDAO.deleteStamp(stampVo);
	if(result==1) {
		flag = false;
	}else {
		new Exception();
	}
}else {
	result = StampsDAO.insertStamp(stampVo);
	if(result==1) {
		flag = true;
	}else {
		new Exception();
	}

}

//2) 만약 있으면 삭제

//3) 만약 없으면 insert



%>
{"result":<%=flag %>}
