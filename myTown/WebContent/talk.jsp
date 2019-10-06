<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.sc.mytown.dao.TownstalksDAO"%>
<%@page import="com.sc.mytown.vo.TownstalkVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int talkNo = Integer.parseInt(request.getParameter("talkNo"));
	TownstalkVo talk = TownstalksDAO.talkSelectOne(talkNo);

	List<AddHashTagVo> addtags = AddHashTagsDAO.talkTagList(talkNo);
	String category = (String) session.getAttribute("category");
%>
<!DOCTYPE html>
<!--suppress ALL -->
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>talk</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/template.css" />
<link rel="stylesheet" href="css/townstalk/talk.css" />
<link rel="stylesheet" href="css/townstalk/talkMyReply.css" />
<link rel="stylesheet" href="css/townstalk/talkYourReply.css" />

</head>
<body>
	<h1 class="screen_out">Talk 상세내용 페이지</h1>
	<%@ include file="/WEB-INF/template/header.jsp"%>

	<div class="content_btn">
		<a href="">TOWN SPOT</a> <a href="" class="on">TOWNS TALK</a>
	</div>
	<!-- #btn -->
	<!-- #contents -->
	<div id="contents">
		<div id="talkAuxTop">
			<div class="user">
				<img src="img/<%=talk.getProfile()%>" alt="" width="70" height="70" />
				<span class="nickname"><%=talk.getNickname()%></span>
			</div>
			<div class="title_line">
				<span class="talk talk_type">[<%=talk.getSubject()%>]
				</span> <span class="talk talk_title"><%=talk.getTitle()%></span>
				<div class="hashtag_line">
					<%
						for (AddHashTagVo tag : addtags) {
					%>
					<span class="tag">#<%=tag.getTag()%></span>
					<%
						}
					%>
				</div>
				<!-- .hashtag_line -->
			</div>
			<div id="talkInfo">
				<span class="info hit"><i class="fa fa-eye"></i> 59회</span> <span
					class="info regdate"><%=talk.getRegDate()%></span>
			</div>
		</div>
		<div id="contentBox">
			<!--  표현식 이용 html 코드 출력(단테) -->
			<div class="ex"><%=talk.getContents()%></div>
		</div>
		<!-- #contentBox -->
		<div id="contentsFooter">
			<a href="talkList.jsp" class="btn_talk">목록으로</a> <a
				href="talkUpdateForm.jsp?talkNo=<%=talk.getNo()%>" class="btn_talk">글
				수정</a> <a href="delete.jsp?talkNo=<%=talk.getNo()%>" class="btn_talk">삭제</a>
		</div>
		<!-- 리뷰 시작 -->
		<h2 id="doReply">리뷰를 입력해 주세요!</h2>
		<div id="reply">
			<!-- 나의 리뷰 -->
			<div id="myReply">
				<div id="myPhoto">
					<img src="img/유정이.jpg" alt="" width="80" height="80" />
				</div>
				<div class="my_content">
					<textarea class="content"></textarea>
				</div>
				<div class="my_img_box">
					<button class="arrow left">&lt;</button>
					<div class="imgs">
						<ul class="img_list">
							<li><img src="img/1.jpg" alt="댓글사진1" /></li>
							<li><img src="img/1.jpg" alt="댓글사진1" /></li>
							<li><img src="img/1.jpg" alt="댓글사진1" /></li>
							<li><img src="img/2.jpg" alt="댓글사진1" /></li>
							<li><img src="img/2.jpg" alt="댓글사진1" /></li>
							<li><img src="img/2.jpg" alt="댓글사진1" /></li>
							<li><img src="img/2.jpg" alt="댓글사진1" /></li>
							<li><img src="img/3.jpg" alt="댓글사진1" /></li>
							<li><img src="img/3.jpg" alt="댓글사진1" /></li>
							<li><img src="img/3.jpg" alt="댓글사진1" /></li>
							<li><img src="img/3.jpg" alt="댓글사진1" /></li>
							<li><i class="fa fa-camera"></i></li>
						</ul>
					</div>
					<button class="arrow right">&gt;</button>
				</div>
				<button class="btn insert">등록</button>
			</div>
			<!-- myReply -->

			<!-- 너의 리뷰 -->
			<div id="yourReply">
				<ul>
					<li>
						<div class="reply_header">
							<!-- 글쓴이 날짜 좋아요 -->
							<div id="yourPhoto">
								<img src="img/유정이.jpg" alt="" />
							</div>
							<div id="nameNdate">
								<div class="regdate">2017.03.31</div>
								<div class="yourName">유정이내뀨</div>
								<div class="yourHashtag">#미술 #박물관 #서울대 #관악구 #대학동 #MoA
									#너무예뻥</div>
							</div>
							<div class="like">
								<button class="r_icon">
									<i class="fa fa-thumbs-o-up"></i>
								</button>
								<div class="r_num">45</div>
							</div>
							<!-- like end -->
						</div>
						<!-- reply_header end -->

						<div class="your_content">
							<!-- 댓글 내용 -->
							망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브
							재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ
							메인메뉴로 코코뱅이 나오구, 9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈
							밴드도 공연을 해주시구요. 일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로
							손색이 없어요. 여기가 좀 더 조리를 오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서
							주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을
							해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이
							나오구, 9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 망고플레이트에서 주신 와인 나잇
							초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을 해주시구요.
							망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 9가지의
							타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요. 일단 메인
							메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가 좀 더 조리를
							오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에
							아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신
							와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 9가지의 타파스 그리고
							15가지 종류의 와인을 가져다 먹을 수 있어요.
						</div>

						<div class="btn_box user_check">
							<!-- 버튼 -->
							<button class="btn update">수정</button>
							<button class="btn delete">삭제</button>
						</div>
					</li>
					<!-- li end -->

					<li>
						<div class="reply_header">
							<!-- 글쓴이 날짜 좋아요 -->
							<div id="yourPhoto">
								<img src="img/유정이.jpg" alt="" />
							</div>
							<div id="nameNdate">
								<div class="regdate">2017.03.31</div>
								<div class="yourName">유정이내뀨</div>
								<div class="yourHashtag">#미술 #박물관 #서울대 #관악구 #대학동 #MoA
									#너무예뻥</div>
							</div>
							<div class="like">
								<button class="r_icon">
									<i class="fa fa-thumbs-o-up"></i>
								</button>
								<div class="r_num">45</div>
							</div>
							<!-- like end -->
						</div>
						<!-- reply_header end -->

						<div class="your_content">
							<!-- 댓글 내용 -->
							망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브
							재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ
							메인메뉴로 코코뱅이 나오구, 9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈
							밴드도 공연을 해주시구요. 일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로
							손색이 없어요. 여기가 좀 더 조리를 오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서
							주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을
							해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이
							나오구, 9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 망고플레이트에서 주신 와인 나잇
							초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을 해주시구요.
							망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 9가지의
							타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요. 일단 메인
							메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가 좀 더 조리를
							오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에
							아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신
							와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구, 9가지의 타파스 그리고
							15가지 종류의 와인을 가져다 먹을 수 있어요.
						</div>

						<div class="your_img_box">
							<!-- 사진 -->
							<button class="arrow left">&lt;</button>
							<div class="imgs">
								<ul class="img_list">
									<li><img src="img/1.jpg" alt="댓글사진1" /></li>
									<li><img src="img/2.jpg" alt="댓글사진1" /></li>
									<li><img src="img/3.jpg" alt="댓글사진1" /></li>
									<li><img src="img/4.jpg" alt="댓글사진1" /></li>
									<li><img src="img/4.jpg" alt="댓글사진1" /></li>
									<li><img src="img/5.jpg" alt="댓글사진1" /></li>
								</ul>
							</div>
							<button class="arrow right">&gt;</button>
						</div>

						<div class="btn_box user_check">
							<!-- 버튼 -->
							<button class="btn update">수정</button>
							<button class="btn delete">삭제</button>
						</div>

					</li>
				</ul>
			</div>
			<!-- yourReply -->
		</div>
		<!-- #reply -->
		<!-- 리뷰 끝 -->
	</div>
	<!-- #contents end -->
	<%@ include file="/WEB-INF/template/footer.jsp"%>

	<script src="js/jquery.js"></script>
	<%@include file="/WEB-INF/template/logBoxScript.jsp" %>
	<script src="js/content_btn_class.js"></script>
	<script>
		var imgX = 0;

		var $myArrow = $(".my_img_box .arrow");
		var $myImgs = $(".my_img_box .img_list").find("li").length;
		/*$myArrow.hide();*/
		var myImgX = 0;

		$myArrow.click(function() {
			var $this = $(this);
			$this.parent().find(".arrow").show();
			if ($this.hasClass("left")) {
				myImgX = myImgX - 100;
			} else {
				myImgX = myImgX + 100;
			}
			imgX = myImgX * 10;
			imgX = Math.ceil(imgX.toFixed(1)) / 10;
			var num = $this.parent().find(".imgs").find("ul")
					.find("li").length;
			$this.parent().find(".imgs").find("ul").css("left", imgX);
			if (imgX == 0 || imgX == (num - 8) * -100) {
				$this.hide();
			}
		})

		var $yourArrow = $(".your_img_box .arrow");
		var yourImgX = 0;
		$yourArrow.click(function() {
			var $this = $(this);
			$this.parent().find(".arrow").show();
			if ($this.hasClass("left")) {
				yourImgX = yourImgX - 127.8;
			} else {
				yourImgX = yourImgX + 127.8;
			}
			imgX = yourImgX * 10;
			imgX = Math.ceil(imgX.toFixed(1)) / 10;
			var num = $this.parent().find(".imgs").find("ul")
					.find("li").length;
			$this.parent().find(".imgs").find("ul").css("left", imgX);

			if (imgX == 0 || imgX == (num - 8) * -127.8) {
				$this.hide();
			}
		})
	</script>
	<script src="js/jquery.nanoscroller.min.js"></script>
	<script>
		$(".nano").nanoScroller();
	</script>
</body>
</html>