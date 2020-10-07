<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<footer class="footer swiper-slide">
                <!-- <div class="spacebox">
                </div> -->

                <!-- 푸터 상단 div -->
                <div class="footer_insta white">
                    <h4 class="title">Instagram</h4>
                    <h2 class="instaid">@en_salade</h2>
                    <div class="instatext">
                        <p>
                            앤샐러드 인스타그램에서 <br>
                            최신 소식과 이벤트를 확인해보세요
                        </p>
                    </div>
                    <div class="instaimgs white">
                        <div class="instaimg"><img src="<%=request.getContextPath()%>/image/img1.jpg" width="200" height="200"></div>
                        <div class="instaimg"><img src="<%=request.getContextPath()%>/image/img2.jpg" width="200" height="200"></div>
                        <div class="instaimg"><img src="<%=request.getContextPath()%>/image/img3.jpg" width="200" height="200"></div>
                        <div class="instaimg"><img src="<%=request.getContextPath()%>/image/img4.jpg" width="200" height="200"></div>
                    </div>



                    <!-- 푸터 하단 div -->
                    <div class="footer_info">
                        <div class="infotext">
                            <h4 class="footer_logo"> En salade</h4>
                            <div class="footer_body">
                                <nav class="footer_menu">
                                    <div><a href="">이용약관</a></div>
                                    <div><a href="">개인정보처리방침</a></div>
                                    <div><a href="">제휴문의</a></div>
                                    <div><a href="">케이터링 문의</a></div>
                                </nav>
                                <!-- <address class="footer_cs"> -->
                                <div class="cs_time">
                                    <p style="min-width : 200px;">고객 센터 | 1644-1644</p>
                                    <p style="min-width : 200px;">평 일 | 9:00 - 18:00</p>
                                    <p style="min-width : 200px;">토요일 | 9:00 - 13:00 </p>
                                    <p style="min-width : 200px;">공휴일 | 휴무</p> 
                                    <p style="min-width : 200px;">주 소 | 서울시 성동구 성수이로 10길 14 앤샐러드타워</p>
                                </div>
                                <!-- </address> -->

                                <div class="snsicon">
                                    <div><a href=""><img src="<%=request.getContextPath()%>/image/fb.png" width="50" height="50";></a></div>
                                    <div><a href=""><img src="<%=request.getContextPath()%>/image/kk.png" width="50" height="50";></a></div>
                                    <div><a href=""><img src="<%=request.getContextPath()%>/image/tw.png" width="50" height="50";></a></div>
                                    <div><a href=""><img src="<%=request.getContextPath()%>/image/insta.png" width="50" height="50";></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
            </footer>
            <style>
            .white{
            background-color:white;
            }
            
            
               .footer_bottom {
            background-color: mintcream;
            height: 400px;
        }

        .footer_menu {
            display: flex;
            justify-content: space-around;
        }
        
          .title {
            text-decoration: underline;
            color: lightgrey;
            margin-bottom: 5px;
            margin-top: 50px;
        }

        .instaid {
            margin-top: 5px;
            color: rgb(58, 182, 47);
            font-weight: lighter;
        }

        .instatext {
            color: grey;
            font-size: 13px;
            margin: 30px;
        }

        .instaimg {
            margin: 20px;
            margin-top: 0px;
            margin-bottom: 100px;

        }

        .instaimgs {
            display: flex;
            justify-content: center;
            background-color:#EEEEEE;
        }


        .spacebox {
            height: 140px;
            background-color: white;
        }

        .footer_insta {
            height: 500px;
            text-align : center;
            /* border: red solid 1px; */
            background-color:#EEEEEE;
        }

        .footer_info {
            background-color: rgb(233, 233, 233);
            border: rgb(233, 233, 233) solid 1px;
        }

        .infotext {
            margin-left: 600px;
            margin-right: 600px;
        }

        .footer_logo {
            margin-top: 30px;
            margin-bottom: 10px;
            /* padding-left : 200px;  */
            text-align: center;
        }

        .footer_body {
            margin-top: 20px;
            margin-bottom: 200px;
        }

        .footer_menu>div>a {
            justify-content: space-around;
            text-decoration: none;
            text-align: left;
            font-size: 12px;
            font: lightgrey;
        }

        .cs_time {
            /* padding-left : 200px; */

            margin-top: 20px;
        }

        .cs_time>p {
            margin: 10px;
            text-align: center;
            font-size: 12px;
            font: lightgrey;
        }

        .snsicon {
            display: flex;
            justify-content: center;
        }
            
     </style>
     
</body>
</html>