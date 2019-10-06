<%@page import="com.sc.mytown.dao.RepliesDAO"%>
<%@page import="com.sun.corba.se.impl.orbutil.RepIdDelegator"%>
<%@page import="com.sc.mytown.vo.ReplyVo"%>
<%@page import="com.sc.mytown.dao.LikesDAO"%>
<%@page import="com.sc.mytown.vo.LikeVo"%>
<%@page import="com.sc.mytown.vo.HitVo"%>
<%@page import="com.sc.mytown.dao.HitsDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.TownstalksDAO"%>
<%@page import="com.sc.mytown.vo.TownstalkVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int now = 1;

	String pageStr = request.getParameter("now");
	if (pageStr != null) {
		now = Integer.parseInt(pageStr);
	}
	int numPage = 6;
	int numBlock = 5;

	int total = TownstalksDAO.selectTotal();
	
	PageVo pageVo = new PageVo(now, numPage);

	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	List<TownstalkVo> talkUsers = TownstalksDAO.selectTownstalkUser(no);
	List<TownstalkVo> townstalks = TownstalksDAO.getTownstalks(pageVo);
	
	
	List<ReplyVo> replies= RepliesDAO.selectReplyList(no);
	
	
	
	String paging = PaginateUtil.paginate(now, total, numPage, numBlock, "myTalk.jsp", "no="+no+"now=");
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지 townstalk</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/templates2.css" />
<link rel="stylesheet" href="css/mypage.css" />
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#wrap {
	width: 1080px;
	min-height: 1300px;
	margin: auto;
}

h1.h1 {
	font-size: 40px;
	padding-bottom: 40px;
}

#tab {
	width: 1080px;
	height: 50px;
	border-bottom: 1px solid #cccccc;
}

.tab {
	width: 100px;
	height: 50px;
	border-top: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	float: right;
	cursor: pointer;
	text-align: center;
	line-height: 50px;
}

.tab.on {
	z-index: 1;
	color: #ffffff;
	background: #cccccc;
}

.allTab {
	border-left: 1px solid #cccccc;
}

#nav {
	width: 1080px;
	height: 600px;
}

.talkTable, .talkTable2 {
	text-align: center;
}

tr, th, td {
	border: 1px solid #cccccc;
}

.talkTr td, th {
	height: 60px;
	line-height: 60px;
}

.talkTrTd td, th {
	height: 25px;
	line-height: 30px;
}

.thTitle {
	width: 808px;
	cursor: pointer;
}

.thDate {
	width: 200px;
}

.thRmd, .thDet, .thHit, .thNum {
	width: 90px;
}

.thDet button {
	cursor: pointer;
	width: 70px;
	height: 70px;
	border: 1px solid transparent;
	border-radius: 5px;
	font-size: 17px;
	background: #cff0da;
	outline: 0;
}

.mid {
	vertical-align: middle;
}

.table {
	display: none;
}

.table.on {
	display: block;
}

.tableContent {
	width: 1078px;
	margin: auto;
	margin-top: 30px;
}

.paginate {
	width: 100%;
	text-align: center;
}

.paginate a, .paginate span {
	font-size: 16px;
	padding: 10px 16px;
	text-decoration: none;
	display: inline-block;
}
/*현재 페이지*/
.paginate strong {
	font-size: 20px;
	background: #ffe6e6;
}
/*비활성화된 이전, 이후 페이지*/
.paginate span {
	cursor: not-allowed;
}
/* 링크*/
.paginate a:hover {
	background: #ffe6e6;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>

	<div class="content_btn">
		<a href="">TOWN SPOT</a> <a href="" class="on">TOWNS TALK</a>
	</div>
	<!-- #btn -->

	<div class="content_btn">
		<a href="">TOWN SPOT</a> <a href="" class="on">TOWNS TALK</a>
	</div>
	<!-- #btn -->
	<!-- #contents -->
	<div id="contents">
		<%@include file="/WEB-INF/template/mypageHeader.jsp"%>

		<div id="wrap">
			<h1 class="h1">등록한 TownsTalk</h1>
			<div id="tab">
				<div id="comments" class="tab">Comments</div>
				<div id="towntalk" class="tab allTab on">TownTalk</div>
			</div>
			<!-- //tab -->
			<div id="nav">
				<div id="content">
					<div class="tableContent">
						<table class="talkTable table on">
							<tr class="talkTrTd">
								<th class="thNum">번호</th>
								<th class="thTitle">제목</th>
								<th class="thDate">날짜</th>
								<th class="thHit">조회수</th>
								<th class="thRmd">추천수</th>
							</tr>
							<%
								for (TownstalkVo townstalk : talkUsers) {
									int twsNo = townstalk.getNo();
							%>
							<tr class="talkTr">
								<th class="thNum"><%=townstalk.getNo()%></th>
								<td class="thTitle"><%=townstalk.getTitle()%></td>
								<td class="thDate"><%=townstalk.getRegDate()%></td>
								<%
									HitVo hit = HitsDAO.selectHitOne(twsNo);
								%>
								<td class="thHit"><%=hit.getHit()%></td>
								<%
									int count = LikesDAO.selectLikeOne(twsNo);
								%>
								<td class="thRmd"><%=count%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
					<!-- //tableContent -->
					<div class="tableContent">
						<table class="talkTable2 table">
							<tr class="talkTrTd">
								<th class="thNum">번호</th>
								<th class="thTitle">제목/댓글</th>
								<th class="thDate">날짜</th>
								<th class="thHit">추천수</th>
							</tr>
							<%
							if(!replies.isEmpty()){
								for (ReplyVo reply : replies) {
									int twsNo = reply.getContentNo();
									List<TownstalkVo> talks = TownstalksDAO.selectTownstalkUser(twsNo);
										for(TownstalkVo talk:talks){
							%>
							<tr class="talkTr">
								<th class="thNum mid" rowspan="2"><%=talk.getNo()%></th>
								<td class="thTitle"><%=talk.getTitle()%></td>
								<td class="thDate mid" rowspan="2"><%=talk.getRegDate()%></td>
								<%
									HitVo hit = HitsDAO.selectHitOne(twsNo);
								%>
								<td class="thHit mid" rowspan="2"><%=hit.getHit()%></td>
							</tr>
							<tr class="talkTr">
								<%
										}
								%>
								
								<td class="thTitle"><%=reply.getContents() %></td>
							</tr>
							<%}
								}
									else{ %>
							<tr>
								<td class="thTitle" rowspan="4">댓글이 없습니다.</td>
							</tr>
							<%} %>
						</table>
					</div>
					<!-- //tableContent -->
				</div>
				<!-- //content -->
				<div>
					<%=paging%>
				</div>
			</div>
			<!-- //nav -->
			<div id="nav2">
				<div id="content2"></div>
				<!-- //content2 -->
			</div>
			<!-- //nav2 -->
		</div>
		<!-- //wrap -->
		<script src="js/jquery.js"></script>
		<script>
			var $myPageIcon = $("#myPageIcon li");

			var id;

			$myPageIcon.mouseenter(function() {
				var $img = $(this).find("img");

				test3($img);
			});

			$myPageIcon.mouseleave(function() {
				var $img = $(this).find("img");

				test2($img);
			});

			$myPageIcon.click(function() {
				var $img = $(this).find("img");

				test1($img);
			});

			function test1($img) {
				id = $img.attr("id");

				$img.attr("src", "img/" + id + "_gray.svg");
			}
			function test2($img) {
				id = $img.attr("id");

				$img.attr("src", "img/" + id + "_black.svg");
			}
			function test3($img) {

				//console.log($img);

				id = $img.attr("id");

				$img.attr("src", "img/" + id + ".png");
			}

			$(".tab").click(function() {

				$(".tab").removeClass("on");
				$(this).addClass("on");

				var id = $(this).attr("id");

				if (id == "comments") {
					$(".talkTable").removeClass("on");
					$(".talkTable2").addClass("on");
				} else if (id == "towntalk") {
					$(".talkTable2").removeClass("on");
					$(".talkTable").addClass("on");
				}

			});

		</script>
</body>
</html>