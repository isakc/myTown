<%@page import="com.sc.mytown.dao.UserCategoriesDAO"%>
<%@page import="com.sc.mytown.vo.UserCategoryVo"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="java.sql.Date"%>
<%@page import="org.mhd.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%

UserVo user = new UserVo();

int no = user.getNo();

if(request.getParameter("nickname")!=null){
String nickname = request.getParameter("nickname");
user.setNickname(nickname);
}

if(request.getParameter("password")!=null){
String password = request.getParameter("password");
user.setPassword(password);
}

if(request.getParameter("gender")!=null){
String genderStr = request.getParameter("gender");
char gender = genderStr.charAt(0);
user.setGender(gender);
}


String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("date");


//if(!year.equals("선택") && !month.equals("선택")  && !day.equals("선택") ){
	String datestr = year + "-" + month + "-" + day;
	Date birth = Date.valueOf(datestr);
	user.setBirth(birth);
//}


if(request.getParameter("job")!=null){
String job = request.getParameter("job");
user.setJob(job);
}


String fstZipcodeStr = request.getParameter("fstZipcode");
int fstZipcode = Integer.parseInt(fstZipcodeStr);
user.setFstZipcode(fstZipcode);

String fstAdd = request.getParameter("fstAdd");
user.setFstAdd(fstAdd);

if(request.getParameter("fstDetailAdd")!=null){
String fstdetailAdd = request.getParameter("fstDetailAdd");
user.setFstdetailAdd(fstdetailAdd);
}

if( request.getParameter("secZipcode")!=null){
String secZipcodeStr = request.getParameter("secZipcode");
int secZipcode = Integer.parseInt(secZipcodeStr);
user.setFstZipcode(secZipcode);
}

if( request.getParameter("secAdd")!=null){
String secAdd = request.getParameter("secAdd");
user.setSecAdd(secAdd);
}

if(request.getParameter("secDetailAdd")!=null){
String secdetailAdd = request.getParameter("secDetailAdd");
user.setSecdetailAdd(secdetailAdd);
}




	String[] preferredArr = request.getParameterValues("preferred");
		
	if(preferredArr.length>0) {
		
		UserCategoriesDAO.deleteUserHash(no);
		
		for(String preferred:preferredArr){
				int hashtagNo = Integer.parseInt(preferred);
				UserCategoryVo userCategoryVo = new UserCategoryVo(no,hashtagNo);
				UserCategoriesDAO.insertUser(userCategoryVo);
				
		}
		
	}

	

UsersDAO.updateUser(user);

response.sendRedirect("myInfoUpdateForm.jsp?no="+no);
%>