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

PageVo pageVo = new PageVo(now, numPage);
String paging = PaginateUtil.paginate(now, total, numPage, numBlock, "1playtownSpot2.jsp", "now=");
	
	
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
	
	//푸드타운, 플레이타운 이미지
	/*int spotType = spot.getTypeNo();
	String typeImg = "";
	if(spotType==3){
		typeImg = "foodTown.png";
	}else if(spotType==4){
		typeImg = "playTown.png";
	}*/
	
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
	
	//댓글 받아오기
	List<ReplyVo> replies = RepliesDAO.selectReplyList(no);
	
	
	
	
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Play Town Spot</title>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/notosanskr.css"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/templates2.css"/>
<link rel="stylesheet" href="css/townSpot.css"/>
<link rel="stylesheet" href="css/reply.css"/>
<link rel="stylesheet" href="css/recommendList.css"/>
<style>
	 /*여기서부터 내꺼*/
	 body {
	 	font-family: "Noto Sans KR", sans-serif;
	 }

	/*한줄설명, 정보, 해시태그, 메뉴 시작*/
     #bottom {
    		width:1080px;
     		height:340px;
     		margin-bottom:20px;
     		position: relative;
     		top:-10px;
     }
     
     #info, #hashtag{
    		width:1080px;
     		height:170px;
     		margin-bottom:10px;
     }
     
     #info>#spotLineInfo, #hashtagTitle{
     		font-size:20px;
     		font-weight:bold;
     		margin-bottom:5px;
     		text-align:center;
     }
     #spotLine {
     		font-size:22px;
     		text-align:center;
     		margin:8px 0;
     }
     #spotBasicInfo{
     		width:669px;
     		height:94px;
     		padding:8px;
     		position:absolute;
     		top:62px;
     		background:#c6e5d9;
     }
     /*가격정보 입력 박스*/
     #priceInfo {
     		width:365px;
     		height:90px;
     		padding:10px;
     		background:#c6e5d9;
     		position:absolute;
     		top:62px;
     		right:0;
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
     		left:300px;
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
    
    
    /*해시태그 박스*/
     #hashtagImg {
     		width:1080px;
     		height:140px;
     }     
     
     
     
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
.fa-check-circle {
	display:none;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/template/header.jsp"%>

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
		<%if(stamp==1){ %>
		<div id="stamp" class="<%="stampOn"%>"><!-- 스탬프 찍기 -->
		<%} %>
		<i class="fa fa-check-circle-o"></i>
		<i class="fa fa-check-circle"></i>
		 stamp</div>
		 
		<div id="grade"><!-- 평점 남기기 -->
				<div class="rating"><img src="img/starOff.png" width=125 height=25/>
            	</div><%--//rating end --%>
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
                    	<div class="myhashtags"><span># 해시태그 </span><input/></div>
						<textarea class="content"></textarea>
                    </div>
                    <div class="my_img_box">
                        <button class="arrow left">&lt;</button>
                        <div class="imgs">
                            <ul>
                                <li><img src="img/1.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/1.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/2.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/2.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                <li><i class="fa fa-camera"></i></li>
                            </ul>
                        </div>
                        <button class="arrow right">&gt;</button>
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
					//댓글의 해시태그 받아오기
					AddHashTagVo reAddhashtags = new AddHashTagVo(no,rep.getNo()); //그 댓글의 번호
					List<HashTagVo> reHashtags = HashTagsDAO.selectReviewHashtags(reAddhashtags);
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
						<button class="r_icon"><i class="fa fa-thumbs-o-up"></i></button>
						<div class="r_num"><%=likeCount %></div>
						</div><!-- like end -->
					</div><!-- reply_header end -->
				
					<div class="your_content"><!-- 댓글 내용 -->
					    <%=rep.getContents() %>
					</div>     
					
				    <div class="your_img_box"><!-- 사진 -->
				        <button class="arrow left">&lt;</button>
				        <div class="imgs">
				            <ul>
				            	<%
				            	//그 리뷰의 사진들 받아오기
				            	PictureVo replyPicture = new PictureVo(no,rep.getNo());
				            	List<PictureVo> replyPictures = PicturesDAO.selectReplyPictures(replyPicture);
				            	System.out.println(replyPictures);
				            	for(PictureVo pic: replyPictures){ %>
				                <li><img src="img/<%=pic.getPicture() %>" alt= "댓글사진"/></li>
				                <%} %>
				            </ul>
				        </div>
				        <button class="arrow right">&gt;</button>
				    </div>
					
					<div class="btn_box user_check"><!-- 버튼 -->
						<button class="btn update">수정</button>
						<button class="btn delete">삭제</button>
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
})

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
        })

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
        })




</script>

</body>

</html>