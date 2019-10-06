<%@page import="com.sc.mytown.dao.PicturesDAO"%>
<%@page import="com.sc.mytown.vo.PictureVo"%>
<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.dao.RepliesDAO"%>
<%@page import="com.sc.mytown.vo.ReplyVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int contentNo = Integer.parseInt(request.getParameter("contentNo"));
//typeNo = 1
//int userNo = ((UserVo)session.getAttribute("loginTowner")).getNo();
int userNo = 51;

String contents = request.getParameter("contents");
String tags = request.getParameter("tags");

String[] tagsArr = tags.split(",");

String reImgs= request.getParameter("imgs");
String[] reImgsArr = reImgs.split(",");

ReplyVo replyVo = new ReplyVo(contentNo, userNo, contents);
int result = RepliesDAO.insertReply(replyVo);

int replyNo = replyVo.getNo();
System.out.println(replyNo);
//위에서 reply테이블에 새로운 reply를 만든후 그 reply의 replyNo을 가져와야해***********************



boolean flag = false;
if(result==1) {
	
	flag = true;	
		
		//tag
		for(String tag : tagsArr) {
			System.out.println(tag);
			//tag가 hashtag 테이블에 있는지 비교
			Integer hashNo = HashTagsDAO.selectBytag(tag);
			
				if(hashNo==null){
					//1.(hashNo == null) 없으면 hashtag 테이블에 추가 후 addHashTag 테이블에 추가
					//여기서 tagtype(8)
					//HashTagsDAO.insert(tag); //tag를 hashTag 테이블에 추가
					HashTagsDAO.insertTag(tag);
					
					//추가한 tag의 번호를 가져와 //얘는 잘되네**
					int newHashNo = HashTagsDAO.selectBytag(tag);
					System.out.println(newHashNo);
					//addHashTag 테이블에 추가 typeNo(1)
					AddHashTagVo addHashtagVo = new AddHashTagVo(contentNo,replyNo,newHashNo,userNo);
					//AddHashTagsDAO.insert(addHashtagVo);
					AddHashTagsDAO.insertAddHashTag(addHashtagVo);
				}else{
					//2. (hashNo != null)있으면 그 번호를 가져와서 addHashTag테이블에만 추가
					//그 번호를 가져와 - hashNo
					//addhashtag 테이블에 추가 typeNo(1)
					//AddHashTagVo addHashtagVo = new AddHashTagVo(contentNo,replyNo,hashNo,userNo);
					AddHashTagVo addHashtagVo = new AddHashTagVo(contentNo,replyNo,hashNo,userNo);
					AddHashTagsDAO.insertAddHashTag(addHashtagVo);
				}
		}//for end

		//img
		for(String img : reImgsArr){
			System.out.println(img);
			//사진테이블에 입력할 값들 : picture(사진이름) contentNo(contentNo) reviewNo(replyNo) typeNo(1)
			PictureVo pictureVo = new PictureVo(contentNo, replyNo, img);
			PicturesDAO.insertRePicture(pictureVo);
		}
}else {
	new Exception();
}

%>
{"result":<%=flag %>}