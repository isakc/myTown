<%@page import="com.sc.mytown.dao.UsersDAO"%>
<%@page import="com.sc.mytown.vo.UserVo"%>
<%@page import="com.sc.mytown.dao.HashTagsDAO"%>
<%@page import="com.sc.mytown.vo.HashTagVo"%>
<%@page import="com.sc.mytown.vo.AddHashTagVo"%>
<%@page import="com.sc.mytown.dao.AddHashTagsDAO"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.GradesDAO"%>
<%@page import="com.sc.mytown.dao.SpotsDAO"%>
<%@page import="com.sc.mytown.vo.SpotVo"%>
<%@page import="com.sc.mytown.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sc.mytown.dao.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   //구 가져오는부분
   List<AddressVo> AddressList = AddressDAO.selectGu();
   String guNoStr = request.getParameter("guNo");
   int guNo = Integer.parseInt(guNoStr);
   
   List<AddressVo> dongList = AddressDAO.selectByGu(guNo);

   UserVo loginUser = (UserVo)session.getAttribute("loginUser");
   
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>spotList</title>
<%@include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/template.css" />
<link rel="stylesheet" href="css/recommendList.css" />
<style>
body {
   font-family: "Noto Sans KR", sans-serif;
}

#top {
   width: 1080px;
   height: 550px;
   margin: 10px 0;
}

#filter {
   float: left;
   width: 316px;
   height: 546px;
   text-align: center;
   border-right: 2px solid #c8c8a9;
   overflow: hidden;
}

#filterH3 {
   width: 310px;
   height: 20px;
   background: #a8dba8;
   margin-left: 3px;
   margin-bottom: 10px;
   font-size: 20px;
   font-weight: 900;
}

#filter #keyword {
   width: 230px;
   height: 30px;
   font-family: "Noto Sans KR", sans-serif;
   font-size: 20px;
}

.filterBtn {
   width: 125px;
   height: 50px;
   border: none;
   font-size: 20px;
   cursor: pointer;
   margin-top: 5px;
}

#foodTownBtn {
   background-color: #a9d18e;
}

#playTownBtn {
   background-color: #a19fff;
}

#foodTownBtn:hover {
   background-color: #50d137;
}

#playTownBtn:hover {
   background-color: #6161ff;
}

#foodTownBtn.on {
   background-color: #50d137;
}

#playTownBtn.on {
   background-color: #6161ff;
}

#rangeSlider {
   display: none;
}

#rangeSlider.on {
   display: block;
}

#rangeSlider .rangeValue {
   font-family: "Noto Sans KR", sans-serif;
}

#rangeSlider #price {
   width: 200px;
}

.filterMenu {
   margin-bottom: 30px;
}

.filterMenu h4 {
   width: 256px;
   height: 22px;
   background: #cff09e;
   margin-left: 30px;
   margin-bottom: 5px;
   font-size: 22px;
   font-weight: 900;
}

#tagCloud ul {
   height: 80px;
}

#tagCloud li {
   margin: 5px;
   display: inline-block;
}

#tagCloud li>a:hover {
   color: #ff2d4a;
}

#tagCloud a {
   text-decoration: none;
   color: #000;
   vertical-align: middle;
}

#tagCloud ul li.on {
   display: inline-block;
}

#tagCloud ul li {
   display: none;
}

.c1 {
   font-size: 15px;
   font-weight: 100;
   color:red;
}

.c2 {
   font-size: 16px;
   font-weight: 300;
   color:blue;
}

.c3 {
   font-size: 17px;
   font-weight: 500;
   color:orange;
}

.c4 {
   font-size: 18px;
   font-weight: 700;
   color:sky;
}

.c5 {
   font-size: 19px;
   font-weight: 900;
   color:pink;
}

#mapBox {
   float: left;
   width: 758px;
   height: 550px;
   margin-left: 2px;
}

#towns {
   width: 200px;
   height: 30px;
   font-size: 20px;
   font-weight: 800;
}

#map {
   width: 760px;
   height: 520px;
}

#towns option {
   font-size: 20px;
   font-weight: 800;
}

#insertLabel {
   width: 1076px;
   height: 60px;
   text-align: center;
   font-size: 30px;
   line-height: 60px;
   background: #a8dba8;
}

#insertLabel a {
   color: #041E42;
   font-weight: 900;
}

#insertLabel a:hover {
   color: #0097A7;
}

.paging {
      width:100%;
      text-align: center;
   } 
   
   .paging a, 
   .paging span,
   .paging strong {
      font-size:18px;
      padding:10px 16px;
      display: inline-block;
      text-decoration: none;
      color: #000;
      border-radius : 100px;
   }
   
   /* 현재페이지 */
   .paging strong {
      font-size:20px;
      font-weight:bold;
      background:#FFB74D;
      color:#fff;
      cursor: not-allowed;
   }
   
   /* 비활성화된 이전, 이후 페이지*/
   .paging span {
      color:#B39DDB;
      cursor: not-allowed;
   }
   
   /* 링크 마우스 오버 */
   .paging a:hover {
      background:#FFB74D;
      color:#fff;
      box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 
                   0 17px 50px 0 rgba(0, 0, 0, 0.19);
   }
</style>
</head>
<body>
   <%@ include file="/WEB-INF/template/header.jsp"%>

   <div class="content_btn">
      <a href="spotList.jspguNo=2" class="on">TOWN SPOT</a> <a href="talkList.jsp?guNo=2" >TOWNS TALK</a>
   </div>
   <!-- #btn -->


   <div id="contents">
      <div class="aux">

         <div id="top">
            <h2 class="screen_out">탑메뉴</h2>
            <div id="filter">
               <h3 id="filterH3">Filter</h3>
               <div class="filterMenu">
                  <input id="keyword" name="keyword" placeholder="검색" />
                  <a href=""> <i class="fa fa-search"></i>
                  </a>
               </div>
               <!-- keyword-->

               <div class="filterMenu">
                  <h4>TOWN SPOT</h4>
                  <div id="btnBox">
                     <button id="foodTownBtn" class="filterBtn on" data-typeNo="3">FOOD TOWN</button>
                     <button id="playTownBtn" class="filterBtn" data-typeNo="4">PLAY TOWN</button>
                  </div>
                  <!-- btnBox -->
               </div>
               <!-- btn -->

               <div class="filterMenu on" id="rangeSlider">
                  <label>가격대 (FOOD TOWN)</label> <input type="range" id="price"
                     name="price" min="0" max="90000" step="30000" value="0" />
                  <p>
                     <span class="rangeValue">$</span>
                  </p>
               </div>
               <!--filterMenu -->
               
               
<div class="filterMenu">
   <h3 class="screen_out">#해시태그</h3>
   <h4>해시태그</h4>
   <div id="tagCloud">
      <ul>
      <!-- <div id="foodHashTag"></div>
      <div id="playHashTag"></div> -->
      </ul>
   </div>
</div>
               
            </div>
            <!-- filter -->

            <div id="mapBox">
               <select id="towns" name="towns">
            <%
               for (AddressVo address : AddressList) {
            %>
                  <option value="<%=address.getNo()%>"><%=address.getName()%></option>
                  <%}%>
               </select>

               <div id="map"></div>

            </div>
            <!-- map -->
         </div>
         <!-- top -->

         <div id="insertLabel">
            <label>직접 명소를 등록하고 싶으세요? <a href="mapp.jsp">SPOT등록하기</a></label>
         </div>
         <!-- insertLabel -->

         <div id="rSpotBox">
            <h2 class="screen_out">바텀메뉴</h2>
            <div id="foodTown" class="townList on">
               <h3 class="setLabel food">FOOD TOWN</h3>
               <div class="spotList">
                  <ul class="posts">
                   
                  </ul>
                  <!-- posts -->
               </div>
               <!-- foodTownList -->
               <!-- //paging -->
               <!-- //paging -->
                  <div id="foodPage"></div>
            </div>
            <!-- foodTown -->

            <div id="playTown" class="townList">
               <h3 class="setLabel play">PLAY TOWN</h3>
               <div class="spotList">
                  <ul class="posts">
                     
                  </ul>
                  <!-- posts -->

                  <!-- //paging -->
                  <div id="playPage"></div>
               </div>
               <!-- playTownList -->
            </div>
            <!-- playTown -->

         </div>
         <!--rSpotBox -->
      </div>
      <!-- aux -->

   </div>
   <!-- contents-->

   <%@ include file="/WEB-INF/template/footer.jsp"%>
   
   <script type="text/tamplate" id="listTmp">
      <@ if(spot.length==0){ @>

   <li>없슴</li>
<@}else{@>
<@$(spot).each(function(){ @>
   
      <li>
      <@ if(this.typeNo==3){ @>
                        <div class="post food">
                           <div class="foodPostTop postTop">
      <@}else{@>
                        <div class="post play">
                           <div class="playPostTop postTop">
      <@}@>
                              <div class="grade">
                                 <i class="fa fa-star"></i>
                                 <p>
                                    <em>
                                 <@=this.grade@></em>
                                 </p>
                              </div>
                              <!-- grade -->

                              <div class="text">
                                 <h4>
								<@if(this.typeNo==3){@>
                                    <a href="foodtownSpot.jsp?no=<@=this.no@>" target="_blank" title="<@=this.name@>"><@=this.name@></a> <i
                                       class="fa fa-bookmark-o bookmark"></i>
								<@}else{@>
									<a href="playtownSpot.jsp?no=<@=this.no@>" target="_blank" title="<@=this.name@>"><@=this.name@></a> <i
                                       class="fa fa-bookmark-o bookmark"></i>
								<@}@>
                                 </h4>
                                 <div class="spotHashTag">
                                    <ul>
                                       <li><@=this.tag@></li>
                                    </ul>
                                 </div>
                                 <!--spotHashTag -->
                              </div>
                              <!-- text -->

                              <div class="postProfile">
                                 <img class="postImg profileImg" src="img/<@=this.profile@>" />
                              <@if(this.jumin){@>
                                 <img class="postImg jumin" src="img/c1.jpg" />
                              <@}else{@>
                                 <img class="postImg" src="img/c2.jpg" />
                              <@}@>
                              </div>
                              <!-- profile -->
                           </div>
                           <!--postTop-->
                           <div class="imageBox">
                              <img src="img/<@=this.repPicture@>" />
                           </div>
                           <!--imageBox-->
                        </div>
                        <!-- post -->
                     </li>
   <@})@>
<@} @>
</script>

<script type="text/tamplate" id="foodHashTagTmp">
   <@$(foodHashTags).each(function(){ @>
      <li class="c<@=Math.floor(Math.random() * 5) + 1@> food on"><a href="#"><@=this.tag@></a></li>
   <@});@>
</script>

<script type="text/tamplate" id="playHashTagTmp">
   <@$(playHashTags).each(function(){ @>
      <li class="c<@=Math.floor(Math.random() * 5) + 1@> play on"><a href="#"><@=this.tag@></a></li>
   <@});@>
</script>
   
   
   <script src="js/jquery.js"></script>
   <script src="js/content_btn_class.js"></script>
   <script src= "js/underscore-min.js"></script>
   <script type="text/javascript"
      src="//apis.daum.net/maps/maps3.js?apikey=ff0b5d47787f5de0113d9930f6e326b3&libraries=services"></script>
   <script>
   _.templateSettings = {
         interpolate: /\<\@\=(.+?)\@\>/gim,
         evaluate: /\<\@(.+?)\@\>/gim,
         escape: /\<\@\-(.+?)\@\>/gim
         };
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

   var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

   var points = [
      <%for(int i =0;i<dongList.size() ;i++){%>
      <%if(i==dongList.size()){%>
      new daum.maps.LatLng(<%=dongList.get(i).getLat()%>, <%=dongList.get(i).getLng()%>)
      <%}else{%>
       new daum.maps.LatLng(<%=dongList.get(i).getLat()%>, <%=dongList.get(i).getLng()%>),
       
      <%}}%>
   ];

   var bounds = new daum.maps.LatLngBounds();    

   var i, marker;
   for (i = 0; i < points.length; i++) {
       marker =     new daum.maps.Marker({ position : points[i] });
       
       bounds.extend(points[i]);
   }

   function setBounds() {
       map.setBounds(bounds);
   }
   
   setBounds();

       var $foodPosts = $("#foodTown .posts");
       var $playPosts = $("#playTown .posts");
       var nowPage=1;
       var guNo=<%=guNo%>;
       var typeNo=3; 
       var $towns = $("#towns");
       var $filterBtn = $(".filterBtn");
       var $tagCloudFood = $("#tagCloud ul li.food");
       var $tagCloudPlay = $("#tagCloud ul li.play");
       var $labelFood = $("#rSpotBox h3.food");
       var $labelPlay = $("#rSpotBox h3.play");
       var $sl = $("#rangeSlider");
       var $foodTown = $("#foodTown");
       var $playTown = $("#playTown");
       var $insertLabel = $("#insertLabel");
       
       var listTmp = _.template($("#listTmp").html());
       var foodHashTagTmp = _.template($("#foodHashTagTmp").html());
       var playHashTagTmp = _.template($("#playHashTagTmp").html());
       var argPrice=0;
       var query="";
       
       paging();
       getHashTag();
       
       $towns.change(function () {
         guNo=$(this).val();
         paging();
         getHashTag();
         setBounds();
      });
      
      $filterBtn.click(function() {
         $filterBtn.removeClass("on");
         $(this).addClass("on");
         typeNo = $(this).attr("data-typeNo");
         if ($filterBtn.eq(0).hasClass("on")) {
            $tagCloudFood.addClass("on");
            $tagCloudPlay.removeClass("on");
            $sl.addClass("on");
            $labelFood.addClass("on");
            $labelPlay.removeClass("on");
            $foodTown.addClass("on");
            $playTown.removeClass("on");
         } else {
            $tagCloudPlay.addClass("on");
            $tagCloudFood.removeClass("on");
            $sl.removeClass("on");
            $labelFood.removeClass("on");
            $labelPlay.addClass("on");
            $playTown.addClass("on");
            $foodTown.removeClass("on");
         }
         paging();
         getHashTag();
      });

      $("#price").change(function() {
         argPrice = $(this).val();
         if (argPrice < 30000) {
            $(".rangeValue").text("$");
         } else if (argPrice < 60000) {
            $(".rangeValue").text("$$");
         } else {
            $(".rangeValue").text("$$$");
         }
         paging();
         getHashTag();
      });

      $("#keyword").keyup(function () {
         query = $("#keyword").val().trim();
         paging();
         
      });//keyup end
      
      function paging(e) {
          
          $.ajax( "ajax/paging_ajax.jsp" ,{
             dataType:"json", type:"post", data:{ "guNo":guNo ,"nowPage":nowPage, "typeNo":typeNo, "argPrice": argPrice, "query": query}, error:function(xhr,error) {alert("점검중aaa")},
             success:function(json){
                
                var listCode = listTmp({spot:json.list}); // 스팟, 글 리스트
                
                if(typeNo==3){
                   $foodPosts.html(listCode);
                   $("#foodPage").html(json.page); 
                }else{
                   $playPosts.html(listCode);
                   $("#playPage").html(json.page); 
                }
                
             } // success end
          }) // $.ajax() end
       }
      
      $("#foodPage,#playPage").on("click","a.pageOne",function(e) {
             nowPage = $(this).text();
             e.preventDefault();
             paging();
      })
      
      
       
       function getHashTag() {
            $.ajax("ajax/getHashTag.jsp",{
               dataType:"json",
               type: "GET",
               data: {"guNo":guNo, "typeNo":typeNo},
               error: function (xhr, error) {
                  alert("에러발생!!");
               },
               success: function (json) {
                  
                  var tag = "";
                  if(typeNo==3){
                     
                     tag = foodHashTagTmp({foodHashTags:json});
                  }else{
                     tag = playHashTagTmp({playHashTags:json});
                     
                  }
                  
                  $("#tagCloud ul").html(tag);
               }
            })
         };//getHashTag end
         
         
   </script>
</body>
</html>