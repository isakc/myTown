<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>reply 수정</title>
<%@include file="/WEB-INF/template/link.jsp" %>
    <style>
    	body {
    		font-family: 'Noto Sans KR', sans-serif;
    	}
        #reply {
            width: 1080px;
            margin:auto;
        }
        #myReply {
            width:1040px;
            height:160px;
            padding:20px;
            border-radius:30px;
            box-shadow: 0 0 10px #424242;
            position: relative;
            margin: 20px auto 10px;
        }
        #myReply>img {
            box-shadow: 0 0 1px #424242;
            border-radius:35px;
            position:absolute;
            top:20px;
            left:20px;
        }

        #myReply .my_content {
            width: 875px;
            box-shadow: 0 0 10px #424242;
            position:relative;
            margin-left: 90px;
        }
        #myReply .my_content>textarea {
            width:870px;
            min-height:65px;
            font-family: "NotoSansKR",sans-serif;
            font-size: 20px;
        }
    /* my reply top css */

        .my_img_box{
            width: 875px;
            height: 80px;
            position:absolute;
            left:110px;
            bottom:15px;
        }
        .my_img_box .imgs {
            width: 830px;
            height: 80px;
            float: left;
            position: absolute;
            left: 21px;
            overflow: hidden;
        }
        .my_img_box .imgs ul {
            width: 1000%;
            height: 80px;
            position: relative;
            left: 0;
            padding:0 2px;
            transition: .2s ease;
        }
        .my_img_box li {
            width: 80px;
            height: 80px;
            float: left;
            margin: 0 1.5px;
            box-shadow: 0 0 1px #424242;
        }
        .my_img_box img {
            width: 80px;
            height: 80px;
        }
        .my_img_box i {
            background: red;
            width: 80px;
            height: 80px;
            margin: 0 1.5px;
            float: left;
            text-align: center;
            line-height: 80px;
            cursor: pointer;
            box-shadow: 0 0 1px #424242;
        }
        .my_img_box .arrow {
            background: #FFFFFF;
            width: 20px;
            height: 40px;
            border: none;
            position: absolute;
            top: 20px;
            text-align: center;
            line-height: 40px;
            box-shadow: 0 0 5px #424242;
            cursor: pointer;
        }
        .my_img_box .left {
            left: 0;
            float: left;
            border-radius: 5px 0 0 5px;
        }
        .my_img_box .right {
            display: none;
            right: 0;
            float: right;
            border-radius: 0 5px 5px 0;
        }

        #myReply .btn.insert {
            background:#fff;
            width: 60px;
            height: 34px;
            border: none;
            box-shadow: 0 0 5px #424242;
            border-radius: 5px;
            position:absolute;
            right:20px;
            bottom:20px;
            cursor: pointer;
        }
    /* my image box css */
    /*your reply */
	    	
   		#yourReply>ul>li {
            width:1080px;
            position: relative;
            margin:30px 0;
            /*overflow: hidden;*/
        }
        .reply_header {
        	width:1080px;
        	height:100px;
        	border-bottom:1px solid #424242;
        	font-family:'Noto Sans KR', sans-serif;
        }
        #yourPhoto {
        	width:100px;
        	height:100px;
        	float:left;
        }
        #yourPhoto>img {
        	width:80px;
        	height:80px;
        	border-radius:40px;
        	margin:10px;
        }
        #nameNdate{
        	width:780px;
        	height:50px;
        	margin-left:20px;
        	float:left;
        }
        .like{
        	width:100px;
        	height:100px;
        	float:left;
        	margin-left:80px;
        }
        .yourName {
        	font-size:30px;
        	font-weight:900;
        	margin: 20px 0 10px 0 ;
        }
        .regdate {
        	font-size:16px;
        	color:#548687;
        }
        .like .r_icon {
        	width: 100px;
            height: 70px;
            
            border:none;
            cursor:pointer;
            background:#fff;
        }
		.r_icon i {
			font-size:50px;
			color:#3b8686;
			line-height:90px;
            text-align: center;
		}
		.like .r_num {
			width:100px;
			height:30px;
			font-size:20px;
			font-weight:900;
			color:#3b8686;
			text-align:center;
		}
		/*여기까지 header*/
		
		.your_content {
			width: 1050px;
            min-height: 60px;
            position: relative; /*여기가 relative라는게 중요해*/
            padding: 15px;
            line-height:25px;
		}
		/*여기까지 content*/
		
		/*사진박스*/
		 .your_img_box {
            width: 1080px;
            height: 120px;
            margin-bottom: 15px;
            float:left;            
        }
        .imgs {
            width: 1030px;
            height: 120px;
            float:left;     
            overflow: hidden;
        }
         .your_img_box ul {
            width: 1030px;
            height: 120px;
            transition: .2s ease;
        }
        .your_img_box ul li {
            width: 120px;
            height: 120px;
            margin-left: 5px;
            float: left;
        }
        .your_img_box ul img {
            width: 120px;
            height: 120px;
            border-radius:20px;
        }

        #yourReply .your_img_box .arrow {
            background: red;
            width: 25px;
            height: 100px;
            border: none;
            text-align: center;
            line-height: 100px;
            box-shadow: 0 0 1px #424242;
            margin-top:10px;
            cursor: pointer;
            float:left;
        }
        #yourReply .your_img_box .left {
            border-radius: 5px 0 0 5px;
        }
        #yourReply .your_img_box .right {
            display: none;
            border-radius: 0 5px 5px 0;
        }
        .your_img_box ul.none {
            display: none;
        }
        
        
		/*버튼*/
		.btn_box {
			float:left;
			width:1080px;
			height:20px;
			padding-top:10px;
			text-align:right;
			border-top:1px solid #424242;
		}
		
        
    </style>
    
    
</head>
<body>
    <div id="reply">
                <div id="myReply">
                    <img src="img/유정이.jpg" alt="" width="70" height="70" />
                    <div class="my_content">
                        <textarea></textarea>
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
                                <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                                <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                                <li><i class="fa fa-camera"></i></li>
                            </ul>
                        </div>
                        <button class="arrow right">&gt;</button>
                    </div>
                    <button class="btn insert">등록</button>
                </div><!-- myReply -->




<div id="yourReply">
<ul>
	<li>
	<div class="reply_header"><!-- 글쓴이 날짜 좋아요 -->
	<div id="yourPhoto">
	<img src="img/유정이.jpg" alt=""/></div>
	<div id="nameNdate">
	<div class="yourName">유정이내뀨</div>
	<div class="regdate">2017.03.31</div>
	</div>
	<div class="like">
	<button class="r_icon"><i class="fa fa-thumbs-o-up"></i></button>
	<div class="r_num">45</div>
	</div><!-- like end -->
	</div><!-- reply_header end -->

	<div class="your_content"><!-- 댓글 내용 -->
	    망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
	    이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
        9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요.
        일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가
        좀 더 조리를 오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
	    이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
        9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 	
	</div>     

	<div class="btn_box user_check"><!-- 버튼 -->
		<button class="btn update">수정</button>
		<button class="btn delete">삭제</button>
	</div>              
	</li>
	
	<li>
	<div class="reply_header"><!-- 글쓴이 날짜 좋아요 -->
	<div id="yourPhoto">
	<img src="img/유정이.jpg" alt=""/></div>
	<div id="nameNdate">
	<div class="yourName">유정이내뀨</div>
	<div class="regdate">2017.03.31</div>
	</div>
	<div class="like">
	<button class="r_icon"><i class="fa fa-thumbs-o-up"></i></button>
	<div class="r_num">45</div>
	</div><!-- like end -->
	</div><!-- reply_header end -->

	<div class="your_content"><!-- 댓글 내용 -->
	    망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
	    이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
        9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요.
        일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가
        좀 더 조리를 오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
	    이브 재즈 밴드도 공연을 해주시구요. 망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
        9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 	
	</div>     
	
    <div class="your_img_box"><!-- 사진 -->
        <button class="arrow left">&lt;</button>
        <div class="imgs">
            <ul>
                <li><img src="img/1.jpg" alt= "댓글사진1"/></li>
                <li><img src="img/2.jpg" alt= "댓글사진1"/></li>
                <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                <li><img src="img/5.jpg" alt= "댓글사진1"/></li>
            </ul>
        </div>
        <button class="arrow right">&gt;</button>
    </div>
	
	<div class="btn_box user_check"><!-- 버튼 -->
		<button class="btn update">수정</button>
		<button class="btn delete">삭제</button>
	</div>    
	          
	</li>
              
                        
                        
                   <!--  
                        
                        <li>
                            <div class="reply_header">
                                <span class="regdate">2017.03.31</span>
                                <div class="btn_box">
                                    <button class="btn update">수정</button>
                                    <button class="btn delete">삭제</button>
                                </div>
                            </div>
                            <div class="user">
                                <img src="img/유정이.jpg" alt="" width="70" height="70" />
                                <span class="yourName">유정이내뀨</span>
                            </div>
                            <div class="your_content">
                                망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
                                9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요.
                                일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가
                                좀 더 조리를 오래 했는지 썰어먹는다기보단 잘게 찢어서 먹는 느낌이었어요. 매쉬드 포테이토도 괜찮았어요.
                                망고플레이트에서 주신 와인 나잇 초대권으로 3월 말에 아슬아슬하게 다녀왔어요ㅎㅎ 메인메뉴로 코코뱅이 나오구,
                                9가지의 타파스 그리고 15가지 종류의 와인을 가져다 먹을 수 있어요. 라이브 재즈 밴드도 공연을 해주시구요.
                                일단 메인 메뉴로 나온 코코뱅 진짜 맛있었어요! 프랑스 갔을 때 먹었던거랑 비교해도 별로 손색이 없어요. 여기가
                            </div>
                            <div class="your_img_box">
                                <button class="arrow left">&lt;</button>
                                <div class="imgs">
                                    <ul>
                                        <li><img src="img/1.jpg" alt= "댓글사진1"/></li>
                                        <li><img src="img/2.jpg" alt= "댓글사진1"/></li>
                                        <li><img src="img/3.jpg" alt= "댓글사진1"/></li>
                                        <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                                        <li><img src="img/4.jpg" alt= "댓글사진1"/></li>
                                        <li><img src="img/5.jpg" alt= "댓글사진1"/></li>
                                    </ul>
                                </div>
                                <button class="arrow right">&gt;</button>
                            </div>
                            <div class="like">
                                <button class="r_icon"><i class="fa fa-thumbs-o-up"></i></button>
                                <span class="r_num">45</span>
                            </div>
                        </li> 
                        -->     
                    
                    </ul>
                </div><!-- yourReply -->
            </div><!-- #reply -->
        
    <script src="../js/jquery.js"></script>
    <script>
        var $myArrow = $(".my_img_box .arrow");
        var myImgX = 0;
        var $myImgs = $(".my_img_box li").length;
        //        alert($myImgs);
        if($myImgs <= 10) {
            $myArrow.css("display","none");
        }

        $myArrow.click(function () {
            var $this = $(this);
            $this.parent().find(".arrow").show();
            if($this.hasClass("left")) {
                myImgX = myImgX - 83.1;
            }else {
                myImgX = myImgX + 83.1;
            }
            $this.parent().find("ul").css("left",myImgX);
            var num = $this.parent().find("li").length;
            if(myImgX == 0 || myImgX == (num-10) * -83.1) {
                $this.hide();
            }
        })

        var $yourArrow = $(".your_img_box .arrow");
        var yourImgX = 0;
        $yourArrow.click(function () {
            var $this = $(this);
            $this.parent().find(".arrow").show();
            if($this.hasClass("left")) {
                yourImgX = yourImgX - 158;
            }else {
                yourImgX = yourImgX + 158;
            }
            var num = $this.parent().find("li").length;
            $this.parent().find("ul").css("left",yourImgX);
            if(yourImgX == 0 || yourImgX == (num-5) * -158) {
                $this.hide();
            }
        })
    </script>
</body>
</html>