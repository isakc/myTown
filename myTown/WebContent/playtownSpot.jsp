<%@page import="com.sc.mytown.vo.LikeVo"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.sc.mytown.dao.LikesDAO"%>
<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.RepliesDAO"%>
<%@page import="com.sc.mytown.vo.ReplyVo"%>
<%@page import="com.sc.mytown.vo.StampVo"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="com.sc.mytown.dao.StampsDAO"%>
<%@page import="com.sc.mytown.dao.GradesDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.PicturesDAO"%>
<%@page import="com.sc.mytown.vo.PictureVo"%>
<%@page import="com.sc.mytown.dao.AddressDAO"%>
<%@page import="com.sc.mytown.vo.AddressVo"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
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
	
	int total = UsersDAO.selectTotal();

	
	//spot no 받아와서 저장
	String noStr = request.getParameter("no");	
	int no = Integer.parseInt(noStr);
	
	SpotVo spot = SpotsDAO.selectSpot(no);
	
	//spot 파운더 정보
	int founderNo = spot.getFounderNo();
	UserVo user = UsersDAO.selectUserOne(founderNo);
	
	//spot 구, 동 정보
	int spotGu = spot.getGuNo();
	int spotDong = spot.getDongNo();
	
	AddressVo gu = AddressDAO.selectAddressOne(spotGu);
	AddressVo dong = AddressDAO.selectAddressOne(spotDong);
	
	//같은 구,동의 play타운 리스트 (추천리스트)
	SpotVo nearPlaySpot = new SpotVo(4,spotGu,spotDong);
	List<SpotVo> nearPlaySpots = SpotsDAO.selectNearSpot(nearPlaySpot);
	//같은 구,동의 food타운 리스트 (추천리스트)
	SpotVo nearFoodSpot = new SpotVo(3,spotGu,spotDong);
	List<SpotVo> nearFoodSpots = SpotsDAO.selectNearSpot(nearFoodSpot);
	
	//spot 사진들 받아오기
	List<PictureVo> pictures = PicturesDAO.selectPictures(no);
	
	//평점
	int grade = GradesDAO.selectGrade(no);
	int gradeCount = GradesDAO.selectGradeCount(no); //인원
	
	//스탬프
	int stampCount = StampsDAO.selectStampCount(no); //인원
	
	//해시태그
	List<HashTagVo> hashtags = HashTagsDAO.selectHashtags(no);
	
	//stamp 여부
	//int userNo = ((UserVo)session.getAttribute("loginTowner")).getNo();
	int userNo = 51;
	int contentNo = spot.getNo();
	StampVo stampVo = new StampVo(contentNo,userNo);
	int stamp = StampsDAO.selectStamp(stampVo);
	
	//댓글 페이징 처리
	PageVo pageVo = new PageVo(now, numPage,no);
	String paging = PaginateUtil.paginate(now, total, numPage, numBlock, "1playtownSpot.jsp","no="+ no +"&now=");
	//댓글 받아오기
	List<ReplyVo> replies = RepliesDAO.selectReplyPage(pageVo);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Play Town Spot</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/template.css"/>
<link rel="stylesheet" href="css/townSpot.css"/>
<link rel="stylesheet" href="css/reply.css"/>
<link rel="stylesheet" href="css/recommendListSoo.css"/>
<style>
	 /*여기서부터 내꺼*/
	 body {
	 	font-family: "Noto Sans KR", sans-serif;
	 }

	/*한줄설명, 정보, 해시태그, 메뉴 시작*/
     #bottom {
    		width:1080px;
     		min-height:340px;
     		margin-bottom:20px;
     		position: relative;
     		top:-10px;
     }
     
     #info{
    		width:1080px;
     		min-height:170px;
     		margin-bottom:20px;
     }
      #hashtag{
      		width:1080px;
     		min-height:170px;
     		padding-bottom:20px;
      }
     #info>#spotLineInfo, #hashtagTitle{
     		font-size:20px;
     		font-weight:bold;
     		margin-bottom:5px;
     		text-align:center;
     }
     #spotLine {
     		min-height:20px;	
     		font-size:22px;
     		text-align:center;
     		margin:10px 0;
     }
     #spotBasicInfo{
     		width:669px;
     		height:94px;
     		padding:8px;
     		background:#c6e5d9;
     		float:left;
     }
     
     /*가격정보 입력 박스*/
     #priceInfo {
     		width:365px;
     		height:90px;
     		padding:10px;
     		background:#c6e5d9;
     		float:left;
     		margin-left:10px;
     		position:relative;
     }
     #priceInfo>span {
     		font-size:16px;
     		font-weight:bold;
     		color: #3b8686;
     		border-bottom:1px solid #fff;
     }
     #priceInfo>span:hover{
     		color:#E53A40;
     		cursor:pointer;
     }
     .priceInfoAdd {
     		font-size:15px;
     		margin-right:16px;
     }
     .priceOff {
     		display:none;
     }
     .priceInfoAdd>input {
     		width:200px;
     		height:16px;
     		margin-left:10px;
     }
     .name {
     		margin-top:20px;
     }
     .price {
     		margin-top:5px;
     }
     
     #button {
     		color:#3b8686;
     		font-size:50px;
     		position:absolute;
     		right:20px;
     		bottom:15px;
     		cursor:pointer;
     	
     }
     #button:hover{
     		color:#1f4e5f;
 	 }
 	 
     .spotBasic>span {
     		position:absolute;
     		left:200px;
     }
    /*가격정보 입력 박스 끝*/
    
    
      /*리뷰 페이지*/
     #reviewPage {
     		text-align:center;
     		font-size:25px;
     }
     
     /*리뷰 끝*/
     
     /*해시태그 클라우드*/
      #tagCloud ul{
            height: 80px;
     }

     #tagCloud li{
         margin: 5px;
         display: inline-block;
     }

     #tagCloud li>a:hover{
         color:#bd1550;
     }

     #tagCloud a{
         text-decoration: none;
         color: #000;
         vertical-align: middle;
     }

     .c1{
         font-size: 15px;
         font-weight: 100;
     }
     .c2{
         font-size: 18px;
         font-weight: 300;
     }
     .c3{
         font-size:  21px;
         font-weight: 500;
     }
     .c4{
         font-size: 26px;
         font-weight: 700;
     }
     .c5{
         font-size: 31px;
         font-weight: 900;
     }
     	/*리뷰 제목*/
        #doReply {
			width: 1080px;
			height:30px;
			ling-height:30px;
			font-size:20px;
			font-weight:900;
			text-align:center;
			margin-top:20px;
		}
	/*별점 남기기~~~
		.rating>.rating_btn>button{
		    width:28px;
		    height:28px;
		    float: left;
		    cursor:pointer;
		    background: transparent;
		    border:none;
		    outline:none;
		}
		.rating>.before_rating{
		    width:140px;
		    height:28px;
		    background-image:url("img/starOff.png");
		    background-repeat:no-repeat;
		}
		.rating>.after_rating{
		    width:0px;
		    height:28px;
		    background-image:url("img/starOn.png");
		    background-repeat:no-repeat;
		} */
		
		paginate{
		   width: 100%;
		   color: #8080ff;
		   text-align: center;
		}
		
		.paginate a, .paginate span, .paginate strong {
		
		   font-size: 16px;
		   padding: 10px 16px;
		   text-decoration:none;
		   display: inline-block;
		   color: #8080ff;
		}
		/*현재 페이지*/
		.paginate strong{
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
		.paginate a:hover{
		   background: #ccccff;
		}
		
		.btn_box{
		    
		    text-align: right;
		   
		}
		
	
		//이미지 없으면 이미지박스 hide
		.displayNone {
			display:none;
		}
		.None {
			display:none;
		}
		.direction.displayNone2{
			display:none;
		}
		
</style>
</head>

<body>
<%@ include file="/WEB-INF/template/header.jsp"%>
<form id="uploadForm" method="post" enctype="multipart/form-data"></form>
<input type="hidden" name="representation" class="representation">
<div id="wrap">

		<div id="top"><!-- top 시작 -->
		<img id="category" src="img/playTown.png" alt="1차카테고리"/>
		
		<div id="topInfo">
		<div id="spotAddress"><span><%=gu.getName() %></span> <span><%=dong.getName() %></span></div>
		<h2><%=spot.getName() %></h2>
		
		<div id="gradeIn"><!-- 평점(참여) -->
		<span>평점</span><i class="fa fa-star"></i> <span><%=(double)grade/2 %></span>
		<span id="color"><%=gradeCount %>명</span>
		</div>
		
		<div id="stampIn"><!-- 스탬프(참여) -->
		<i class="fa fa-check-circle"></i> 
		<span id="color"><%=stampCount %>명</span></div>
		</div><!--topInfo -->
		
		<div id="topUser">
		<div id="stamp" class=<%if(stamp==1){%> "<%="stampOn"%>" <%} %>><!-- 스탬프 찍기 -->
		<i class="fa fa-check-circle-o"></i>
		<i class="fa fa-check-circle"></i>
		 stamp</div>
		 
		<div id="grade"><!-- 평점 남기기 -->
           	<div class="rating before_rating"></div>
            <div class="rating after_rating"></div>
        </div>
		</div><!-- topUser end -->
		
		<!-- 파운더 정보 -->
		<div id="topFounder">
		<img id="founderP" src="img/<%=user.getProfile() %>" alt="파운더사진"/>
		<div id="founderN"><%=user.getNickname() %></div>
		</div><!-- topFounder end -->
		
	</div><!-- top 끝 -->
	
	<hr/> 
	
		
	
	<!-- middle 시작 -->
	<div id="middle">
		<button class="photoArrow a1"><i class="fa fa-caret-left"></i></button>
		<div id="box">
			<div id="imgs">
				<% for(PictureVo pic : pictures){%>
				<img class="photo" src="img/<%=pic.getPicture() %>" alt="스팟사진1">
				<%} %>
			</div>
		</div>
		<button class="photoArrow a2"><i class="fa fa-caret-right"></i></button>
		<div id="map"></div>
	</div>
	<!-- middle 끝 -->
	
	<!-- bottom 시작 -->
	<div id="bottom">
		<div id="info">
			<h3 id="spotLineInfo">'<%=spot.getName() %>' 한줄 설명</h3>
			<div id="spotLine"><%=spot.getDescription() %></div>
			<hr/>
			<% int price = spot.getArgPrice();
			   String priceStr = Integer.toString(price);
				if(price == 0) {
					priceStr = "무료";
				}
				
			   String wifiPossible = spot.getWifi();
			   String wifi ;
			   if(wifiPossible == "t"){
				   wifi = "사용가능";
			   }else if(wifiPossible =="f"){
				   wifi = "사용 불가능";
			   }else {
				   wifi = "정보 없음";
			   }
			   
			   String parkingPossible = spot.getParking();
			   String parking ;
			   if(parkingPossible == "t"){
				   parking = "가능";
			   }else if(parkingPossible =="f"){
				   parking = "불가능";
			   }else {
				   parking = "정보 없음";
			   }
			   
			   String site = spot.getSite();
			   if(site==null){
				   site = "정보 없음";
			   }
			%>
			<div id="spotBasicInfo">
			<div class="spotBasic">전화번호:<span><%=spot.getTell() %></span></div>
			<div class="spotBasic">영업시간:<span><%=spot.getOpenTime() %></span></div>
			<div class="spotBasic">사이트:<span><%=site %></span></div>
			<div class="spotBasic">와이파이:<span><%=wifi %></span></div>
			<div class="spotBasic">주차:<span><%=parking %></span></div>
			<div class="spotBasic">가격정보:<span class="avg_price"><%=priceStr %></span></div>
			</div>
			
			<div id="priceInfo">
			<span><i class="fa fa-plus-square-o"></i> '<%=spot.getName() %>'가격을 수정하고 싶나요? </span>
				<div id="priceInfoBox" class="priceOff">
				<div class="priceInfoAdd name">분류 <input placeholder="가격 정보" disabled/></div><!-- 카테고리 -->
				<div class="priceInfoAdd price">정보 <input class="priceUpdate" data-class="priceUpdateBox"  placeholder="숫자만 입력"/></div><!-- 가격정보 -->
				<div id="button"><i class="fa fa-check-square"></i></div>
				</div>
			</div>
		</div>
		
		<div id="hashtag">
		<h3 id="hashtagTitle">'<%=spot.getName() %>' 관련 해시태그</h3>
			<div id="tagCloud">
                        <ul>
                        	<li class="c5 cate2"><a href=""><%=hashtags.get(0).getTag() %></a></li>
                        	<%for(int i=1; i<hashtags.size();i++ ){
                        	  	int random = (int)(Math.random()*5)+1; %>
                            <li class="c<%=random%>"><a href=""><%=hashtags.get(i).getTag() %></a></li>
                            <%} %>
                        </ul>
                    </div><!-- tagCloud -->
		</div>	
	</div><!-- bottom end -->
	<hr/>
	<!-- bottom 끝 -->
	
	
	
	<!-- 리뷰 시작 -->
	<h2 id="doReply">리뷰를 입력해 주세요!</h2>
	<div id="reply">
	<!-- 나의 리뷰 -->
                <div id="myReply">
                    <div id="myPhoto"><img src="img/유정이.jpg" alt="" width="80" height="80" /></div>
                    <div class="my_content">
                    
                    	<div id="tagBox">
						    <h3># 해시태그</h3>
						    
						    <div id="tagList">
						    <div  id="tagInput"  contenteditable="true"># 태그입력</div>
						    </div>
						    
						</div><!-- tagBox end -->
                    	
						<textarea class="content"></textarea>
                    </div>
                    <div class="my_img_box">
                        <button class="arrow left None">&lt;</button>
                        <div class="imgs">
                            <ul>
                                <li>
                                	<label  class="button camera">
	                                <input form="uploadForm" type="file" name="file" id="representation" accept="image/*" title="사진 선택" hidden/>
	                                <i class="fa fa-camera" aria-hidden="true"></i>
	                                <img id="representationImg" src="" width="98" height="98">
	                                </label>
                                </li>
                            </ul>
                        </div>
                        <button class="arrow right None">&gt;</button>
                    </div>
                    <button class="btn insert">등록</button>
                </div><!-- myReply -->


				<!-- 너의 리뷰 -->
				
				<div id="yourReply">
				<ul>
				<% for(ReplyVo rep : replies) {
					//댓글 좋아요 수 받아오기
					
					UserVo replyUser = UsersDAO.selectUserOne(rep.getUserNo()); //그 댓글의 유저(글쓴이)번호
					int likeCount = LikesDAO.selectReviewLike(rep.getNo()); //그 댓글의 번호
					int replyWriter = replyUser.getNo();
					//댓글의 해시태그 받아오기
					AddHashTagVo reAddhashtags = new AddHashTagVo(no,rep.getNo()); //그 댓글의 번호
					List<HashTagVo> reHashtags = HashTagsDAO.selectReviewHashtags(reAddhashtags);
					
					LikeVo likeVo = new LikeVo(userNo,rep.getNo());
					int r_review = LikesDAO.selectLike(likeVo);
				%>					
					<li>
					<div class="reply_header"><!-- 글쓴이 날짜 좋아요 -->
						<div id="yourPhoto">
						<img src="img/<%=replyUser.getProfile() %>" alt=""/></div>
							<div id="nameNdate">
							<div class="regdate"><%=rep.getRegDate() %></div>
							<div class="yourName"><%=replyUser.getNickname() %></div>
							<div class="yourHashtag">
							<%for(HashTagVo reTags : reHashtags){ %>
							<span>#<%=reTags.getTag() %></span>
							<%} %></div>
							</div>
						<div class="like">
						<button class="r_icon" data-no="<%= rep.getNo()%>"  data-like="<%=likeCount%>"><i class="fa fa-thumbs-o-up 
						<% if(r_review==1){ //이미 추천한 글엔 reLike%> <%="reLike"%> <%} %>"></i></button>
						<div class="r_num"><span class="avg_like <% if(r_review==1){ //이미 추천한 글엔 reLike%> <%="reLike"%> <%} %>"><%=likeCount %></span></div>
						</div><!-- like end -->
					</div><!-- reply_header end -->
				
					<div class="your_content"><!-- 댓글 내용 -->
					    <%=rep.getContents() %>
					</div>     
					<%
						//그 리뷰의 사진들 받아오기
		            	PictureVo replyPicture = new PictureVo(no,rep.getNo());
		            	List<PictureVo> replyPictures = PicturesDAO.selectReplyPictures(replyPicture);
		            	if(!replyPictures.isEmpty()){ //댓글의 사진이 없으면 사진박스 display:none;
				    %>
				    <div class="your_img_box <%="displayNone"%>"><!-- 사진 --> 
				     
				    	<% if(replyPictures.size()<=8){ //이부분뭥미????***%>
				        <div class="imgs">
				            <ul>
				            	<% for(PictureVo pic: replyPictures){ %>
				                <li><img src="img/<%=pic.getPicture()%>" alt= "댓글사진"/></li>
				                <%} %>
				            </ul>
				        </div>
				        <%}else{ %>
				        <button class="arrow left">&lt;</button>
				        <div class="imgs">
				            <ul>
				            	<% for(PictureVo pic: replyPictures){ %>
				                <li><img src="img/<%=pic.getPicture()%>" alt= "댓글사진"/></li>
				                <%} %>
				            </ul>
				        </div>
				        <button class="arrow right">&gt;</button>
				        <%} %>
				        
				    </div><!-- your_img_box end -->
					<%}%>
					
					<div class="btn_box user_check"><!-- 버튼 -->
						<button class="btn update <%if(userNo!=replyWriter){%><%="None"%><%}%>">수정</button>
						<button class="btn delete <%if(userNo!=replyWriter){%><%="None"%><%}%>">삭제</button>
					</div>
					
   			</li>
   			<%} %>
   	</ul>
   	</div><!-- yourReply -->
	<div id="reviewPage">
		<%=paging %>
	</div>
	<hr/>
   	</div><!-- #reply -->
    <!-- 리뷰 끝 -->
	
	<!-- 추천 리스트 시작 -->
	 <div id = "rSpotBox">
            <h2 class="screen_out">바텀메뉴</h2>
            
            <div id="playTown">
                <h3 class="setLabel">PLAY TOWN</h3>
                <div class ="spotList" >
                    <ul class= "posts">
						<%for(SpotVo nearPlay : nearPlaySpots){ %>                    
                        <li>
                            <div class="post">
                                <div class="playPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title=""><%=nearPlay.getName() %></a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#너무좋아요</li>
                                                <li>#또갈래~~</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/<%=nearPlay.getRepPicture()%>"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>
						<%} %>
                    </ul> <!-- posts -->
                </div><!-- playTownList -->
                
                <i class="fa fa-caret-left leftBtn direction <%if(nearPlaySpots.size()<=3){ %><%="displayNone2"%><%} %>" ></i>
                <i class="fa fa-caret-right rightBtn direction <%if(nearPlaySpots.size()<=3){ %><%="displayNone2"%><%} %>" ></i>
            </div><!-- playTown -->
			
			<div id="foodTown">
                <h3 class="setLabel">FOOD TOWN</h3>
                    <div class ="spotList">
                    <ul class= "posts">
                    	<%if(nearFoodSpots.size()==0){%>
                     	<li>주변 FOOD TOWN이 없습니다</li>
                    	<%}else{
                    	for(SpotVo nearFood : nearFoodSpots){ %>
                        <li>
                        <div class="post">
                            <div class="foodPostTop postTop">
                                 <div class="grade">
                                     <i class="fa fa-star"></i>
                                     <p><em>4.9</em></p>
                                 </div><!-- grade -->

                                 <div class="text">
                                     <h4><a href="" title=""><%=nearFood.getName() %></a>
                                         <i class="fa fa-bookmark-o bookmark"></i></h4>
                                     <div class="spotHashTag">
                                         <ul>
                                             <li>#hahah</li>
                                             <li>#너무매워~~~</li>
                                         </ul>
                                     </div><!--spotHashTag -->
                                 </div><!-- text -->

                                 <div class="postProfile">
                                         <img class="postImg profileImg" src="img/kim.jpg"/>
                                         <img class="postImg jumin" src="img/주민.jpg"/>
                                 </div><!-- profile -->
                            </div><!--postTop-->
                            <div class="imageBox">
                                <img src="img/<%=nearFood.getRepPicture()%>"/>
                            </div><!--imageBox-->
                        </div><!-- post -->
                        </li>
						<%} }%>
                    </ul> <!-- posts -->
                </div><!-- foodTownList -->
                <i class="fa fa-caret-left leftBtn direction <%if(nearFoodSpots.size()<=3){ %><%="displayNone2"%><%} %>" ></i>
                <i class="fa fa-caret-right rightBtn direction <%if(nearFoodSpots.size()<=3){ %><%="displayNone2"%><%} %>" ></i>
            </div><!-- foodTown -->
        </div> <!--rSpotBox 추천 리스트 끝-->

	
        
</div><!-- Wrap end -->


<%@ include file="/WEB-INF/template/footer.jsp" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ff0b5d47787f5de0113d9930f6e326b3"></script>
<script src="js/jquery.js"></script>
<script>
//지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(<%=spot.getLat()%>,<%=spot.getLng()%>), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);

var regExp = /^image\/[\w]*/;
var uploadForm = $("#uploadForm").get(0);
var $representation = $("#representation");
var representation = $representation.get(0);
var imgs = '';


//스탬프
$("#stamp").click(function(){	
	$.ajax("ajax/stamp.jsp",{
		type:'post',
		dataType:"json",
		error:function(){
			alert("에러")
		},
		data:{contentNo:<%=no%>},
		success:function(json) {
			if(json.result){
				$("#stamp").addClass("stampOn");
			}else {
				$("#stamp").removeClass("stampOn");
			}
		}
	})
});

//가격입력창보여줘
$("#priceInfo span").click(function () {
			$("#priceInfoBox").toggleClass("priceOff");
});

//가격입력
$("#button").click(function () {
			//$("#priceInfoBox").addClass("priceOff");
		var price = $(".priceUpdate").val().trim();
		
		var reg = /^[0-9]*$/;
		
		if(reg.test(price)) {
			
			
			$.ajax("ajax/playPriceInfo.jsp",{
				type:'post',
				dataType:"json",
				error:function(){
					alert("에러");
				},
				data:{contentNo:<%=no%>, argPrice:price},
				success:function(json) {
					if(json.result){
						$("#priceInfoBox").addClass("priceOff");
						
						if(price == 0) {
							price = "무료";
						}
						
						$(".avg_price").text(price);
					}
				}
			})
			
		}else {
			alert("숫자만 입력해주세요.");
			$(".priceUpdate").val("").focus();
		}
	
});


var imgX = 0;

var $photoArrow = $(".photoArrow");

$photoArrow.click(function () {
    var $this = $(this);
    var $imgs = $this.parent().find("#box").find("#imgs");
    
    $photoArrow.show();	
    if($this.hasClass("a1")) {
    	if(imgX==0){
    		$(this).hide();
    	}else{
        imgX = imgX + 250;}
    }else {
       imgX = imgX - 250;
    }
    $imgs.css("left",imgX);
    var num = $imgs.find("img").length;
    
    if(imgX == (num-num) * +250 || imgX == (num-3) * +250) {
    $this.hide();
    }
    if(imgX == (num-3)* -250){
    	$(".a2").hide();
    }
});

//리뷰
		var reviewImgX = 0;
      
        var $myArrow = $(".my_img_box .arrow");
        var myImgX = 0;

        $myArrow.click(function () {
            var $this = $(this);
            $this.parent().find(".arrow").show();
            if($this.hasClass("left")) {
            	if(reviewImgX==0){
            		$(this).hide();
            	}else{
                myImgX = myImgX + 100;}
            }else {
                myImgX = myImgX - 100;
            }
            reviewImgX = myImgX*10;
            reviewImgX = Math.ceil(reviewImgX.toFixed(1))/10;
            var num = $this.parent().find(".imgs").find("ul").find("li").length;
            $this.parent().find(".imgs").find("ul").css("left",reviewImgX);
            if(reviewImgX == 0 || reviewImgX == (num-8) * +100) {
                $this.hide();
            }
            if(reviewImgX == (num-8)* -100){
            	$(".right").hide();
            }
        });

        var $yourArrow = $(".your_img_box .arrow");
        var yourImgX = 0;
        
        $yourArrow.click(function () {
            var $this = $(this);
            $this.parent().find(".arrow").show();
            if($this.hasClass("left")) {
            	if(reviewImgX==0){
            		$(this).hide();
            	}else{
                yourImgX = yourImgX + 120;}
            }else {
                yourImgX = yourImgX - 120;
            }
            reviewImgX = yourImgX*10;
            reviewImgX = Math.ceil(reviewImgX.toFixed(1))/10;
            var num = $this.parent().find(".imgs").find("ul").find("li").length;
            $this.parent().find(".imgs").find("ul").css("left",reviewImgX);
            if(reviewImgX == 0 || reviewImgX == (num-8) * +120) {
                $this.hide();
            }
            if(reviewImgX == (num-8)* -120){
            	$(".right").hide();
            }
        });

//유저번호(로그인한 유저의 번호), 댓글내용  reply테이블에 넣기 / 컨텐츠 번호(no),타입 (1) 필요
//등록 클릭시 "reply 입력 완료" alert창 띄운다..
//입력 input들 삭제..+ 리스트에 입력한 reply 바로 추가해서 보여줌.. ***

    $("#myReply .insert").click(function(){
            var reContent = $("textarea").val(); //내용 얻어옴
            
            var tags = "";
            $(".tag").each(function() {
            	tags+= $(this).attr("data-tag")+",";
            });
            
            $.ajax("ajax/reply.jsp",{
                type:'post',
                dataType:"json",
                error:function(){
                   alert("에러");
                },
                data:{contentNo:<%=no%>,contents:reContent,tags:tags,imgs:imgs},
                success:function(json) {
                   if(json.result){
                      //성공시
                      alert("성공!");
                   }else {
                      //실패시
                 	  alert("실패!");
                   }
                 }
     		}) //ajax end
            
    }); //click end
    
    //추천 올리기 //이떈 타입(5)        
	$(".r_icon").click(function(){
		
		var $this = $(this);
		var repNo = $this.attr("data-no"); //클릭 시, 그 리뷰의 리뷰번호 얻어오기
		var likeCount = Number($this.parents(".like").find(".avg_like").text());
		//alert(repNo);
		//alert(likeCount);
		
		$.ajax("ajax/like.jsp",{
			type:'post',
			dataType:"json",
			error:function(){
				alert("에러");
			},
			data:{contentNo: repNo}, //userNo은 로그인한 사람 typeNo은 5
			success:function(json) {
				//이 부분 해결하기**************** 색깔이랑 숫자 안변해!!!
				
				//alert(json.result);
				if(json.result){
					 $this.children("i").addClass("reLike"); //좋아요 버튼 색깔 바뀌게 + 좋아요 추가
					 $this.parents(".like").find("span").addClass("reLike");
					 $this.parents(".like").find(".avg_like").text(likeCount+1); //좋아요 숫자 갱신
					 
				}else {
					 $this.children("i").removeClass("reLike"); //좋아요 버튼 색깔 원상태로 + 좋아요 해제
					 $this.parents(".like").find("span").removeClass("reLike");
					 $this.parents(".like").find(".avg_like").text(likeCount-1); //좋아요 숫자 갱신
				}

			}
		})
	});

	//해시태그 입력    
	$("#tagInput").keyup(function(e) {

	    
	    if(e.keyCode==13 || e.keyCode==32) {
	       
	       var val = $(this).text();
	       
	       $("<div class=\"tag\" data-tag='"+val+"'>#"+val+"<button class=\"delete\"><i class=\"fa fa-times\"></i></button></div>").prependTo("#tagList");
	       $(this).text("");
	    }
	     
	    return false;
	 });
	 
	 $("#tagInput").focus(function () {
	    $(this).text("");
	 })
	 
	 $("#tagInput").blur(function () {
	    $(this).text("#태그입력");
	 })

	 
	 $("#tagList").on("click",".delete",function () {
	      $(this).parents(".tag").remove();
	      
	  });
	 
	 $("btn_box>.update").click(function(){
		 //댓글 수정
		 
	 })
	 $("btn_box>.delete").click(function(){
		 //댓글 삭제
	 })


		
		$representation.change(function() {
			
			if(regExp.test(representation.files[0].type)) {
				
				console.log(representation);
				
				var formData = new FormData(uploadForm);
				
				//console.log(formData.get("profile"));
				
				var $imgs = $(this).parents(".imgs ul");
				 
				
				$.ajax("../ajax/uploadsm.jsp",{
					data: formData,
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data){ 
						
						var fileName = data.upload;
						
						imgs += fileName+",";
						var $li = $("<li>");
						var $img = $("<img>").attr("src","/img/"+fileName); 
						
						$li.append($img).prependTo($imgs);
						//$(".representation").val(fileName);
						var num = $imgs.find("img").length;
						if(num==8){
							$(".my_img_box>button.left").removeClass("None");
							$(".my_img_box>button.right").removeClass("None");
						}
						
					},
					error:function(xhr) {
						alert(xhr.responseText);
					}
				})
				
			}
		});
</script>

</body>

</html>