<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<!-- Initialize Swiper -->
<%-- <script src="<%=request.getContextPath() %>/js/swiper.js"></script> --%>
<!-- Link Swiper's CSS -->
<!-- <link rel="stylesheet" href="../package/swiper-bundle.min.css"> -->
<!-- Swiper JS -->
<!-- <script src="../package/swiper-bundle.min.js"></script> -->`
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.js"></script> -->
<!-- <!!!!!!!!!!!!!!!!!!!!!script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
<!-- Demo styles -->
<!-- <!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css"> -->
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> -->
<!-- Swiper -->

<section class="swiper-container">
	
	<div class="swiper-wrapper">
		<!-- 슬라이드가 작용하는 div -->
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="customSection">
				<img class="opacity"
					style="background-image: url('<%=request.getContextPath()%>/image/main/이미지4.jpg');">
				<!-- src="image/main/이미지4.jpg" -->
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<!-- <p class="introSubject">
							<strong>커스텀</strong>
						</p>
						<p>여기는 커스텀 소개하는 글을 쓰는 p 입니다</p> -->
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn">
						<div class="inner-wrapper">
							<i class="material-icons-round">custom</i>
					
							
							
							
						</div>
					</div>
					<%-- <div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/custom/customList"><span>커스텀보러가기</span></a>
						</p> --%>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="swiper-wrapper">
		<!-- 슬라이드가 작용하는 div -->
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="customSection">
				<img class="opacity"
					style="background-image: url('<%=request.getContextPath()%>/image/main/이미지4.jpg');">
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<!-- <p class="introSubject">
							<strong>커스텀</strong>
						</p>
						<p>여기는 커스텀 소개하는 글을 쓰는 p 입니다</p> -->
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn">

						<div class="inner-wrapper">
							
							
							<i class="material-icons-round">product</i>
							</a>
						</div>

					</div>

					<%-- <div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/custom/customList"><span>커스텀보러가기</span></a>
						</p> --%>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="swiper-wrapper">
		<!-- 슬라이드가 작용하는 div -->
		<div class="swiper-slide">
			<!--swiper-wrap : 이미지와 텍스트를 감싸는 div-->
			<div class="swiper-wrap" id="customSection">
				<img class="opacity"
					style="background-image: url('<%=request.getContextPath()%>/image/main/이미지4.jpg');">
				<!--innerText : 텍스트와 버튼을 감싸는 div -->
				<div class="innerText">
					<!-- introText : 소개글 div -->
					<div class="introText" id="customIntro">
						<!-- <p class="introSubject">
							<strong>커스텀</strong>
						</p>
						<p>여기는 커스텀 소개하는 글을 쓰는 p 입니다</p> -->
					</div>
					<!-- btn_box : 버튼박스div -->
					<div class="btn">
						<div class="inner-wrapper">
						
							<i class="material-icons-round">event</i>
						</a>
						</div>
					</div>
					<%-- <div class="btn_box" id="btn_box">
						<p>
							<a class="btn"
								href="<%=request.getContextPath()%>/custom/customList"><span>커스텀보러가기</span></a>
						</p> --%>
				</div>
			</div>
		</div>
	</div>
	
	</div>

	
	
</section>
</body>
</html>

<script>


$(".material-icons-round").click(e=>{
	console.log($(e.target).html());
	let a=$(e.target).html();
	console.log(typeof(a));
	if(a=='custom'){
location.assign('<%=request.getContextPath()%>/custom/customList');
		
}else if($(e.target).html()=='product'){
	location.assign('<%=request.getContextPath()%>/product/productAll');
}else if($(e.target).html()=='event'){
	location.assign('<%=request.getContextPath()%>/event/eventList');
}else{console.log('????');}
});


const btns = document.querySelectorAll('.btn');

for (let btn of btns) {
btn.onclick = () => btn.classList.toggle('active');
}






<!-- Initialize Swiper -->
 /*  var swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      slidesPerView: 1,
      spaceBetween: 135,
      mousewheel: true,
      pagination: {el: '.swiper-pagination', clickable: true},
  }); */

  </script>


<style>
html,body{height:100%;}

.swiper-wrap {
	width: 100%;
	heigth: auto;
}
.opacity{
opacity: 0.8;
	width: 100%;
	height: 700px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	margin-bottom: -9px;
	}
.white {
background-color: white;
}
.footer-wrap{
display: block;
    width: 100%;
    min-height: 870px;
    }
.footer_bottom {
	/* background-color: mintcream */;
	height: 400px;
	}
.footer_menu {	
display: flex;	
justify-content: space-around;
margin: 0 200px;}

.title {
text-decoration: underline;
	color: lightgrey;
	margin-bottom: 5px; /* margin-top: 50px; */
}
.instaid {
margin-top: 5px;
color: rgb(58, 182, 47);
font-weight: lighter;
}

.instatext {
color: grey;
font-size: 20px;
margin: 30px;}

.instaimg {
margin: 20px 20px 0 30px;
margin-top: 25px;
}

.instaimgs {
display: flex;
justify-content: center;
/* background-color: #EEEEEE; */}

.spacebox {
height: 140px;
background-color: white;
}

.footer_insta {
text-align: center;
/* background-color: #EEEEEE */;
width: 100%;
    margin-top: 200px;
    }

.footer_info {
background-color: rgb(233, 233, 233);
border: rgb(233, 233, 233) solid 1px;
}

.infotext {
margin 0 200px;
}

.footer_logo {
margin-top: 30px;
margin-bottom: 10px;
/* padding-left : 200px;  */
text-align: center;
}

.footer_body {
margin-top: 20px;
margin-bottom: 150px;
}

.footer_menu>div>a {
justify-content: space-around;
text-decoration: none;
text-align: left;
font-size: 12px;
font: lightgrey;}

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
.btns-wrapper {
	display: grid;
	grid-auto-flow: column;
	padding: 16px;
	gap: 24px;
	transform: scale(3);
}

.btn {
	background-color: #fff;
	opacity: 0.7;
	width: 400px;
	height: 62px;
	position: relative;
	border-radius: 18px;
	padding: 2px;
	box-shadow: 4px 2px 16px rgba(136, 165, 191, 0.48), -4px -2px 16px
		#FFFFFF;
	cursor: pointer;
	-webkit-tap-highlight-color: transparent;
}

.inner-wrapper {
	width: 100%;
	height: 100%;
	border-radius: 16px;
	transition: all .2s ease-in-out;
	display: grid;
	place-items: center;
}

i {
	user-select: none;
	transition: all .2s ease-in-out;
	font-size: 32px;
	position: relative;
	color: rgba(201, 215, 230, 0.8);
	text-shadow: 2px 2px 2px #d6e1ef99, 0 0 0 #000, 2px 2px 2px #d6e1ef00;
}

.inner-wrapper:hover {
	box-shadow: inset 3px 3px 7px rgba(136, 165, 191, 0.48), inset -3px -3px
		7px #FFFFFF;
}

i {
	text-shadow: 1px 1px 1px #d6e1ef99, 0 0 0 #000, 1px 1px 1px #d6e1ef00;
}




</style>