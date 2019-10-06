<%@page import="com.sc.mytown.dao.LikesDAO"%>
<%@page import="com.sc.mytown.vo.LikeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int replyNo = Integer.parseInt(request.getParameter("contentNo"));
//int userNo = ((UserVo)session.getAttribute("loginTowner")).getNo();
int userNo = 51;

LikeVo likeVo = new LikeVo(userNo,replyNo);

//1) select를 해

int result = LikesDAO.selectLike(likeVo); //추천이미 했는지 확인

boolean flag = false;

if(result>=1) {
	result = LikesDAO.deleteLike(likeVo);
	if(result==1) {
		flag = false;
	}else {
		new Exception();
	}
}else {
	result = LikesDAO.insertLike(likeVo);
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
