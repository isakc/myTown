<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String rootPath= request.getServletContext().getRealPath("/");	
String uploadPath= rootPath+"profile"+File.separator;
FileRenamePolicy frp= new DefaultFileRenamePolicy();
MultipartRequest mr = new MultipartRequest(request,uploadPath,1024*1024*100,"UTF-8",frp);

String fileName= mr.getFilesystemName("representation");
System.out.println(fileName);
%>
{"fileName":"<%=fileName %>"}