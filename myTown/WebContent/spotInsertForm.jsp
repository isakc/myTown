<%@page import="com.sc.mytown.vo.AddressVo"%>
<%@page import="com.sc.mytown.dao.AddressDAO"%>
<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   String addressName = java.net.URLDecoder.decode(request.getParameter("addressName"), "UTF-8");

   String address = java.net.URLDecoder.decode(request.getParameter("address"), "UTF-8");
   double lat = Double.valueOf(request.getParameter("lat"));
   double lng = Double.valueOf(request.getParameter("lng"));
   int zipcode = Integer.parseInt(request.getParameter("zipcode"));
   
   String[] arrayAddress = address.split(" ");
   String guStr = arrayAddress[1];
   String dongStr = arrayAddress[2];
   
   //받아오는 값들
   
   AddressVo gu = AddressDAO.selectByName(guStr);
   AddressVo dong = AddressDAO.selectByName(dongStr);
   int guNo = gu.getNo();
   int dongNo = dong.getNo();
   
   List<HashTagVo> secondCategory = HashTagsDAO.selectSecondCategory();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>spotInsertForm</title>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>

    <style>

        body{
            font-family: "Noto Sans KR", sans-serif;
            padding-top: 10px;
        }

        .aux{
            width: 1080px;
            position: relative;
            margin: auto;
        }

        #topBox{
            width: 1080px;
            height: 320px;
        }

        #topLeftBox{
            width: 520px;
            height: 300px;
            float: left;
            margin-right:40px;
        }

        #topRightBox{
            width: 520px;
            height: 300px;
            float: left;
        }
        #map{
            width: 520px;
            height: 270px;
            background:#a8dba8;
            margin-top:30px;
        }

        .topMenu{
           width:520px;
            height: 20px;
            line-height: 20px;
        }

        .setLabel{
            width: 100px;
            height:20px;
            display: inline-block;
            font-size: 20px;
            font-weight: 700;
            color: #424242;
        }

        .setTopInput{
            width: 412px;
            height: 20px;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 20px;
        }

        #middleBox{
            width: 520px;
            height: 270px;
            margin-top:30px;
        }
        
        #middleBox img{
        position: absolute;
        left:0;
        top:0;
        }

        .item{
            width: 299px; /*255*/
            height: 149px; /*132*/
            border: 1px solid #424242;
            margin-right:1px;
            margin-bottom:1px;
            float: left;
        }

        .middleLabel{
            width: 300px; /*256*/
            height: 150px; /*133*/
            line-height: 133px;
            font-size: 100px;
            display: block;
            text-align: center;
            cursor: pointer;
            position: absolute;
        }

        #uploadImg{
            display: none;
        }
        
      /*bottom box 시작*/
        #bottomBox{
            width: 1080px;
            height: 360px;
            margin-top: 10px;
            position: relative;
        }

        #bottomLeftBox{
            width: 520px;
            height: 360px;
            float:left;
            margin-right:40px;
        }

        #bottomRightBox{
            width: 520px;
            height: 360px;
            float:left;
        }

        #bottomBox h2{
            height: 26px;
            font-size: 22px;
            font-weight: 900;
            text-align: center;
            border-bottom:1px solid #424242;
        }

        #categoryBox h3{
            height: 20px;
            margin-top:10px;
            font-size: 20px;
            font-weight: 800;
        }

        #firstCategoryBox{
            height: 80px;
            line-height: 80px;
        }

        #foodTownBtn{
            background-color: #a9d18e;
        }

        #foodTownBtn:hover{
            background-color: #50d137;
        }

        #foodTownBtn.on{
            background-color: #50d137;
        }

        #playTownBtn{
            background-color: #a19fff;
        }

        #playTownBtn:hover{
            background-color: #6161ff;
        }

        #playTownBtn.on{
            background-color: #6161ff;
        }

        .btn{
            width: 125px;
            height: 50px;
            border: none;
            font-size: 20px;
            cursor: pointer;
            vertical-align: middle;
        }

        #secondCategoryBox{
            height: 120px;
        }
        #secondCategoryBox>ul {
           padding:10px;
        }

        #secondCategoryBox li{
            margin: 5px;
            display: inline-block;
        }

        #secondCategoryBox>ul li{
            display: none
        }

        #secondCategoryBox>ul li.on{
            display: inline-block;
        }

        .bottomMenu{
            margin: 5px 0;
            height: 50px;
            line-height: 40px;
        }

        .radioLabel{
            font-size: 20px;
            font-weight: 500;
        }

        .radioInput{
            width: 20px;
            height: 20px;
        }

        .setBottomInput{
            width: 410px;
            height: 30px;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 20px;
        }

        #time select{
            width: 70px;
            font-weight: 500;
            height: 25px;
        }

        .inputTime{
            font-size: 20px;
            font-weight: 500;
        }

        #delivery{
            display: none;
        }

        #delivery.on{
            display: block;
        }

        #btnBox{
            text-align: center;
        }
       
    </style>
</head>
<body>
<div id ="joinBox">
    <h1 class="screen_out">명소 등록 및 수정</h1>
    <div class="aux">
    <form id="uploadForm" method="post" enctype="multipart/form-data" >
    
    </form>
    <form id="insertForm" method="post" action ="spotInsert.jsp">
   <input type="hidden" name="repPicture" class="repPicture" />
   <input type="hidden" name="typeNo" class="typeNo"/>
        <fieldset>
            <legend class="screen_out">스팟등록 폼</legend>

            <div id = "topBox">
                <div id="topLeftBox">
                <div class="topMenu">
                    <label class="setLabel" for ="name">스팟 이름</label>
                    <input id="name"
                           name="name"
                           class="setTopInput"
                           value="<%=addressName%>"/>
                </div><!--topMenu -->
                
                <div id="middleBox"><!-- 사진 입력 박스 -->
                    <label class="middleLabel item">
                           <i class="fa fa-plus"></i>
                          <input type="file" id="uploadImg" form="uploadForm" name="representation" accept="image/*"/>
                          <img src="" id="realImg" width=300 height=150/>
                      </label>
               </div><!-- middleBox -->
            </div><!-- topLeftBox end -->
            
                <div id="topRightBox">
            <div class="topMenu">
                  <label class="setLabel" for="address">주소(위치)</label>
                <input id= "address"
                                 name="address"
                                 class="setTopInput"
                                 value="<%=address%>"/>
                  <input type="hidden" value="<%=guNo %>" name="guNo" />
                  <input type="hidden" value="<%=dongNo %>" name="dongNo" />
                  <input type="hidden" value="<%=lat %>" name="lat" />
                  <input type="hidden" value="<%=lng %>" name="lng" />
                  <input type="hidden" value="<%=zipcode %>" name="zipcode" />
             </div><!--topMenu -->

                    <div id="map">
                    </div><!-- map -->
                </div><!--topRightBox -->
            </div><!--topBox-->

            <hr/>

            <div id="bottomBox">
                <div id="bottomLeftBox">
                    <h2>기본정보</h2>
                    <div id="categoryBox">
                        <h3>카테고리</h3>
                        <div id="firstCategoryBox">
                            <label class="setLabel">1차 분류</label>
                            <button class="btn categoryBtn on" id="foodTownBtn" type="button" value="3" name="typeNo">FOOD TOWN</button>
                            <button class="btn categoryBtn" id="playTownBtn" type="button" value="4" name="typeNo">PLAY TOWN</button>
                        </div> <!--firstCategory -->
                        <div id="secondCategoryBox">
                            <label class="setLabel">2차 분류</label>
                            <ul>
                            <%for(HashTagVo hashTag : secondCategory){
                               if(hashTag.getNo()<13){
                               %>
                                <li class="on food"><input type="checkBox"
                                           id="<%=hashTag.getTag() %>"
                                           name="secondCategory"
                                           value="<%=hashTag.getTag() %>" />
                                
                                    <label for="<%=hashTag.getTag() %>"><%=hashTag.getTag() %></label></li>
                            <%}else{ %>
                            
                                <li class="play"><input type="checkBox"
                                           id="<%=hashTag.getTag() %>"
                                           name="secondCategory"
                                           value="<%=hashTag.getTag() %>" />
                                
                                    <label for="<%=hashTag.getTag() %>"><%=hashTag.getTag() %></label></li>
                            <%}} %>
                            </ul>
                        </div> <!--secondCategory -->
                    </div><!--categoryBox -->

                    <div id="hashTagBox">
                        <div class="bottomMenu">
                            <label class="setLabel" for="hashTag">해시태그</label>
                            <input id= "hashTag"
                                   name="hashTag"
                                   class = "setBottomInput"
                                   placeholder="3개까지 입력할 수 있어요"/>
                        </div><!-- bottomMenu -->

                        <div class="bottomMenu">
                            <label class="setLabel" for="description">한줄설명</label>
                            <input id="description"
                                   name="description"
                                   class = "setBottomInput"
                                   placeholder="해당 스팟을 한 줄로 설명한다면?"/>
                        </div><!-- bottomMenu -->
                    </div><!-- hashTagBox -->
                </div> <!--bottomLeftBox -->

                <div id="bottomRightBox">
                    <h2>추가정보</h2>
                    <div class="bottomMenu">
                        <label class="setLabel" for ="tell">전화번호</label>
                        <input id="tell"
                               name="tell"
                               class="setBottomInput"/>
                    </div><!-- bottomMenu-->


                    <div class="bottomMenu" id="time">
                        <label class="setLabel">영업시간</label>
                        <select name="startHour">
                        <%for(int i=0; i<25; i++){ %>
                            <option class="inputTime" value="<%=i%>"><%=i %>시</option>
                            <%} %>
                        </select> :

                        <select name="startMin" >
                        <%for(int i=0; i< 70; i+=10){ %>
                            <option class="inputTime" value="<%=i %>"><%=i %>분</option>
                        <%} %>
                        </select> ~

                        <select  name="endHour">
                        <%for(int i=0; i<25; i++){ %>
                            <option class="inputTime" value="<%=i%>"><%=i %>시</option>
                            <%} %>
                        </select> :

                        <select  name="endMin" >
                        <%for(int i=0; i< 70; i+=10){ %>
                            <option class="inputTime" value="<%=i %>"><%=i %>분</option>
                        <%} %>
                        </select>
                    </div><!-- bottomMenu -->

                    <div class="bottomMenu">
                        <label class="setLabel" for ="site">사이트</label>
                        <input id="site"
                               name="site"
                               class="setBottomInput"/>
                    </div><!-- bottomMenu -->

                    <div class="bottomMenu">
                    <label class="setLabel">WiFi</label>
                    <input type="radio"
                           name="wifi"
                           value="T"
                           id="WifiT"
                           class="radioInput"/>
                    <label for="WifiT" class="radioLabel">있음</label>

                    <input type="radio"
                           name="wifi"
                           value="F"
                           id="wifiF"
                           class="radioInput"/>
                    <label for="wifiF" class="radioLabel">없음</label>
                    </div><!-- bottomMenu -->

                <div class="bottomMenu">
                    <label class="setLabel">주차공간</label>
                    <input type="radio"
                           name="parking"
                           value="T"
                           id="parkingT"
                           class="radioInput"/>
                    <label for="parkingT" class="radioLabel">있음</label>

                    <input type="radio"
                           name="parking"
                           value="F"
                           id="parkingF"
                           class="radioInput"/>
                    <label for="parkingF" class="radioLabel">없음</label>
                </div><!-- bottomMenu -->

                <div class="bottomMenu on" id="delivery">
                    <label class="setLabel">배달</label>
                    <input type="radio"
                           name="delivery"
                           value="T"
                           id="deliveryT"
                           class="radioInput"/>
                    <label for="deliveryT" class="radioLabel">가능</label>

                    <input type="radio"
                           name="delivery"
                           value="F"
                           id="deliveryF"
                           class="radioInput"/>
                    <label for="deliveryF" class="radioLabel">불가능</label>
                </div><!-- bottomMenu -->
                </div> <!--bottomRightBox -->
            </div><!--bottomBox -->
            <hr/>
            <div class="bottomMenu" id="btnBox">
                    <button class="btn">등록하기</button>
                        <button class="btn">취소하기</button>
                    </div><!-- bottomMenu -->
            
        </fieldset>
    </form><!-- insertForm -->
    </div><!-- aux -->
</div><!-- joinBox -->

<script src="js/jquery.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ff0b5d47787f5de0113d9930f6e326b3"></script>
<script>

   var mapContainer = document.getElementById('map'), // 지도를 표시할 div
   mapOption = {
       center: new daum.maps.LatLng(<%=lat%>, <%=lng%>),
       level: 3 // 지도의 확대 레벨
   };

   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
   var map = new daum.maps.Map(mapContainer, mapOption);

   var markerPosition  = new daum.maps.LatLng(<%=lat%>, <%=lng%>);

   // 마커를 생성합니다 
   var marker = new daum.maps.Marker({
   position: markerPosition
   });

   // 마커가 지도 위에 표시되도록 설정합니다
   marker.setMap(map);


var typeNo = $(".categoryBtn.on").val();
$(".typeNo").val(typeNo);
var $categoryBtn = $(".categoryBtn");
var $delivery = $("#delivery");
var index=0;
$categoryBtn.click(function () {

    $categoryBtn.removeClass("on");
    $(this).addClass("on");
    index = $(this).index();
    if($categoryBtn.eq(0).hasClass("on")){
        $delivery.addClass("on");
        $("#secondCategoryBox ul li.play").removeClass("on");
        $("#secondCategoryBox ul li.food").addClass("on");
    }else{
        $delivery.removeClass("on");
        $("#secondCategoryBox ul li.food").removeClass("on");
        $("#secondCategoryBox ul li.play").addClass("on");
    }
    
    var typeNo = $(".categoryBtn.on").val();
    $(".typeNo").val(typeNo);
});

   var regExp = /^image\/[\w]*/;
   var uploadForm = $("#uploadForm").get(0);
   var $representation = $("#representation");
   var representation = $representation.get(0);

   var $uploadImg = $("#uploadImg");

   var uploadImg = $uploadImg.get(0);

   var uploadForm = $("#uploadForm").get(0);

   var regExp = /^image\/[\w]*/;

   var count = 0;

   var regExp = /^image\/[\w]*/;
   var uploadForm = $("#uploadForm").get(0);
   var $uploadImg = $("#uploadImg");
   var uploadImg = $uploadImg.get(0);

   $uploadImg.change(function() {
      
      if(regExp.test(uploadImg.files[0].type)) {
         
         var formData = new FormData(uploadForm);
         
         $.ajax("../ajax/uploadsung.jsp",{
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){ 
               var fileName = data.fileName;
               $("#realImg").attr("src","img/"+fileName);
               
               $(".repPicture").val(fileName);
               
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