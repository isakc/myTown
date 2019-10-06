<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="loginBox">
	<div class="bg"></div>
	<div id="loginForm">
		<div class="cancel_btn">×</div>
        <h2 class="login_form">로그인</h2>
        <div class="login">
            <input id="id" class="login_input" name="id" placeholder="아이디(이메일) 입력"/>
            <input id="password" class="login_input" name="password" type="password" placeholder="비밀번호 입력"/>
        </div>
        <span class="msg_box">아이디 / 비밀번호가 맞지 않습니다. 다시 확인해 주세요.</span>
        <div class="check_box">
            <label>
                <input type="checkbox" id="loginCheck" class="login_check_box" name="loginCheck"/>자동로그인
            </label>
            <label>
                <input type="checkbox" id="idCheck" class="login_check_box" name="idCheck"/>아이디 저장
            </label>
        </div>
        <button class="user_login_btn">로그인</button>
        <span class="login_link">
            <a href="" class="link">비밀번호 찾기</a>
            /
            <a href="" class="link">회원가입</a>
        </span>
	</div>
</div><!-- #loginBox -->