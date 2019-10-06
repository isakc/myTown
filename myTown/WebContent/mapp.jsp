<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>검색 및 추가</title>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/noto.sans.korea.css"/>
<style>
	#wrap {
			width:900px;
			hegiht:400px;
			margin:auto;
			font-family:'Noto Sans KR', sans-serif;
	}
	h1 {
			width:900px;
			height:30px;
			font-size:30px;
			font-weight:bold;
			line-height:30px;
			text-align:center;
			background:#C5E99B;
	        margin:20px 0;
	}
	
    #searchBox {
        width:290px;
        height:400px;
        float: left;
        background:#FFEEE4;
        margin-right:10px;
    }
    
    #q {
    	width:230px;
    	height:20px;
    	margin-bottom:20px;
    }
    #searchBtn {
    	width:50px;
    	height:27px;
    }

    #map {
        float: left;
        width:600px;
        height:400px;
    }
    #btn {
		text-align:center;
    }
    .btnBtn {
    	border:0;
    	font-size:16px;
    	background:#fff;
    	text-decoration:underline;
    }
    
    li{
    	cursor:pointer;
    	font-family:'Noto Sans KR', sans-serif;
    	font-size: 20px;
    	font-weight: 500;
    }
    
    li:hover{
    	text-decoration: underline;
    }
    
    li.on{
    	background-color: orange;
    }
</style>
</head>
<body>
<div id="wrap">
<h1>Spot</h1>
<div id="searchBox">
    <form id="frm" method="post" >
        <fieldset>
            <input id="q" placeholder="상호 검색" autocomplete="off" name="addressName"/>
            <button id="searchBtn">검색</button>
            <ul id="list">
        	<li><a href=""></a></li>
    		</ul>
        </fieldset>
    </form>

    
    <div id="btn">
    <button id="submit" type="submit"  class="btnBtn">입력하기</button>
    <button id="prevBtn" type="button" class="btnBtn">이전</button>
    <button id="nextBtn" type="button"  class="btnBtn">다음</button>
    </div>
</div><!-- searchBox end -->

<div id="map" ></div>
</div><!-- wrap end -->


<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=ef81c949ae579d222e0fc9aaa3bd3f68&libraries=services"></script>
<script src="js/jquery.js"></script>
<script>

var $prevBtn = $("#prevBtn");
var $nextBtn = $("#nextBtn");


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div

        mapOption = {
            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

   
    var infowindow = new daum.maps.InfoWindow({zIndex:1});
    

    // 장소 검색 객체를 생성합니다
    var ps = new daum.maps.services.Places();

    $("#frm").submit(function ()  {

        var q = $("#q").val();
        // 키워드로 장소를 검색합니다
        ps.keywordSearch(q, placesSearchCB);
        return false;
    });
    
    var marker

    $("ul").on("click","li",function () {
    	
    	$("ul li").removeClass("on");
    	$(this).addClass("on");
       var pos = new daum.maps.LatLng(this.dataset.lat,this.dataset.lng);
       // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        
       infowindow.setContent("<img src='"+this.dataset.image+"' width='150'>");
       infowindow.open(map);
       
        infowindow.setPosition(pos);
       
        map.setLevel(3);
        map.setCenter(pos);
    });
    
      var pagination = null;
      
      $nextBtn.click(function() {
      // 속성 값으로 다음 페이지가 있는지 확인하고
      if (pagination.hasNextPage) {
         // 있으면 다음 페이지를 검색한다.
         pagination.nextPage();
      }else {
         alert("다음페이지 없음");
      }
   });
   
    
    $prevBtn.click(function() {
         // 속성 값으로 다음 페이지가 있는지 확인하고
         if (pagination.hasPrevPage) {
            // 있으면 다음 페이지를 검색한다.
            pagination.prevPage();
         }else {
         alert("이전페이지 없음");
      }
      });

    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (status, data, pp) {
        if (status === daum.maps.services.Status.OK) {
           
           pagination = pp;
           
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new daum.maps.LatLngBounds();
            
            $("ul").empty();

            for (var i=0; i<data.places.length; i++) {
               
                $("<li>").text(data.places[i].title)
                    .attr({
                        "data-image":data.places[i].imageUrl,
                        "data-lat":data.places[i].latitude,
                        "data-lng":data.places[i].longitude,
                        "data-address":data.places[i].address,
                        "data-zipcode":data.places[i].zipcode,
                        "data-addressName": data.places[i].title
                        })
                    .appendTo("ul");
                
                console.log(data.places[i]);
                displayMarker(data.places[i]);
                bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
    }

    // 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {

        // 마커를 생성하고 지도에 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: new daum.maps.LatLng(place.latitude, place.longitude)
        });

        // 마커에 클릭이벤트를 등록합니다
        //daum.maps.event.addListener(marker, 'click', function() {
            
       // });
    }
    
    
    $("#submit").click(function () {
    	var lat = $("li.on").attr("data-lat");
    	var lng = $("li.on").attr("data-lng");
    	var zipcode = $("li.on").attr("data-zipcode");
    	var address = $("li.on").attr("data-address");
    	var addressName = $("li.on").attr("data-addressName");
    	post_to_url("spotInsertForm.jsp", {"address": encodeURI(address , "UTF-8"), "lat":lat , "lng":lng , "zipcode":zipcode, "addressName":encodeURI(addressName , "UTF-8")});
    	
    })
	
	function post_to_url(path, params, method) {
    method = method || "post";
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

    
</script>
</body>
</html>