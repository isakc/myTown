<%@page import="com.sc.mytown.util.PaginateUtil"%>
<%@page import="com.sc.mytown.vo.PageVo"%>
<%@page import="com.sc.mytown.dao.AddressDAO"%>
<%@page import="com.sc.mytown.vo.AddressVo"%>
<%@page import="com.sc.mytown.dao.TownstalksDAO"%>
<%@page import="com.sc.mytown.vo.TownstalkVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int userDongNo = 1; //session에서 가져올 값
	
	List<AddressVo> guList = AddressDAO.guSelectList();
%>
<%
	int nowPage = 1;

	Object nowStr = session.getAttribute("nowPage");
	
	if(nowStr!=null){
		if(nowStr instanceof String){
			nowPage = Integer.parseInt((String)nowStr);
		}else {
			nowPage = (Integer)nowStr;
		}
	}
	
	int addressNo = 2;
	Object addressStr = session.getAttribute("addressNo");
	
	if(addressStr!=null){
		if(addressStr instanceof String){
			addressNo = Integer.parseInt((String)addressStr);
		}else {
			addressNo = (Integer)addressStr;
		}
	}
	
	String category = "전체";
	if((String)session.getAttribute("category")!=null) {
		category = (String)session.getAttribute("category");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>talkList</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/template.css"/>
    <link rel="stylesheet" href="css/Nwagon.css"/>
    <link rel="stylesheet" href="css/townstalk/talkRank.css"/>
    <link rel="stylesheet" href="css/townstalk/talkSelect.css"/>
    <link rel="stylesheet" href="css/townstalk/talkList.css"/>
    <link rel="stylesheet" href="css/townstalk/talkListFooter.css"/>
</head>
<style>
	#guTalkRefresh {
		box-shadow: 0 0 .5px #424242;
		width: 20px;
		height: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
	}
</style>
<body>
    <h1 class="screen_out">Towns Talk</h1>
    <%@ include file="/WEB-INF/template/header.jsp"%>
    
        <div class="content_btn">
            <a href="spotList.jsp?guNo=2">TOWN SPOT</a>
            <a href="talkList.jsp" class="on">TOWNS TALK</a>
        </div><!-- #btn -->
        
        <!-- #contents -->
        <div id="contents">
            <div id="townInfo">
                <div id="newUser">
                    <span>New Towner</span>
                    <ul>
                        <li><img src="img/0.jpg" width="15" height="15"/>충정로씹던껌</li>
                        <li><img src="img/0.jpg" width="15" height="15"/>스타벅스</li>
                        <li><img src="img/0.jpg" width="15" height="15"/>마포구보안관</li>
                        <li><img src="img/0.jpg" width="15" height="15"/>충정로씹던껌</li>
                        <li><img src="img/0.jpg" width="15" height="15"/>충정로씹던껌</li>
                    </ul>
                </div><!-- #newUser -->
                <div id="rankAux">
					<div id="rankBox">
		                    <div id="townRankBoard">
		                    	<h3>Rank Of My Town</h3>
		                    	<span></span>
		                    </div><!-- #townRankBoard -->
		                    <div class="town_rank">
		                    	<h3>Rank of Town</h3>
		                        <ul>
		                            <li class="top_ranking">1위 서울시 관악구 청림동<span class="person">232,322명</span></li>
		                            <li>2위 서울시 관악구 신림동<span class="person">202,332명<%=category %></span></li>
		                            <li>3위 서울시 관악구 서원동<span class="person">142,353명</span></li>
		                            <li>4위 서울시 관악구 대학동<span class="person">140,242명</span></li>
		                            <li>5위 서울시 관악구 성현동<span class="person">118,673명</span></li>
		                        </ul>
		                    </div><!-- #town_rank -->
		        </div><!-- #RankBox -->    
    
        		<div id="Nwagon"><h3>Rate Of Town Popularity</h3></div>
                
			</div><!-- SooInfo -->
            
            </div><!-- #townInfo -->
            <hr/>
            
            <div id="townSelect">
                <select id="towns">
                	<%for(AddressVo gu : guList) { %>
                    <option value="<%=gu.getNo() %>" <%if(gu.getNo()==userDongNo) { %>selected<%} %>><%=gu.getName() %></option>
                    <%} %>
                </select>
                <div id="guTalkRefresh"><i class="fa fa-refresh"></i></div>
                <div id="dong">
					<ul>
						<li>
							<div class="dongMenu">즐겨찾는 동네</div>
								<ul class="sub favorite_dong">
								</ul>
                        </li><!-- 즐겨찾는 동네 -->
                        <li>
							<div class="dongMenu">동네 리스트</div>
								<ul class="sub default_dong"></ul>
                        </li><!-- 동네 추가하기 -->
                    </ul>
                </div><!-- dong end -->
            </div><!-- #townSelect -->
            
            
            <div id="talk">
                <ul id="talkCategory">
                    <li class="all_category <%if(category.equals("전체")) { %>on<%} %>">전체</li>
                    <li class="<%if(category.equals("타운정보")) { %>on<%} %>">타운정보</li>
                    <li class="<%if(category.equals("잡담")) { %>on<%} %>">잡담</li>
                    <li class="<%if(category.equals("질문")) { %>on<%} %>">질문</li>
                </ul>
                <ul id="talkList">
                	
                </ul>
                 <hr/>
                <div id="talkListFooter">
                    <div id="listType">
                        <button class="talk_list all_list">목록</button>
                        <button class="talk_list best_list">인기글</button>
                    </div>
                    <!-- paginate -->
                    <div id="page">
                    
                    </div>
                    <a href="talkInsertForm.jsp" id="writeBtn">글쓰기</a>
                    <div id="search">
                        <select>
                            <option>전체</option>
                            <option>제목</option>
                            <option>글쓴이</option>
                            <option>내용</option>
                            <option>해시태그</option>
                        </select>
                        <input id="searchBar" name="searchBar"/>
                        <a href="" class="btn search_btn">검색</a>
                    </div>
                </div><!-- #talkListFooter -->
            </div><!-- #talk -->
        </div><!-- #contents end -->
<%@ include file="/WEB-INF/template/footer.jsp"%>

    <script src="js/jquery.js"></script>
    <script src="js/content_btn_class.js"></script>
    <script src="js/underscore-min.js"></script>
    <script src="js/Nwagon_no_vml.js"></script>
    <script>
        var options = {
            'legend':{
                names: [['봉천동'], ['신림동'], ['남현동'], ['보라매동'], ['청림동'], ['성현동'], ['행운동'], ['낙성대동'], ['청룡동'], ['은천동'], ['중앙동'], ['인현동'], ['서원동'], ['신원동'], ['서림동'], ['신사동'], ['난향동'], ['조원동'], ['대학동'], ['삼성동'], ['미성동'], ['난곡동']]
            },
            'dataset': {
                title: 'Avg Bill Paid',
                values: [[32],[78],[42],[50],[88],[67],[54],[23],[5],[66],[45],[36],[73],[33],[53],[41],[64],[71],[24],[64],[21],[48]],
                colorset: ['#2EB400', '#2BC8C9', "#666666", '#45d823', "#5539d3", '#192a5f', "#ad4fde", '#b62b66', "#3c66ad", '#0b54df', "#3ef55a", '#1b69d2', "#d090aa", '#3faf67', "#3ffa56", '#4b67a3', "#67bfdd", '#47b053', "#24d8a0", '#af0934', "#18a500", "#ba3309"],
                opacity:[0.9]
            },
//            'core_circle_value' : ['전체:1,515,413명'],
            'core_circle_radius':50,
            'maxValue' : 100,
            'increment' : 20,
            'chartDiv': 'Nwagon',
            'chartType': 'polar_pie',
            'chartSize': {width:445, height:300}
        };
        Nwagon.chart(options);
    </script><!-- graph -->
    
<script type="text/template" id="dongtalkListTmp">
	<@if(dong.favorite) { @>
		<li class="sub_li <@if(dong.no==<%=addressNo%>) {@>on<@}@>" data-dongNo="<@=dong.no @>"><i class="fa fa-circle" title="취소"></i><span><@=dong.name @></span></li>
	<@}else { @>
		<li class="sub_li <@if(dong.no==<%=addressNo%>) {@>on<@}@>" data-dongNo="<@=dong.no @>"><i class="fa fa-circle-o" title="즐겨찾기 추가"></i><span><@=dong.name @></span></li>
	<@} @>
</script>

<script type="text/tamplate" id="talkListTmp">
	<@$(talk).each(function(){ @>
	<li>
		<a href="talk.jsp?talkNo=<@=this.no @>">
			<img src="img/<@=this.repPicture @>" alt="" width="100"/>
			<span class="talkType"><@=this.subject @></span>
			<h3 class="title"><div class="bestTalk <@if(this.no==100) {@>none<@} @>"><!-- Best Talk Image --></div><@=this.title @></h3>
			<span class="regdate"><@=this.regDate @></span>
			<div class="user">
				<span class="user_type"><img src="img/<@=this.profile @>" alt="" width="25"<@if(this.dongNo == this.userDong) { @> class="towner"<@} @>/></span>
				<span class="nickname"><@=this.nickname @></span>
			</div>
		</a>
	</li>
	<@}) @>
</script>

<script>
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
	};
  	
  	var nowPage = <%=nowPage %>;
  	var addressNo = <%=addressNo  %>;
  	var category = "<%=category %>";
  	
  	var $towns = $("#towns");
  	var $dong_menu = $("#dong .sub");
  	var $favorite_dong = $("#dong .favorite_dong");
  	var $default_dong = $("#dong .default_dong");
  	var $dongtalkListTmp = _.template($("#dongtalkListTmp").html());
  	paging();
  	
  	guTalkList();
  	$towns.change(guTalkList);
  	
  	var $guTalkRefresh = $("#guTalkRefresh");
  	$guTalkRefresh.click(guTalkList);
  	

  	$("#dong").on("click","li.sub_li",dongTalkList);
  	
	var $talkCategory = $("#talkCategory>li");
	var $allCategory = $(".all_category");
	$talkCategory.click(talkListByCategory);
      
	var $talkListBtn = $(".talk_list");
	$talkListBtn.click(function() {
		nowPage = 1;
		var $this = $(this);
		if($this.hasClass("all_list")) {
			paging();
		}else {
			bestTalkList();
			function bestTalkList() {
				nowPage = 1;
				$.ajax("ajax/bestTalkSelectList.jsp",{
					dataType:"json", type:"post", data:{"addressNo":addressNo,"category":category,"nowPage":nowPage}, error:function(xhr,error) {alert("점검중aaa")},
					success:function(json){
						talkListCode = $talkListTmp({talk:json.list}); // 스팟, 글 리스트
						$talkList.html(talkListCode); // talkList의 하위 요소로 html작성
						$("#page").html(json.page); // #page의 하위요소로 paging추가
					} // success end
				}) // $.ajax() end
			} // bestTalkList function end
		} // $talkListBtn if~else end
	}) // $talkListBtn.click end
  	
	var $page = $("#page");
	$page.on("click","a.pageOne",function(e) {
		e.preventDefault();
		nowPage = $(this).text();
  		paging();
	})

	/* functions */
	var $talkList = $("#talkList");
  	var $talkListTmp = _.template($("#talkListTmp").html());
  	var talkListCode;
  	
	function guTalkList() {
		nowPage = 1;
		var guNo = $towns.val();
		$dong_menu.empty();
		$.ajax("ajax/dongSelectList.jsp",{
			dataType:"json", type:"post", data:{"guNo":guNo}, error:function(xhr,error) {alert("점검중sss")},
			success:function(json){
				$(json).each(function() {
					var dongListCode = $dongtalkListTmp({dong:this});
					if(this.favorite) {
						$favorite_dong.append(dongListCode);
					}else {
						$default_dong.append(dongListCode);
					}
					$talkCategory.removeClass("on");
					$allCategory.addClass("on");
				})
				$(".sub .sub_li").removeClass("on");
			} // success end
		}) // $.ajax() end/
		category = "전체";
		addressNo = guNo;
		paging();
		
		//$talkCategory.hide();
	}

	function dongTalkList() {
	   	nowPage = 1;
	   	category = "전체";
	   	$talkCategory.removeClass("on");
	   	$allCategory.addClass("on");
 		var $this = $(this);
 		addressNo = $this.attr("data-dongNo");
 		$("#dong .on").removeClass("on");
 		$this.addClass("on");
 		paging();
	}
	
	function talkListByCategory() {
		nowPage = 1;
		var $this = $(this);
        category = $this.text();
		$talkCategory.removeClass("on");
		$this.addClass("on");
		paging();
   	}
	
	function paging() {
  		$.ajax("ajax/talkSelectList.jsp",{
			dataType:"json", type:"post", data:{"addressNo":addressNo,"category":category,"nowPage":nowPage}, error:function(xhr,error) {alert("점검중aaa")},
			success:function(json){
				talkListCode = $talkListTmp({talk:json.list}); // 스팟, 글 리스트
				$talkList.html(talkListCode); // talkList의 하위 요소로 html작성
				$("#page").html(json.page); // #page의 하위요소로 paging추가
			} // success end
		}) // $.ajax() end
	}
</script>
<%@include file="/WEB-INF/template/logBoxScript.jsp"%>
</body>
</html>