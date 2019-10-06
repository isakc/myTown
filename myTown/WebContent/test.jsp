<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#rSpotBox{
            width: 1080px;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        #foodTown{
            width: 1080px;
            position: relative;
            display: none;
        }

        #foodTown.on{
            display: block;
        }

        #playTown{
            width: 1080px;
            position: relative;
            display: none;
        }

        #playTown.on{
            display: block;
        }

        .setLabel{
            font-size: 40px;
            font-weight: 500;
        }

        .spotList{
            width: 1020px;
            position: relative;
            margin: auto;
            overflow: hidden;
        }

        .posts li {
            float: left;
            padding: 10px;
            padding-left: 0;
        }

        .post{
            width: 330px;
            height: 250px;
            border-radius: 50px;
            position: relative;
        }

        .postTop{
            width: 330px;
            height: 70px;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
        }

        .foodPostTop{
            background-color: #AED581;
        }

        .playPostTop{
            background-color: #a19fff;
        }

        .grade{
            width: 52px;
            height: 52px;
            border-radius: 26px;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            background-color: #fff;
            margin-top: 8px;
            margin-right: 4px;
            margin-left: 4px;
        }

        .grade .fa-star{
            font-size: 25px;
            color: #FFEB3B;
        }

        .grade em{
            font-size: 20px;
            font-weight: 900;
        }

        .text{
            width: 220px;
            height: 70px;
            position: relative;
            top: 0;
            left: 60px;
        }

        .text h4{
            display:inline-block;
            width: 200px;
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            font-weight: 900;
            position: absolute;
            top: 0;
            left: 10px;
        }

        .text h4>a{
            text-decoration: none;
            color: black;
            white-space: nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
            display: inline-block;
            max-width: 160px;
            vertical-align: middle;
        }

        .text h4>a:hover{
            text-decoration: underline;
        }

        .bookmark{
            color: #ff2d4a;
            font-size: 30px;
            vertical-align: middle;
        }

        .post .text .bookmark:hover{
            cursor: pointer;
        }

        .spotHashTag{
            width: 220px;
            height: 20px;
            position: absolute;
            top: 35px;
            left: 10px;
        }

        .postProfile{
            width: 50px;
            height: 70px;
            position: absolute;
            top: 8px;
            right: 8px;
        }

        .postProfile img{
            width: 55px;
            height: 55px;
            position: absolute;
            top: 0;
            right: 0;
            transition: 0.2s ease;
            border-radius: 50px;
        }

        .post:hover .postProfile .jumin{
            width: 20px;
            height: 20px;
        }

        .post:hover{
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24),
            0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }

        .imageBox{
            width: 330px;
            height: 180px;
            position: absolute;
            top: 70px;
            left: 0;
            border-radius: 300px;
            background: #fff;
        }

        .imageBox img{
            width: 330px;
            height: 180px;
            border-bottom-right-radius: 50px;
            border-bottom-left-radius: 50px;
        }

        .paging {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 30px;
            cursor: pointer;
        }

        .paging .pageOne:hover{
            color: lightblue;
        }

</style>
</head>
<body>
<div id = "rSpotBox">
            <h2 class="screen_out">바텀메뉴</h2>
            <div id="foodTown" class="townList on">
                <h3 class="setLabel food">FOOD TOWN</h3>
                <div class ="spotList">
                    <ul class= "posts">
                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">엽기떡볶이</a>
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
                                    <img src="img/dduk.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">짬짬뽕뽕 맛있asdfsdf</a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#관악구</li>
                                                <li>#흑룡강~~~</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/jjam.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href ="" title="짬짬뽕뽕 맛있asd">고기고기</a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#소고기</li>
                                                <li>#굽자구워</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/gogigogi.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>
                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">호호호!</a>
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
                                    <img src="img/dduk.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">호호호!</a>
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
                                    <img src="img/dduk.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post food">
                                <div class="foodPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">호호호!</a>
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
                                    <img src="img/dduk.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>
                    </ul> <!-- posts -->
                </div><!-- foodTownList -->
                <div class="paging">
                    <i class="fa fa-chevron-circle-left"></i>
                    <span class="pageOne">1</span>
                    <span class="pageOne">2</span>
                    <span class="pageOne">3</span>
                    <span class="pageOne">4</span>
                    <span class="pageOne">5</span>
                    <i class="fa fa-chevron-circle-right"></i>
                </div><!-- //paging -->
            </div><!-- foodTown -->

            <div id="playTown" class="townList">
                <h3 class="setLabel play">PLAY TOWN</h3>
                <div class ="spotList" >
                    <ul class= "posts">
                        <li>
                            <div class="post play">
                                <div class="playPostTop foodTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asdzzz">찜질찜질</a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#뜨거워</li>
                                                <li>#계란~~~</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/jjimjil.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post play">
                                <div class="playPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">미술원</a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#근엄</li>
                                                <li>#하암~~</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/misul.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>

                        <li>
                            <div class="post play">
                                <div class="playPostTop postTop">
                                    <div class="grade">
                                        <i class="fa fa-star"></i>
                                        <p><em>4.9</em></p>
                                    </div><!-- grade -->

                                    <div class="text">
                                        <h4><a href="" title="짬짬뽕뽕 맛있asd">에버랜드</a>
                                            <i class="fa fa-bookmark-o bookmark"></i></h4>
                                        <div class="spotHashTag">
                                            <ul>
                                                <li>#우와</li>
                                                <li>#너무즐겁~</li>
                                            </ul>
                                        </div><!--spotHashTag -->
                                    </div><!-- text -->

                                    <div class="postProfile">
                                        <img class="postImg profileImg" src="img/kim.jpg"/>
                                        <img class="postImg jumin" src="img/주민.jpg"/>
                                    </div><!-- profile -->
                                </div><!--postTop-->
                                <div class="imageBox">
                                    <img src="img/nol2.jpg"/>
                                </div><!--imageBox-->
                            </div><!-- post -->
                        </li>
                    </ul> <!-- posts -->

                    <div class="paging">
                        <i class="fa fa-chevron-circle-left"></i>
                        <span class="pageOne">1</span>
                        <span class="pageOne">2</span>
                        <span class="pageOne">3</span>
                        <span class="pageOne">4</span>
                        <span class="pageOne">5</span>
                        <i class="fa fa-chevron-circle-right"></i>
                    </div><!-- //paging -->
                </div><!-- playTownList -->
            </div><!-- playTown -->

        </div> <!--bottom -->
<script src="js/jquery.js"></script>
<script>

var $filterBtn = $(".filterBtn");
    var $tagCloudFood = $("#tagCloud ul li.food");
    var $tagCloudPlay = $("#tagCloud ul li.play");
    var $labelFood = $("#rSpotBox h3.food");
    var $labelPlay = $("#rSpotBox h3.play");
    var $sl = $("#rangeSlider");
    var $foodTown = $("#foodTown");
    var $playTown = $("#playTown");

    $filterBtn.click(function () {
        $filterBtn.removeClass("on");
        $(this).addClass("on");
        if($filterBtn.eq(0).hasClass("on")){
            $tagCloudFood.addClass("on");
            $tagCloudPlay.removeClass("on");
            $sl.addClass("on");
            $labelFood.addClass("on");
            $labelPlay.removeClass("on");
            $foodTown.addClass("on");
            $playTown.removeClass("on");
        }else{
            $tagCloudPlay.addClass("on");
            $tagCloudFood.removeClass("on");
            $sl.removeClass("on");
            $labelFood.removeClass("on");
            $labelPlay.addClass("on");
            $playTown.addClass("on");
            $foodTown.removeClass("on");
        }
    });


    $("#price").change(function () {
        var price = $(this).val();
        if(price<30000){
            $(".rangeValue").text("$");
        }else if(price<60000){
            $(".rangeValue").text("$$");
        }else{
            $(".rangeValue").text("$$$");
        }
    });

</script>
</body>
</html>