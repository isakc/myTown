<%@page import="com.sc.mytown.dao.GradesDAO"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int now = 1;

	String pageStr = request.getParameter("now");
	if (pageStr != null) {
		now = Integer.parseInt(pageStr);
	}
	int numPage = 6;
	int numBlock = 5;

	int total = SpotsDAO.selectTotal();

	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	no=1;
	PageVo pageVo = new PageVo(now, numPage, no,1);
	List<SpotVo> spots = SpotsDAO.selectSpotList(pageVo);

	SpotVo spotprf = SpotsDAO.selectPicList(no);
	String repPicture = spotprf.getRepPicture();

	UserVo user = UsersDAO.selectUserOne(no);
	String profile = user.getProfile();

	String paging = PaginateUtil.paginate(now, total, numPage, numBlock, "mySpot.jsp", "now=");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>마이페이지 My Spot</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/templates2.css" />
<link rel="stylesheet" href="css/recommendList.css" />
<link rel="stylesheet" href="css/mypage.css" />
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#wrap {
	width: 1080px;
	margin: auto;
}

h1.h1 {
	font-size: 40px;
	padding-bottom: 40px;
}

#nav {
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
	margin-bottom: 30px;
}

.tab.on {
	display: block;
	z-index: 1;
	color: #ffffff;
	background: #cccccc;
}

.foodtab {
	border-left: 1px solid #cccccc;
}

.paginate {
	width: 100%;
	color: #8080ff;
	text-align: center;
}

.paginate a, .paginate span, .paginate strong {
	font-size: 16px;
	padding: 10px 16px;
	text-decoration: none;
	display: inline-block;
	color: #8080ff;
}
/*현재 페이지*/
.paginate strong {
	font-size: 20px;
	background: #e6e6ff;
	font-weight: bold;
	cursor: not-allowed;
}
/*비활성화된 이전, 이후 페이지*/
.paginate span {
	cursor: not-allowed;
}
/* 링크*/
.paginate a:hover {
	background: #ccccff;
}

.btn_box {
	text-align: right;
}


.noPage{
	width: 400px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	margin-left: 300px;
	font-size: 35px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>

	<div class="content_btn">
		<a href="">TOWN SPOT</a> <a href="" class="on">TOWNS TALK</a>
	</div>
	<!-- #btn -->

	<!-- #contents -->
	<div id="contents">
		<%@include file="/WEB-INF/template/mypageHeader.jsp"%>
		<div id="wrap">
			<h1 class="h1">MY SPOT</h1>
			<div id="nav">
				<div class="tab">PlayTown</div>
				<div class="tab foodtab on">FoodTown</div>
			</div>
			<!-- //nav -->

			<div id="rSpotBox">
				<h2 class="screen_out">바텀메뉴</h2>
				<div id="foodTown" class="townList on">
					<div class="spotList">
						<ul class="posts">
							<%
								for (SpotVo spot : spots) {

									System.out.println(spot.getNo());
									if (spot.getTypeNo() == 3) {
										int num = spot.getNo();
										double grade = (double) GradesDAO.selectGrade(num) / 2;
							%>
							<li>
								<div class="post food">
									<div class="foodPostTop postTop">
										<div class="grade">
											<i class="fa fa-star"></i>
											<p>
												<em><%=grade%></em>
											</p>
										</div>
										<!-- grade -->

										<div class="text">
											<h4>
												<a href="" title=""><%=spot.getName()%></a> <i
													class="fa fa-bookmark-o bookmark"></i>
											</h4>
											<div class="spotHashTag">
												<ul>
													<%
														List<HashTagVo> hashtags = HashTagsDAO.selectHashtags(num);

																for (HashTagVo hashtag : hashtags) {
													%>
													<li>#<%=hashtag.getTag()%></li>
													<%
														}
													%>
												</ul>
											</div>
											<!--spotHashTag -->
										</div>
										<!-- text -->

										<div class="postProfile">
											<img class="postImg profileImg" src="img/<%=profile%>">
											<img class="postImg jumin" src="img/주민.jpg" />
										</div>
										<!-- profile -->
									</div>
									<!--postTop-->
									<div class="imageBox">
										<img src="img/<%=repPicture%>" />
									</div>
									<!--imageBox-->
								</div> <!-- post -->
							</li>
							<% }else{%>
							<li class="noPage">
								등록된 글이 없습니다.
							</li>
							<%
							}
								}
							%>
						</ul>
						<!-- posts -->
					</div>
					<!-- foodTownList -->
				</div>
				<!-- foodTown -->

				<div id="playTown" class="townList">
					<div class="spotList">
						<ul class="posts">
							<%
								for (SpotVo spot : spots) {
									if (spot.getTypeNo() == 4) {
										int num = spot.getNo();
										double grade = (double) GradesDAO.selectGrade(num) / 2;
							%>
							<li>
								<div class="post play">
									<div class="playPostTop postTop">
										<div class="grade">
											<i class="fa fa-star"></i>
											<p>
												<em><%=grade%></em>
											</p>
										</div>
										<!-- grade -->

										<div class="text">
											<h4>
												<a href="" title=""><%=spot.getName()%></a> <i
													class="fa fa-bookmark-o bookmark"></i>
											</h4>
											<div class="spotHashTag">
												<ul>
													<%
														List<HashTagVo> hashtags = HashTagsDAO.selectHashtags(num);
																for (HashTagVo hashtag : hashtags) {
													%>
													<li>#<%=hashtag.getTag()%></li>
													<%
														}%>
												</ul>
											</div>
											<!--spotHashTag -->
										</div>
										<!-- text -->

										<div class="postProfile">
											<img class="postImg profileImg" src="img/<%=profile%>" />
											<img class="postImg jumin" src="img/주민.jpg" />
										</div>
										<!-- profile -->
									</div>
									<!--postTop-->
									<div class="imageBox">
										<img src="img/<%=repPicture%>" />
									</div>
									<!--imageBox-->
								</div> <!-- post -->
							</li>
							<% }else{%>
							<li class="noPage">
								등록된 글이 없습니다.
							</li>
							<%
							}
								}
							%>
						</ul>
						<!-- posts -->
					</div>
					<!-- playTownList -->
				</div>
				<!-- playTown -->
			</div>
			<!--bottom -->
			<div>
				<%=paging%>
			</div>
			<!-- //paging -->
		</div>
		<!-- //wrap -->
	</div>
	<!-- //contents -->
	<%@ include file="/WEB-INF/template/footer.jsp"%>

	<script src="js/jquery.js"></script>
	<script src="js/content_btn_class.js"></script>
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

		});

		$(".tab").eq(1).click(function() {
			$("#foodTown").addClass("on");
			$("#playTown").removeClass("on");
		});

		$(".tab").eq(0).click(function() {
			$("#playTown").addClass("on");
			$("#foodTown").removeClass("on");
		});
	</script>
</body>
</html>
