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
						<p class="introSubject"><strong>커스텀</strong></p>
						<p>여기는 커스텀 소개하는 글을 쓰는 p 입니다</p>
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p><a class="btn" href="<%=request.getContextPath()%>/custom/customList"><span>커스텀보러가기</span></a></p>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="productSection">
				<img class="opacity" src="image/main/이미지2.jpg" alt="" width=100%>
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<p class="introSubject"><strong>샐러드</strong></p>
					<div class="introText" id="customIntro"><p>여기는 일반샐러드 소개하는 글을 쓰는 p 입니다</p></div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p><a class="btn" href="<%=request.getContextPath()%>/product/productAll"><span>샐러드보러가기</span></a></p>
					</div>
				</div>
			</div>

		</div>
		<div class="swiper-slide">
			<div class="swiper-wrap" id="eventSection">
				<img class="opacity" src="image/main/이미지3.jpg" alt="" width=100%>
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<p class="introSubject"><strong>이벤트</strong></p>
						<p>여기는 이벤트 소개하는 글을 쓰는 p 입니다</p>
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn_box" id="btn_box">
						<p><a class="btn" href="<%=request.getContextPath()%>/event/eventList"><span>이벤트보러가기</span></a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="swiper-slide">Slide 5</div> -->
		<!-- <div class="swiper-slide">Slide 6</div> -->
		<!-- <div class="swiper-slide">Slide 7</div> -->
		<!-- <div class="swiper-slide">Slide 8</div> -->
		<!-- <div class="swiper-slide">Slide 9</div> -->
		<div class="swiper-slide">
			<div class="">
				<h4 class="">
					<br> <br>Instagram
				</h4>
				<h2 class="">@en_salade</h2>
				<div class="">
					<p>어쩌구 저쩌구 인스타그램 구경하셍<br> 앤샐러드 인사타</p>
				</div>
				<div class="">
					<img src="image/main/img1.png" id="instaimg1" width="200"
						height="200"> <img src="image/main/img2.jpg" id="instaimg2"
						width="200" height="200"> <img src="image/main/img3.jpg"
						id="instaimg3" width="200" height="200">
				</div>
				<br>
				<br>
				<br>
			</div>
		</div>
		<footer class="footer swiper-slide">
			<div class="footer_wrap">
				<h2 class="footer_logo">
					<br>Ensalade
				</h2>

				<div class="footer_body">
					ⓒ 2020. Ensalade, Inc. All Rights Reserved
					<address class="footer_address"></address>
				</div>
			</div>
		</footer>
	</div>
	<!-- Add Pagination -->
	<div class="swiper-pagination"></div>
</section>
<script>
<!-- Initialize Swiper -->
  var swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      slidesPerView: 1,
      spaceBetween: 90,
      mousewheel: true,
      pagination: {el: '.swiper-pagination', clickable: true},
  });
</script>
</body>
</html>
<style>
html,body{height:100%;}
.opacity{opacity: 0.5;}
</style>