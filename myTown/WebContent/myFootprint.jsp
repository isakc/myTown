<%@page import="com.sc.mytown.dao.RepliesDAO"%>
<%@page import="com.sc.mytown.vo.ReplyVo"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="com.sc.mytown.dao.GradesDAO"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% int now = 1;

	String pageStr = request.getParameter("now");
	if (pageStr != null) {
		now = Integer.parseInt(pageStr);
	}
	int numPage = 6;
	int numBlock = 5;

	int total = SpotsDAO.selectTotal();

	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	


	SpotVo spotprf = SpotsDAO.selectPicList(no);
	String repPicture = spotprf.getRepPicture();

	UserVo user = UsersDAO.selectUserOne(no);
	String profile = user.getProfile();
	
	PageVo pageVo = new PageVo(now, numPage, no,1);
	List<SpotVo> spots = SpotsDAO.selectSpotList(pageVo);
	
	int spotNo = 0;
	int array[] = new int[1000];
	
	List<SpotVo> spotsReplis = SpotsDAO.selectReplyList(no);
	
	String paging = PaginateUtil.paginate(now, total, numPage, numBlock, "mySpot.jsp", "no="+ no +"&now=");
	%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지 발자취</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/template.css" />
<link rel="stylesheet" href="css/recommendList.css" />
<link rel="stylesheet" href="css/mypage.css" />

<style>
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

.allTab {
	border-left: 1px solid #cccccc;
}

#bottom {
	width: 1020px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
}
.posts>a {
	cursor: pointer;
	text-decoration: none;
	color: black;
}

.layer {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 100;
	top: 0;
	background: rgba(0, 0, 0, .5);
}
.bg {
	width: 100%;
	height: 100%;
}

.layer .pop-layer {
	display: block;
}

.pop-layer {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 800px;
	height: 400px;
	padding: 5px 10px;
	margin-left: -400px;
	margin-top: -200px;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}
#gradeStar, #gradeStar p {
	width: 140px;
	height: 30px;
}
#gradeStar {
	background: url(img/star_1.png) no-repeat;
	background-size: contain;
	position: relative;
	
}
#gradeStar p {
	background: url(img/star_yellow_1.png) repeat-x;
	background-size: contain;
	position: absolute;
	width: 80%;
	height:29px;
	top:-1px;
	left:-1px;
}
#userComment {
	width: 800px;
	height: 320px;
	margin: 5px 0;
	position: relative;
	overflow-y: scroll;
}
#userComment .ctxt {
	box-shadow: 0 0 1px #ffffff;
	height:30px;
	margin: 5px 0;
	line-height: 30px;
	font-size: 20px;
}
.pop-layer .btn-r {
	width: 800px;
	margin: 10px 0;
	border-top: 1px solid #DDD;
	text-align: right;
	position: absolute;
	bottom: 0;
}
a.cbtn {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}

a.cbtn:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}*/

/*페이지*/
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

	<div id="contents">
		<%@include file="/WEB-INF/template/mypageHeader.jsp"%>
		<div id="wrap">
			<h1 class="h1">Footprint</h1>
			<div id="nav">
				<div class="tab ">PlayTown</div>
				<div class="tab allTab on">FoodTown</div>
			</div>
			<!-- //nav -->
			<div id="rSpotBox">
				<h2 class="screen_out">바텀메뉴</h2>
				<div id="foodTown" class="townList on">
					<div class="spotList">
						<ul class="posts">
						<%
								for (SpotVo spot : spotsReplis) {
									int num = spot.getNo();
									if (spot.getTypeNo() == 3) {
										double grade = (double) GradesDAO.selectGrade(num) / 2;
							%>
							<li>
								<div class="post">
									<div class="foodPostTop postTop">
										<div class="grade">
											<i class="fa fa-star"></i>
											<p>
												<em><%=grade%></em>
											</p>
										</div>
										<!--grade -->
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
											<img class="postImg profileImg" src="img/kim.jpg" /> <img
												class="postImg jumin" src="img/주민.jpg" />
										</div>
										<!-- profile -->
									</div>
									<!--foodPostTop postTop-->
									<a href="#" class="aBtn">
										<div class="imageBox">
											<img src="img/<%=repPicture%>" />
										</div>
										<!--imageBox-->
									</a>
								</div>
								<!-- post-->
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
						for (SpotVo spot : spotsReplis) {
							int num = spot.getNo();
							if (spot.getTypeNo() == 4) {
								double grade = (double) GradesDAO.selectGrade(num) / 2;
							%>
							<li>
								<div class="post play">
									<div class="playPostTop postTop">
										<div class="grade">
											<i class="fa fa-star"></i>
											<p>
												<em><%=grade %></em>
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
											<img class="postImg profileImg" src="img/<%=profile%>" /> <img
												class="postImg jumin" src="img/주민.jpg" />
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
							<%  }else{%>
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
		</div>
		<!-- //wrap -->
	</div>
	<!-- //contents -->

	<div class="layer">
		<div class="bg"></div>
		<div class="pop-layer">
			<div id="gradeStar">
				<p></p>
			</div><!-- //gradeStar -->
				<div id="userComment">
				<%
						for (SpotVo spot : spotsReplis) {
							
							int num = spot.getNo();
							
							ReplyVo reply = RepliesDAO.selectReplyOne(num);
							
							if (spot.getTypeNo() == 4) {
								
							%>
					<p class="ctxt"><%=reply.getContents() %></p>
					<%}else{ %>
					<p class="ctxt">리뷰가 없습니다^.^</p>
					<%} }%>
				</div><!--// #userComment -->
			<div class="btn-r">
				<a href="#" class="cbtn">Close</a>
			</div><!--// btn-r-->
		</div>
		<!--// layer-->
	</div>
	<!--// layer-->

	<%@ include file="/WEB-INF/template/footer.jsp"%>

	<script src="js/jquery.js"></script>
	<script src="js/content_btn_class.js"></script>
	<script>
		//리뷰보기
		$(".aBtn").click(function(e) {
			e.preventDefault();
			$(".layer").fadeIn(400);
		})

		$(".bg, .cbtn").click(function() {
			$(".layer").fadeOut(400);
		})

		//mypageHeader 함수
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

		//탭 함수
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
