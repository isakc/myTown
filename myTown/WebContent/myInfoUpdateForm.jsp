<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.UserCategoriesDAO"%>
<%@page import="com.sc.mytown.vo.UserCategoryVo"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	UserVo user = UsersDAO.selectUserOne(no);
	
	Calendar cal= Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	
	List<UserCategoryVo> userCtg = UserCategoriesDAO.selectUserHashList(no);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 회원정보폼</title>
<%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/template.css"/>
     <link rel="stylesheet" href="css/mypage.css"/>
    <style>
     body {
        font-family: 'Noto Sans KR', sans-serif;
        }

        #wrap {
            width: 1080px;
            margin: auto;
        }

        #form {
            margin-left: 100px;
        }

        h1.h1 {
            font-size: 40px;
            padding-bottom: 40px;
        }


        #content {
            width: 900px;
            height: 354px;
            position: relative;
        }

        #userPicture {
            width: 302px;
            height: 352px;
            cursor: pointer;
            padding-top: 30px;
        }

        #userInfo {
            width: 596px;
            height: 352px;
            position: absolute;
            top:130px;
            left:390px;
        }

        #userInfo .userInfo {
            padding: 25px;
        }

        #userInfo .userInput {
            width: 250px;
            height: 30px;
            padding: 2px;
            margin-top: -5px;
            border-radius: 5px;
            position: absolute;
            left: 200px;
        }
        .msg_box {
        display: none;
	        background: red;
        }

        #addForm {
            width: 900px;
            margin-top: 100px;
        }

        #addInfo .info {
            padding-bottom: 10px;
        }

        #addInfo {
            width: 1080px;
            margin-top: 10px;
        }

        #preferred {
            width: 1080px;
            margin-bottom: 50px;
        }

        .td{
            border-right: 1px solid #cccccc;
            padding: 10px;

        }

        #preferred .td{
            height: 113px;
            line-height:110px;
        }

        .tr {
            border-bottom: 1px solid #cccccc;
        }

        .addInfo .rightTd{
            padding: 20px;
        }


        .rightTd{

            vertical-align: middle;
        }



        #wrap td.td{
            width: 200px;
            height: 60px;
        }

        ul{
            padding-left: 20px;
            padding-bottom: 10px;
            width: 676px;
            height: 50px;
        }

        .infoInput{
            margin: 5px;
            padding: 6px;
            border-radius: 10px;
       }

        .add{
            width: 200px;
            height: 30px;
        }
        
        .addsize{
            width: 300px;
            height: 30px;
        }

        #userDetailAdd,#userDetailAdd2 {
            width: 300px;
        }


        #preferred ul li {
            font-size: 22px;
            float: left;
            padding: 5px;
        }

        #preferred li input {
             width: 22px;
             height:22px;
         }

        #preferred li>label {
            width: 22px;
            height:22px;
            line-height: 22px;
        }

        h2  {
            font-size: 23px;
            margin-bottom: 10px;
            margin-top: 20px;
        }

        .info {
            font-size: 20px;
        }

        .addInfoInput{
            font-size: 20px;
        }

        .addInfoSpan{
            border-top:5px solid #cccccc;
            border-bottom:5px solid #cccccc;
            width: 980px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            font-size: 30px;
        }

        .addBtn {
            width: 140px;
            height: 46px;
            border: 1px solid transparent;
            border-radius: 10px;
            font-size: 17px;
        }

        #updateBtn {
            border-top:1px solid #cccccc;
            padding-top: 50px;
            padding-bottom: 50px;
            text-align: center;
        }

        .updateBtn{
            width: 150px;
            height: 70px;
            border: 1px solid transparent;
            border-radius: 20px;
            cursor:pointer;
            font-size: 30px;
        }

        .btn{
            background: #cff0da;
            outline:0;
        }

        .btn:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
        
       #checkPwd, #checknickName{
        	margin-left: 200px;
       		font-size: 15px; 
        }
        
        #representationBox{
            position: absolute;
            left: 100px;
            top:150px;
            width: 268px;
            height: 268px;
            border: 1px solid  #757575;
            position: absolute;
            transition:.2s ease;
        }
        #representationBox img {
            width: 268px;
            height: 268px;
        }
        #representationBox>.button{
            border:none;
            outline: none;
            background: transparent;
        }
        .fa-camera{
           position:absolute;
           right:0;
            font-size: 30px;
            color:#757575;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <%@ include file="/WEB-INF/template/header.jsp"%>
    
        <div class="content_btn">
            <a href="">TOWN SPOT</a>
            <a href="" class="on">TOWNS TALK</a>
    	</div><!-- content_btn -->
  <form id="uploadForm" method="post" enctype="multipart/form-data"></form> 
  <input type="hidden" name="representation" class="representation"> 	
    <div id="contents">
          <%@include file="/WEB-INF/template/mypageHeader.jsp" %>
        <div id="wrap">
            <h1 class="h1">MY INFO</h1>
            <form action="myInfoUpdate.jsp" method="post" id="form">
                <fieldset>
                    <legend class="screen_out">회원수정폼</legend>
                    <div id="content">
                        <div class="addInfoSpan">
                            <span>필수 정보</span>
                        </div>
                       <div id="representationBox">
							<label  class="button camera">
							<input form="uploadForm" type="file" name="representation" id="representation" accept="image/*"
								title="대표사진 선택" hidden/>
							<i class="fa fa-camera" aria-hidden="true"></i>
							<img id="representationImg" src="<%=user.getProfile() %>" width="100" height="100">
							</label>
						</div>
                        <div id="userInfo">
                            <div class="userId userInfo">
                                <label for="id" class="info">아이디(이메일)</label>
                                <input id="id" type="text" name="id" disabled value="<%=user.getId()%>" class="userInput"/>
                            </div>
                            
                            <div class="userNick userInfo">
                                <label for="nickname" class="info">닉네임</label>
                                <input type="text" id="nickname" 
                                       value="<%=user.getNickname() %>"
                                       name="nickName" class="userInput"/>
                                <div class="word checkMsg"></div>
                            </div>
                          <span class="msg_box">닉네임이 맞지 않습니다. 다시 확인해 주세요.</span>
                            <div class="userPwd userInfo info">
                                <label for="password" class="info">비밀번호</label>
                                <input type="password" id="password"
                                       placeholder="비밀번호"
                                       name="password" class="userInput" />
                                <div class="word"></div>
                            </div>
                            
                            <div class="userPwdRig userInfo info" >
                                <label for="pwdRight" class="info">비밀번호 확인</label>
                                <input type="password" id="pwdRight" class="userInput"
                                       placeholder="비밀번호 재확인" onkeyup="checkPwd()"
                                       name="pwdRight"/>
                                <div class="word"></div>
                            </div>
                        </div><!-- //userInfo -->
                       
                    </div><!-- //content -->
                    
                    <div id="addForm">
                        <h2>주소입력</h2>
                        <input type="text" id="sample6_postcode" class="infoInput add"
                               placeholder="우편번호" value="<%=user.getFstZipcode() %>"
                               name="fstZipcode"/>
                        <input type="button" class="add addBtn btn" onclick="sample6_execDaumPostcode1()" value="우편번호 찾기"><br>
                        <input type="text" id="sample6_address" class="infoInput addsize"
                               placeholder="주소" value="<%=user.getFstAdd() %>"
                               name="fstAdd"/>
                        <input type="text" id="sample6_address2" class="infoInput addsize"
                               placeholder="상세주소" <%if(user.getFstdetailAdd()!=null) {%>value="<%=user.getFstdetailAdd() %>"<%} %>
                               name="fstDetailAdd"/>
                               
                    </div><!-- //addForm -->
                    <table id="preferred" class="info">
                            <h2>선호유형</h2>
                                <tr class="tr">
                                    <td class="td">
                                        <h2 class="info">Food Town</h2>
                                    </td>
                                    <td class="rightTd">
                                   <ul>
                                   <%
                                   		int array[]=new int[26];
                                   		for(UserCategoryVo usercate: userCtg){
                                   			int num = usercate.getHashTagNo();
                                   			array[num]= num;
                                   		}
                                   %>
                                    <li><input type="checkbox" id="koreaFood" name="preferred"  value="1" 
                                    <% if(array[1] ==1) {%>checked = "checked"<%} %> />
                                        <label for="koreaFood">한식</label></li>
                                    <li><input type="checkbox" id="japanFood" name="preferred" value="2"
                                    <% if(array[2] ==2) {%>checked = "checked" <%} %> />
                                        <label for="japanFood">일식</label></li>
                                    <li><input type="checkbox" id="chinaFood" name="preferred" value="3"
                                    <% if(array[3] ==3) {%>checked = "checked"<%} %> />
                                        <label for="chinaFood">중식</label></li>
                                    <li><input type="checkbox" id="asiaFood" name="preferred"  value="4"
                                    <% if(array[4] ==4) {%>checked = "checked"<%} %> />
                                        <label for="asiaFood">아시아퓨전</label></li>
                                    <li><input type="checkbox" id="westernFood" name="preferred" value="5"
									<% if(array[5] ==5) {%>checked = "checked" <%} %> />					
                                        <label for="westernFood" >서양음식</label></li>
                                    <li><input type="checkbox" id="familyRst" name="preferred" value="6"
                                    <% if(array[6] ==6) {%>checked = "checked"<%} %> />
                                        <label for="familyRst">패밀리 레스토랑</label></li>
                                    <li><input type="checkbox" id="snackBar" name="preferred" value="7"
                                    <% if(array[7] ==7) {%>checked = "checked" <%} %> />
                                        <label for="snackBar">분식</label></li>
                                    <li><input type="checkbox" id="fastFood" name="preferred" value="8"
                                    <% if(array[8] ==8) {%>checked = "checked"<%} %> />
                                        <label for="fastFood">패스트 푸드</label></li>
                                    <li><input type="checkbox" id="pizza" name="preferred" value="9"
                                    <% if(array[9] ==9) {%>checked = "checked"<%} %> />
                                        <label for="pizza">피자</label></li>
                                    <li><input type="checkbox" id="chicken" name="preferred" value="10"
                                    <% if(array[10] ==10) {%>checked = "checked"<%} %> />
                                        <label for="chicken">치킨</label></li>
                                    <li><input type="checkbox" id="pub" name="preferred" value="11"
                                    <% if(array[11] ==11) {%>checked = "checked"<%} %> />
                                        <label for="pub">주점</label></li>
                                    <li><input type="checkbox" id="etc" name="preferred" value="12"
                                    <% if(array[12] ==12) {%>checked = "checked"<%} %> />
                                        <label for="etc">기타</label></li>
                                        
                                </ul>
                                </td>
                                </tr>
                                <tr>
                                    <td class="td">
                                        <h2 class="info">Play Town</h2>
                                    </td>
                                    <td  class="rightTd">
                                        <ul>
                                    <li><input type="checkbox" id="nightView" name="preferred" value="13"
									<% if(array[13] ==13) {%>checked = "checked"<%} %> />
                                        <label for="nightView">야경</label></li>
                                    <li><input type="checkbox" id="shopping" name="preferred" value="14"
                                    <% if(array[14] ==14) {%>checked = "checked"<%} %> />
                                        <label for="shopping">쇼핑</label></li>
                                    <li><input type="checkbox" id="festival" name="preferred" value="15"
                                    <% if(array[15] ==15) {%>checked = "checked"<%} %> />
                                        <label for="festival">축제</label></li>
                                    <li><input type="checkbox" id="museum" name="preferred" value="16"
                                    <% if(array[16] ==16) {%>checked = "checked"<%} %> />
                                        <label for="museum">미술관 박물관</label></li>
                                    <li><input type="checkbox" id="ammPark" name="preferred" value="17"
                                    <% if(array[17] ==17) {%>checked = "checked"<%} %> />
                                        <label for="ammPark">놀이공원</label></li>
                                    <li><input type="checkbox" id="themaCafe" name="preferred" value="18"
                                    <% if(array[18] ==18) {%>checked = "checked"<%} %> />
                                        <label for="themaCafe">테마카페</label></li>
                                    <li><input type="checkbox" id="park" name="preferred" value="19"
                                    <% if(array[19] ==19) {%>checked = "checked"<%} %> />
                                        <label for="park">산책로(공원)</label></li>
                                    <li><input type="checkbox" id="theater" name="preferred" value="20"
                                    <% if(array[20] ==20) {%>checked = "checked"<%} %> />
                                        <label for="theater">극장</label></li>
                                    <li><input type="checkbox" id="leisure" name="preferred" value="21"
                                    <% if(array[21] ==21) {%>checked = "checked"<%} %> />
                                        <label for="leisure">레저</label></li>
                                    <li><input type="checkbox" id="sauna" name="preferred" value="22"
                                    <% if(array[22] ==22) {%>checked = "checked"<%} %> />
                                        <label for="sauna">찜질방</label></li>
                                    <li><input type="checkbox" id="arcade" name="preferred" value="23"
                                    <% if(array[23] ==23) {%>checked = "checked"<%} %> />
                                        <label for="arcade">오락</label></li>
                                    <li><input type="checkbox" id="sports" name="preferred" value="24"
                                    <% if(array[24] ==24) {%>checked = "checked"<%} %> />
                                        <label for="sports">스포츠</label></li>
                                    <li><input type="checkbox" id="traditionalMarket" name="preferred" value="25"
                                    <% if(array[25] ==25) {%>checked = "checked"<%} %> />
                                        <label for="traditionalMarket">재래시장</label></li>
                                </ul>
                                    </td>
                                </tr>
                    </table><!-- //preferred -->
                    <table id="addInfo">
                        <div class="addInfoSpan">
                            <span>추가 정보</span>
                        </div>
                        <br>
                        <tr class="addInfo tr">
                            <td class="td">
                            <h2>성별</h2>
                            </td>
                            <td class="rightTd">
                            <input type="radio"
                                   id="genderF"
                                   name="gender"
                                   <%if(user.getGender()=='F'){%> checked="checked"<%} %>
                                   disabled
                                   value="F"
                                   class="addInfoInput input"/>
                            <label for="genderF" class="addInfoInput">여자</label>
                            
                            <input type="radio"
                                   id="genderM" 
                                   name="gender"
                                   disabled
                                   <%if(user.getGender()=='M'){%> checked="checked"<%} %>
                                   value="M"
                                   class="addInfoInput input"/>
                            <label for="genderM" class="addInfoInput">남자</label>
                            
                            </td>
                        </tr>
                        <tr class="addInfo tr">
                            <td class="td">
                            <h2>생년월일</h2>
                            </td>
                            <td  class="rightTd">
                            <select name="year" id="year" class="infoInput addInfoInput">
                            <option>선택</option>
                                <%for(int i = nowYear ; i>1900 ; i-- ){ %>
								<option <%if(i == user.getYear()){%>selected<%}%>><%=i %></option>
						<%} %>
                            </select><em>년</em>
                            <select name="month" id="month" class="infoInput addInfoInput"><br>
                             <option>선택</option>
                                	<%for(int i = 1 ; i<13 ; i++ ){ %>
									<option <%if(i == user.getMonth()){%>selected<%}%>><%=i %></option>
						<%} %>
                            </select><em>월</em>
                            <select name="date" id="date" class="infoInput addInfoInput"><br>
                             <option>선택</option>
                          		<% for(int i = 1 ; i<=user.getEndDay() ; i++ ){ %>
						<option <%if(i==user.getDate()){%>selected<%}%>><%=i %></option>
						<%} %>
                            </select><em>일</em>
                            </td>
                        </tr>

                        <tr class="addInfo tr" >
                            <td class="td">
                            <h2 for="job">직업</h2>
                            </td>
                            <td  class="rightTd">
                            <select id="job" class="infoInput addInfoInput"><br>
                                <option name="job" value="student"  <% if(user.getJob().equals("student")){ %>selected<%} %>>학생</option><br>
                                <option name="job" value="worker"<% if(user.getJob().equals("worker")){ %>selected<%} %>>직장인</option><br>
                                <option name="job" value="selfEmt"<% if(user.getJob().equals("selfEmt")){ %>selected<%} %>>자영업</option><br>
                                <option name="job" value="hwife"<% if(user.getJob().equals("hwife")){ %>selected<%} %>>주부</option><br>
                                <option name="job" value="jobless"<% if(user.getJob().equals("jobless")){ %>selected<%} %>>무직</option><br>
                                <option name="job" value="etc"<% if(user.getJob().equals("etc")){ %>selected<%} %>>기타</option><br>
                            </select>
                            </td>
                        </tr>

                        <tr class="addInfo">
                            <td class="td">
                            <h2>제 2의 활동지</h2>
                            </td>
                            <td class="rightTd">
                            <input type="text" id="sample6_postcode11" class="infoInput add"
                               placeholder="우편번호" <%if(user.getSecZipcode()!=0) {%>value="<%=user.getSecZipcode()%>"<%} %> 
                               name="secZipCode"/>
                        	<input type="button" class="add addBtn btn" onclick="sample6_execDaumPostcode2()" value="우편번호 찾기"><br>
                      		<input type="text" id="sample6_address11" class="infoInput addsize"
                               placeholder="주소" <%if(user.getSecAdd()!=null) {%>value="<%=user.getSecAdd() %>"<%} %> 
                               name="secAdd"/>
                        	<input type="text" id="sample6_address11" class="infoInput addsize"
                               placeholder="상세주소" <%if(user.getSecdetailAdd()!=null) {%>value="<%=user.getSecdetailAdd() %>"<%} %>
                               name="secDetailAdd"/>
                            </td>
                        </tr>
                    </table><!-- //addInfo -->
                    <div id="updateBtn">
                        <button class="updateBtn btn" form="form">수정완료</button>
                    </div><!-- //updateBtn -->
                </fieldset>
            </form>
        </div><!-- //wrap -->
    </div><!-- #contents end -->
    
<%@ include file="/WEB-INF/template/footer.jsp"%>

<script src="js/jquery.js"></script>
<script src="js/content_btn_class.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

function sample6_execDaumPostcode1() {
    new daum.Postcode({
        oncomplete: function(data) {
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}


function sample6_execDaumPostcode2() {
    new daum.Postcode({
        oncomplete: function(data) {
        	
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode11').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address11').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address11').focus();
        }
    }).open();
}

	
	$(".addBtn").click(function() {
		new daum.Postcode({
		    oncomplete: function(data) {
		        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		    }
			}).open();

	});

    var $myPageIcon= $("#myPageIcon li");

    var id ;

    $myPageIcon.mouseenter(function () {
        var $img = $(this).find("img");

        test3($img);
    });

    $myPageIcon.mouseleave(function () {
        var $img = $(this).find("img");

        test2($img);
    });

    $myPageIcon.click(function () {
        var $img = $(this).find("img");

        test1($img);
    });

    function test1($img){
        id = $img.attr("id");

        $img.attr("src","img/"+id+"_gray.svg");
    }
    function test2($img){
        id = $img.attr("id");

        $img.attr("src","img/"+id+"_black.svg");
    }
    function test3($img){

        id = $img.attr("id");

        $img.attr("src","img/"+id+".png");
    }


    var $year = $("#year");
    var $month = $("#month");
    var $date = $("#date");

    //이벤트 리스너 
    //(보이는 게 아님, 추상적, .change메서드를 통해서 year와 month를 붙여준다. 이름만 알려준다.) 
    //이벤트 타겟에 change이벤트리스너를 붙입니다.
    //그리고 리스너에게 이벤트핸들러이름을 알려줘요.
    $year.change(changeDate); 
    $month.change(changeDate);

    //최초에 작동
    changeDate(); //맨처음에 만들어줌

    //함수(이벤트 핸들러)를 만들어요
    function changeDate(){
    	
    	var year = $year.val();
    	var month = $month.val();
    	
    	//moment함수 호출 
    	var arr = [year,month-1];
    	var date = moment(arr);
    	// 똑같음 var date = moment([year,month-1]);
    	
    	
    	var endDate = date.endOf("month");
    	
    	var lastDay = endDate.date();
    	
    	$date.empty();//자손요소를 전부 비우는 메서드
    	
    	for(var i = 1 ; i <= lastDay ; i++) {
    		
    		var $option = $("<option>").text(i); //text가 열고닫아줌
    		
    		//$date.append($option); 출력은 똑같음
    		$option.appendTo($date);// 더좋음
    		
    		//$("<option>").text(i).appendTo($date); 이렇게 한줄도됩니다
    	}//for end
    	
    }//changeDate() end	
    
    		var regExp = /^image\/[\w]*/;
    		var uploadForm = $("#uploadForm").get(0);
    		var $representation = $("#representation");
    		var representation = $representation.get(0);
    		
    		$representation.change(function() {
    			
    			if(regExp.test(representation.files[0].type)) {
    				
    				console.log(representation);
    				
    				var formData = new FormData(uploadForm);
    				
    				//console.log(formData.get("profile"));
    				 
    				
    				$.ajax("../ajax/upload.jsp",{
    					data: formData,
    					processData: false,
    					contentType: false,
    					type: 'POST',
    					success: function(data){ 
    						var fileName = data.fileName;
    						var div = $("<div id='representationBox'>");
    						$("#representationImg").attr("src","/profile/"+fileName);
    						
    						$(".representation").val(fileName);
    						
    					},
    					error:function(xhr) {
    						alert(xhr.responseText);
    					}
    				})
    			}
    		});

    		//input요소
    		var $nickname = $("#nickname");
    			
    		//메세지 출력될 span요소
    		var $msg = $(".msg");
    		
    		//정규표현식(첫글자 영어, 두번째부터는 영어 혹은 숫자)
    		var reg = /^[a-z|A-Z][\w]{3,9}$/;
    		
    		$nickname.keyup(function() {
    			
    			var nickname=$nickname.val();
    			
    			if(reg.test(nickname)) {
    				
    				$.ajax("ajax/nicknameCheck.jsp",{
    					dataType:"json",
    					 dataType:"json", type:"post", data:{"nickname":nickname}, error:function(xhr,error) {alert("점검중입니다.")},
    		               success:function(json){
    		                  if(!(json.result)){
    		                     $(".msg_box").show();
    		                  }else {
    		                	  $(".msg_box").hide(); 
    		                  }
    		               }
   					 });
    				
    			}else {
    				$msg.removeClass("ok")
    				    .text("다시 입력해주세요.");
    			}//if~else end
    			
    		});
    		
</script>
</body>
</html>
