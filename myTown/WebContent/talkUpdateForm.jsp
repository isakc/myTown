<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.TownstalksDAO"%>
<%@page import="com.sc.mytown.vo.TownstalkVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int talkNo = Integer.parseInt(request.getParameter("talkNo"));
	TownstalkVo talk = TownstalksDAO.talkSelectOne(talkNo);

	List<AddHashTagVo> addtags = AddHashTagsDAO.talkTagList(talkNo);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>talkUpdateForm</title>
    <%@include file="WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/dante-editor.css"/>
    <link rel="stylesheet" href="css/dante.css"/>
    <link rel="stylesheet" href="css/template.css"/>
    <link rel="stylesheet" href="css/townstalk/talkForm.css"/>
</head>
<body>
    <h1 class="screen_out">Talk 수정 페이지</h1>
     <%@ include file="/WEB-INF/template/header.jsp"%>

        <div class="content_btn">
            <a href="">TOWN SPOT</a>
            <a href="" class="on">TOWNS TALK</a>
        </div><!-- #btn -->
        <!-- #contents -->
        <div id="contents">
            <div id="form">
                <form action="" method="post" id="insertForm">
                    <fieldset>
                        <legend class="screen_out">게시글 입력 폼</legend>
                        <input type="hidden" name="talkNo" value="">
                        <div id="formHeader">
                            <div class="talk_category">
                                <select disabled>
                                    <option <%if(talk.getSubject().equals("타운정보")) {%>selected<%} %>>타운정보</option>
                                    <option <%if(talk.getSubject().equals("잡담")) {%>selected<%} %>>잡담</option>
                                    <option <%if(talk.getSubject().equals("질문")) {%>selected<%} %>>질문</option>
                                </select>
                            </div><!-- talkCategory -->
                            <div class="title_line">
                                <label for="title" class="label title">제목</label>
                                <input id="title" class="input_text" name="title" value="<%=talk.getTitle() %>" disabled/>
                            </div><!-- .title_line -->
                            <div class="hashtag_line">
                                <label for="hashtag" class="label hashtag">해시태그</label>
                                <input id="hashtag" class="input_text" name="hashtag" placeholder="'#'으로 구분 ex) #해시#태그 → 해시태그 2개" value="<%for(AddHashTagVo tag : addtags) {%>#<%=tag.getTag() %> <%}%>"/>
                            </div><!-- .hashtag_line -->
                        </div><!-- #formHeader -->
                    </fieldset>
                </form>
                <div id="danteBox"></div><!-- dante box -->
                <div id="formFooter">
                    <button class="btn_form" form="insertForm">수정하기</button>
                    <a href="talk.jsp?talkNo=<%=talk.getNo() %>" class="btn_form">취소</a>
                </div>
            </div>
        </div><!-- #contents end -->
        
         <%@ include file="/WEB-INF/template/footer.jsp"%>

    <script src="js/jquery.js"></script>
    <script src="js/content_btn_class.js"></script>
    <script src="js/underscore-min.js"></script>
    <script src="js/dante-editor.js"></script>
    <script src="js/sanitize.js"></script>
    <script>
        editor = new Dante.Editor(
            {
                el: "#danteBox",
                disable_title:true,
                body_placeholder:"글을 입력하세요.",
                base_widgets:["uploader"],
                image_caption_placeholder:"이미지에 대한 설명을 써주세요."
            }
        );
        editor.start();
    </script>
</body>
</html>