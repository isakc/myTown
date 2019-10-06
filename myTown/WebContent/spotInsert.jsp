<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="oracle.net.aso.a"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	
	int guNo = Integer.parseInt(request.getParameter("guNo"));
	int dongNo = Integer.parseInt(request.getParameter("dongNo"));
	double lat = Double.valueOf(request.getParameter("lat"));
	double lng = Double.valueOf(request.getParameter("lng"));
	int zipcode = Integer.parseInt(request.getParameter("zipcode"));
	
	int typeNo = Integer.parseInt(request.getParameter("typeNo"));
	
	String repPicture = request.getParameter("repPicture");
	String description = request.getParameter("description");
	String tell = request.getParameter("tell");
	
	String startHour = request.getParameter("startHour");
	String startMin = request.getParameter("startMin");
	String endHour = request.getParameter("endHour");
	String endMin = request.getParameter("endMin");
	String openTime = startHour+":"+startMin+" ~ " + endHour+ ":" +endMin;
	
	String site = request.getParameter("site");
	String wifi = request.getParameter("wifi");
	String parking = request.getParameter("parking");
	String delivery = request.getParameter("delivery");
	
	int founderNo = 3;
	
	boolean flag = false;
	SpotVo spot = new SpotVo(zipcode, typeNo, founderNo, guNo, dongNo, lat, lng, name,
			address, repPicture, description, tell, openTime, site, wifi, parking, delivery);

	SpotsDAO.insertSpot(spot);
	
	int contentNo = spot.getNo();
	Integer hashTagNo = null;
	String hashTagList = request.getParameter("hashTag");
	String[] hash = hashTagList.split("#");
	
	for(String hashTag: hash){
		if(hashTag.trim().length()>0){
		flag = HashTagsDAO.selectByTag(hashTag);
		if(!flag){
			HashTagsDAO.insertHashTag(hashTag);
			hashTagNo = HashTagsDAO.selectByStringTag(hashTag);
			AddHashTagVo addHashTagVo = new AddHashTagVo(contentNo, hashTagNo, founderNo);
			AddHashTagsDAO.insertAddHashTags(addHashTagVo);
		}else{
			hashTagNo = HashTagsDAO.selectByStringTag(hashTag);
			AddHashTagVo addHashTagVo = new AddHashTagVo(contentNo, hashTagNo, founderNo);
			AddHashTagsDAO.insertAddHashTags(addHashTagVo);
		}}
	}
	
	//User loginUser = (User)session.getAttribute("loginUser");
	//int founderNo = loginUser.getNo();
	
	String[] secondCategorys = request.getParameterValues("secondCategory");

	Integer scVo = null;
	for(String sc : secondCategorys){
		if(sc.length()>0){
			scVo = HashTagsDAO.selectByStringTag(sc);
			AddHashTagVo addHashTagVo = new AddHashTagVo(contentNo, scVo, founderNo);
			AddHashTagsDAO.insertAddHashTags(addHashTagVo);
		}
	}
	
	if(typeNo==3){
		response.sendRedirect("foodtownSpot.jsp?no="+contentNo);
	}else{
		response.sendRedirect("playtownSpot.jsp?no="+contentNo);
	}
%>