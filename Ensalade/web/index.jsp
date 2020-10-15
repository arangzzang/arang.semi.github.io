<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<!-- Initialize Swiper -->
<%-- <script src="<%=request.getContextPath() %>/js/swiper.js"></script> --%>
<!-- Link Swiper's CSS -->
<!-- <link rel="stylesheet" href="../package/swiper-bundle.min.css"> -->
<!-- Swiper JS -->
<script src="../package/swiper-bundle.min.js"></script>
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.js"></script> -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Demo styles -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> -->
<!-- Swiper -->
<section class="swiper-container">
	<div class="swiper-wrapper">
		<!-- 슬라이드가 작용하는 div -->
		<div class="swiper-slide">
			<div class="bg_video_area">
				<video src="video/testVideo.mp4" autoplay loop muted></video>
			</div>
		</div>
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="customSection">
				<img class="opacity" src="image/main/custom_main.jpg" width="100%">
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<p class="introSubject">
							<strong>커스텀</strong>
						</p>
						<p>여기는 커스텀 소개하는 글을 쓰는 p 입니다</p>
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/custom/customList"><span>커스텀보러가기</span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="productSection">
				<img class="opacity" src="image/main/샐러드배경1.jpg" alt="" width=100%>
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<p class="introSubject">
						<strong>샐러드</strong>
					</p>
					<div class="introText" id="customIntro">
						<p>여기는 일반샐러드 소개하는 글을 쓰는 p 입니다</p>
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/product/productAll"><span>샐러드보러가기</span></a>
						</p>
					</div>
				</div>
			</div>

		</div>
		<div class="swiper-slide">
			<div class="swiper-wrap" id="eventSection">
				<img class="opacity" src="image/main/샐러드배경2.jpg" alt="" width=100%>
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<p class="introSubject">
							<strong>이벤트</strong>
						</p>
						<p>여기는 이벤트 소개하는 글을 쓰는 p 입니다</p>
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/event/eventList"><span>이벤트보러가기</span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="swiper-slide">Slide 5</div> -->
		<!-- <div class="swiper-slide">Slide 6</div> -->
		<!-- <div class="swiper-slide">Slide 7</div> -->
		<!-- <div class="swiper-slide">Slide 8</div> -->
		<!-- <div class="swiper-slide">Slide 9</div> -->
		<footer class="footer swiper-slide">
			<div class="footer-wrap">
				<div class="footer_insta white">
					<h4 class="title">Instagram</h4>
					<h2 class="instaid">@en_salade</h2>
					<div class="instatext">
						<p>
							앤샐러드 인스타그램에서 <br> 최신 소식과 이벤트를 확인해보세요
						</p>
					</div>
					<div class="instaimgs white">
						<div class="instaimg">
							<img src="<%=request.getContextPath()%>/image/img1.jpg"
								width="200" height="200">
						</div>
						<div class="instaimg">
							<img src="<%=request.getContextPath()%>/image/img2.jpg"
								width="200" height="200">
						</div>
						<div class="instaimg">
							<img src="<%=request.getContextPath()%>/image/img3.jpg"
								width="200" height="200">
						</div>
						<div class="instaimg">
							<img src="<%=request.getContextPath()%>/image/img4.jpg"
								width="200" height="200">
						</div>
					</div>
				</div>
				<!-- 푸터 하단 div -->
				<div class="">
					<div class="infotext">
						<h4 class="footer_logo">En salade</h4>
						<div class="footer_body">
							<nav class="footer_menu">
								<div>
									<a href="#">이용약관</a>
								</div>
								<div>
									<a href="#">개인정보처리방침</a>
								</div>
								<div>
									<a href="#">제휴문의</a>
								</div>
								<div>
									<a href="#">케이터링 문의</a>
								</div>
							</nav>
							<!-- <address class="footer_cs"> -->
							<div class="cs_time">
								<p style="min-width: 200px;">고객 센터 | 1644-1644</p>
								<p style="min-width: 200px;">평 일 | 9:00 - 18:00</p>
								<p style="min-width: 200px;">토요일 | 9:00 - 13:00</p>
								<p style="min-width: 200px;">공휴일 | 휴무</p>
								<p style="min-width: 200px;">주 소 | 서울시 성동구 성수이로 10길 14 앤샐러드타워</p>
							</div>
							<!-- </address> -->
	
							<div class="snsicon">
								<div>
									<a href=""><img
										src="<%=request.getContextPath()%>/image/fb.png" width="50"
										height="50"></a>
								</div>
								<div>
									<a href=""><img
										src="<%=request.getContextPath()%>/image/kk.png" width="50"
										height="50"></a>
								</div>
								<div>
									<a href=""><img
										src="<%=request.getContextPath()%>/image/tw.png" width="50"
										height="50"></a>
								</div>
								<div>
									<a href=""><img
										src="<%=request.getContextPath()%>/image/insta.png" width="50"
										height="50"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		
		
					<%-- <!-- 푸터 하단 div -->
					<div class="footer_info">
						<div class="infotext">
							<h4 class="footer_logo">En salade</h4>
							<div class="footer_body">
								<nav class="footer_menu">
									<div>
										<a href="">이용약관</a>
									</div>
									<div>
										<a href="">개인정보처리방침</a>
									</div>
									<div>
										<a href="">제휴문의</a>
									</div>
									<div>
										<a href="">케이터링 문의</a>
									</div>
								</nav>
								<!-- <address class="footer_cs"> -->
								<div class="cs_time">
									<p style="min-width: 200px;">고객 센터 | 1644-1644</p>
									<p style="min-width: 200px;">평 일 | 9:00 - 18:00</p>
									<p style="min-width: 200px;">토요일 | 9:00 - 13:00</p>
									<p style="min-width: 200px;">공휴일 | 휴무</p>
									<p style="min-width: 200px;">주 소 | 서울시 성동구 성수이로 10길 14 앤샐러드타워</p>
								</div>
								<!-- </address> -->
		
								<div class="snsicon">
									<div>
										<a href=""><img
											src="<%=request.getContextPath()%>/image/fb.png" width="50"
											height="50"></a>
									</div>
									<div>
										<a href=""><img
											src="<%=request.getContextPath()%>/image/kk.png" width="50"
											height="50"></a>
									</div>
									<div>
										<a href=""><img
											src="<%=request.getContextPath()%>/image/tw.png" width="50"
											height="50"></a>
									</div>
									<div>
										<a href=""><img
											src="<%=request.getContextPath()%>/image/insta.png" width="50"
											height="50"></a>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
	</div>
	
	<!-- Add Pagination -->
	<div class="swiper-pagination"></div>
</section>
<script>
<!-- Initialize Swiper -->
  var swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      slidesPerView: 1,
      spaceBetween: 135,
      mousewheel: true,
      pagination: {el: '.swiper-pagination', clickable: true},
  });
</script>
</body>
</html>
<style>
html,body{height:100%;}
.opacity{opacity: 0.5;}
.white {background-color: white;}
.footer-wrap{display: block;
    width: 100%;
    min-height: 870px;}
.footer_bottom {	/* background-color: mintcream */;height: 400px;}
.footer_menu {	display: flex;	justify-content: space-around;margin: 0 200px;}

.title {text-decoration: underline;color: lightgrey;margin-bottom: 5px;margin-top: 50px;}

.instaid {margin-top: 5px;color: rgb(58, 182, 47);font-weight: lighter;}

.instatext {color: grey;font-size: 20px;margin: 30px;}

.instaimg {margin: 20px 20px 0 30px;margin-top: 25px;}

.instaimgs {display: flex;justify-content: center;/* background-color: #EEEEEE; */}

.spacebox {height: 140px;background-color: white;}

.footer_insta {text-align: center;/* background-color: #EEEEEE */;width: 100%;
    margin-top: 200px;}

.footer_info {background-color: rgb(233, 233, 233);border: rgb(233, 233, 233) solid 1px;}

.infotext {margin 0 200px;}

.footer_logo {margin-top: 30px;margin-bottom: 10px;/* padding-left : 200px;  */text-align: center;}

.footer_body {margin-top: 20px;margin-bottom: 150px;}

.footer_menu>div>a {justify-content: space-around;text-decoration: none;text-align: left;font-size: 12px;font: lightgrey;}

.cs_time {/* padding-left : 200px; */margin-top: 20px;}

.cs_time>p {margin: 10px;text-align: center;font-size: 12px;font: lightgrey;}

.snsicon {display: flex;justify-content: center;}
</style>