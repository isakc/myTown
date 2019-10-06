<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="wrapAll">
	<!-- #header -->
	<div id="header">
		<a href="index.jsp" class="logo"><h1 id="logo"></h1>여기와볼래?(My Town)ㅍㅍ</a>
		<!-- login 전 -->
		<div id="login">
			<button class="login">로그인</button>
			<button class="join">회원가입</button>
		</div>
		<!-- #login -->

		<%@include file="/WEB-INF/template/loginForm.jsp"%>
		<%@include file="/WEB-INF/template/joinForm.jsp"%>

		<!-- login 후 -->
		<div id="user">
			<div class="nickname">
				<strong>유정이내뀨</strong>
			</div>
			<div id="profile">
				<img class="profile" src="img/유정이.jpg" alt="" width="50" height="50" />
				<div class="user_menu">
					<ul>
						<li><a href="myInfoUpdateForm.jsp?no=76">My Info</a></li>
						<li><a href="myStamp.jsp?no=76">Stamp</a></li>
						<li><a href="myFootprint.jsp?no=76">Foot Print</a></li>
						<li><a href="myTalk.jsp?no=76">My Talk</a></li>
						<li><a href="mySpot.jsp?no=76">My Spot</a></li>
						<li><a href="logout.jsp" class="logout">logout</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- #user -->

		<div class="header_btn_box">
			<a href="">Town Spot</a> <a href="">Towns Talk</a>
		</div>
		<!-- #btn -->
	</div>
	<!-- #header end -->