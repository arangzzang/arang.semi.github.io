<%@page import="com.en.product.model.vo.ProductComment"%>
<%@page import="com.en.product.model.vo.ProductReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.en.product.model.vo.Product,java.util.List"%>
<%@include file="/view/common/header.jsp"%>

<%
	//상품
	Product p = (Product) request.getAttribute("selectProduct");//서블렛에 있는 키값으로 불러와야함.
	
	String pages =(String) request.getParameter("cPage");
	System.out.println(pages);
	List<Product> list = (List) request.getAttribute("relateProduct");
	//상품리뷰 리스트
	List<ProductReview> reviewList = (List) request.getAttribute("reviewList");
	
	int productRef = 0;
	
	String msg = request.getParameter("msg");
	
	if (msg != null) {
		productRef = Integer.parseInt(request.getParameter("productRef"));
	} ;
	//페이징바
	String pageBar = (String) request.getAttribute("pageBar");
	//댓글 리스트
	List<ProductComment> commentList = (List) request.getAttribute("commentList");
%>

<!-- Swiper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">

<section class="thisproduct">
	<!-- 상품 썸네일 이미지/ 상품 정보 부모창-->
	<div class="infromation-parent">
		<!-- 상품 썸네일 이미지/ 상품정보 자식창  -->
		<div class="information">
			<!-- 상품 썸네일 이미지 -->
			<div class="img">
				<img src="" alt="">
			</div>
			<!-- 상품 정보 -->
			<div class="productinformation">
				<div>
					<h2><%=p.getProductName()%></h2>

					<p><%=p.getProductContent()%></p>

				</div>
				<div class="su-form">
					<form class="count" name="form" method="get">
						<p id="price">
							상품금액:
							<%=p.getProductPrice()%>원
						</p>
						수량 : <input class="su" type="button" value=" - " onclick="del();">
						<input type="text" id="amount" value="1" size="10" name="su">
						<input class="su" type="button" value=" + " onclick="add();"><br>
						최종금액 :
						<p id=sum></p>
					</form>
				</div>
				<hr>
				<div class="btn">
					<button class="jangbtn" onclick="movecart()">장바구니 담기</button>
					<button class="orderbtn" onclick="moveorder()">주문하기</button>
				</div>
			</div>

		</div>
	</div>
	<hr>
	<!-- 관련상품 -->

	<div class="relate">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<%
					for (int i = 0; i < Math.ceil(list.size() / 4); i++) {
				%>
				<div class="swiper-slide">
					<ul>
						<%
							for (int j = i * 4; j < (i + 1) * 4; j++) {
						%>

						<li><a
							href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo()%>">

								<img alt="" src="<%=list.get(i).getProductThumbnail()%>"
								class="product-img">
								<p><%=list.get(i).getProductName()%></p>
								<p><%=list.get(i).getProductPrice()%></p>
						</a></li>

						<%
							}
						%>
					</ul>
				</div>
				<%
					}
				%>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>

	<hr>
	<!-- 상품 상세 이미지 -->
	<div class="detail-product-img">
		<p>여긴 이미지가 들어갈 내용</p>
	</div>
	<div class="review-go">
		<span>후기를 작성해보세요!</span>
		<button type="button"
			onclick="location.assign('<%=request.getContextPath()%><%=loginMember != null
					? "/view/product/productWrite.jsp?productNo=" + p.getProductNo()
					: "/view/login.jsp"%>')">후기
			쓰러가기</button>
	</div>
	<h3>사진 모아보기</h3>
	<div class="review-img">
		<img src="<%=request.getContextPath()%>/image/product/salad1.jpg">
		<img src="<%=request.getContextPath()%>/image/product/salad1.jpg">
		<span id="scroll"></span>
		<hr>
	</div>
	<div>
		<style type="text/css">
.swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
  
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
       display: flex; 
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

.swiper-slide img {
	width:200px;
	height:200px;
	background-repeat: no-repeat;
    /* background-position: 50% 50%; */
    background-size: cover;
}
.swiper-wrapper {
	width:200px;
	height:200px;
}
    @media (max-width: 760px) {
      .swiper-button-next {
        right: 20px;
        transform: rotate(90deg);
      }

      .swiper-button-prev {
        left: 20px;
        transform: rotate(90deg);
      }
    }
</style>

		<!-- 클래스명은 변경하면 안 됨 -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
			<%for(ProductReview prs:reviewList ){ %>
				<div class="swiper-slide"><img  style="background-image: url('<%=request.getContextPath() %><%=prs.getFilepath() %>')"></div>
			<%} %>
			
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		
		<!-- Swiper JS -->
		<script src="../package/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 5,
      spaceBetween: 3,
      slidesPerGroup: 5,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        resize: function () {
          swiper.changeDirection(getDirection());
        }
      }
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

      return direction;
    }
  </script>
 
	</div>
	<%
		for (ProductReview pr : reviewList) {
	%>
	<div>
		<div id="puoduct_list">
			<div class="puoduct_slide">
				<table id="tavle_Table">

					<tbody id="tavle_Puoduct" class="puoduct_slidew2">

						<tr>
							<td class="tableTd"><%=pr.getReviewtNo()%></td>

							<td class="tableTd_2"><%=pr.getReviewWriter()%></td>
							<td class="tableTd_3"><%=pr.getReviewTitle()%> <img
								class="puduct_size"
								src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_attach2.gif">
								<span class="img_span"
								style="position: absolute; display: none;"> <img
									src="<%=request.getContextPath()%><%=pr.getFilepath()%>"
									height="80">
							</span></td>
							<td class="tableTd_4"><%=pr.getReviewWriteDate()%></td>
							<td id="tableTD_5" class="tableTd_5"></td>

						</tr>


					</tbody>
				</table>

			</div>
			<div id="puoduct_list_content" class="puoduct_list_content2">

				<span class="like"> <input type="hidden"
					value="<%=pr.getReviewtNo()%>"> <svg class="a3"
						aria-hidden="true" focusable="false" data-prefix="far"
						data-icon="heart" class="svg-inline--fa fa-heart fa-w-16"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
						
						<path fill="currentColor"
							d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg></span>
				<p class="m1"><%=pr.getReviewViews()%></p>

				<p><%=pr.getReviewContent()%></p>
				<img src="<%=request.getContextPath()%><%=pr.getFilepath()%>">
				<div id="comment-container">
					<div class="comment-editor">
						<%
						 if(loginMember!=null && loginMember.getMemberId().equals("admin")) { 
						%>
						<form action="<%=request.getContextPath()%>/product/productReview"
							method="post" id="form1">
							<input type="hidden" name="productCommentLevel" value="1">
							<input type="hidden" name="productCommentWriter"
								value="<%=loginMember != null ? loginMember.getMemberId() : ""%>">
							<input type="hidden" name="productRef"
								value="<%=pr.getReviewtNo()%>"> <input type="hidden"
								name="productNo" value="<%=p.getProductNo()%>"> <input
								type="hidden" name="productCommentRef" value="0">
							<textarea name="productCommentContent" cols="55" rows="3"></textarea>
							<input type="submit" value="등록">
						</form>
						<%
							}
						%>
					</div>
				</div>

				<table id="tbl-comment">
					<%
						for (ProductComment pc : commentList) {
								if (pc.getProductCommentLevel() == 1 && pc.getProductRef() == pr.getReviewtNo()) {
					%>
					<tr class="level1">
						<td><sub class="comment-writer"><%=pc.getProductCommentWriter()%></sub>
							<sub class="comment-date"><%=pc.getProductCommentDate()%></sub> <br>
							<%=pc.getProductCommentContent()%></td>
						<td>
							<button class="btn-reply" id="<%=pr.getReviewtNo()%>"
								value="<%=pc.getProductCommentNo()%>">답글</button>
						</td>
					</tr>
					<%
						} else if (pc.getProductCommentLevel() == 2 && pc.getProductRef() == pr.getReviewtNo()) {
					%>
					<tr class="level2">
						<td><sub><%=pc.getProductCommentWriter()%></sub> <sub><%=pc.getProductCommentDate()%></sub>
							<br> <%=pc.getProductCommentContent()%></td>
						<td>
							<%-- <button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button> --%>
						</td>
					</tr>

					<%
						}
					%>
					<%
						}
					%>
				</table>

			</div>
			<%
				}
			%>


			<div id="pagebar"><%=pageBar%></div>
		</div>
	</div>
	</div>
</section>

<style>
.a3 {
	width: 5px;
	height: 5px;
}

hr {
	margin: 50px;
}
/* 세션 */
.thisproduct {
	/* 헤더와 풋터 간격 */
	margin: 50px 50px;
}

/* 상품 썸네일 / 정보 부모창 */
.infromation-parent {
	display: table;
	margin: auto;
}
/* 상품 썸네일 이미지/ 상품정보 자식창 */
.information {
	display: flex;
	margin-bottom: 20px;
}
/* 썸네일 이미지 */
.img {
	width: 500px;
	height: 400px;
	border: 1px red solid;
}
/* 상품 정보 창 */
.productinformation {
	width: 500px;
	height: 400px;
	border: 1px blue solid;
}
/* 주문하기 / 장바구니 버튼 */
.btn {
	
}
/* 장바구니 */
.jangbtn {
	border: 3px green solid;
	background-color: white;
	width: 200px;
	height: 50px;
	margin-left: 30px;
}
/* 주문하기 */
.orderbtn {
	border: 3px green solid;
	background-color: green;
	width: 200px;
	height: 50px;
	margin-left: 30px;
}
/* 관련상품 */
.relate {
	position: relative;
	height: 400px;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide>ul {
	display: flex;
}

.swiper-slide>ul>li {
	list-style: none;
}

.swiper-slide>ul>li>a>.product-img {
	width: 200px;
	height: 230px;
	background-color: red;
}

/* 상품 상세 이미지 */
.detail-product-img {
	border: 1px tomato solid;
	display: table;
	margin: 20px auto;
	width: 800px;
	height: 3000px;
}

div#puoduct_list {
	width: 100%;
}

div#puoduct_list_content {
	display: none;
	height: auto;
}

table#tavle_Table {
	position: relative;
	left: 100px;
}

img#puduct_size {
	width: 11px;
	height: 14px;
	vertical-align: middle;
	margin: 0 1px;
}

td {
	padding: 14px 3px 13px;
	border-bottom: 1px solid #e3e3e3;
}

td.tableTd, .tableTd_2 {
	width: 100px;
	text-align: center;
}

td.tableTd_3 {
	width: 700px;
	text-align: left;
}

table#tbl-comment {
	width: 580px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
}

table#tbl-comment tr td {
	border-bottom: 1px solid;
	border-top: 1px solid;
	padding: 5px;
	text-align: left;
	line-height: 120%;
}

table#tbl-comment tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

table#tbl-comment tr td:last-of-type {
	text-align: right;
	width: 100px;
}

table#tbl-comment button.btn-reply {
	display: none;
}

table#tbl-comment button.btn-delete {
	display: none;
}

table#tbl-comment tr:hover {
	background: lightgray;
}

table#tbl-comment tr:hover button.btn-reply {
	display: inline;
}

table#tbl-comment tr:hover button.btn-delete {
	display: inline;
}

table#tbl-comment tr.level2 {
	color: gray;
	font-size: 14px;
}

table#tbl-comment sub.comment-writer {
	color: navy;
	font-size: 14px
}

table#tbl-comment sub.comment-date {
	color: tomato;
	font-size: 10px
}

table#tbl-comment tr.level2 td:first-of-type {
	padding-left: 100px;
}

table#tbl-comment tr.level2 sub.comment-writer {
	color: #8e8eff;
	font-size: 14px
}

table#tbl-comment tr.level2 sub.comment-date {
	color: #ff9c8a;
	font-size: 10px
}
/*답글관련*/
table#tbl-comment textarea {
	margin: 4px 0 0 0;
}

table#tbl-comment button.btn-insert2 {
	width: 60px;
	height: 23px;
	color: white;
	background: #3300ff;
	position: relative;
	top: -5px;
	left: 10px;
}
</style>



<script type="text/javascript">
  
  
  		function moveorder(){
  			
  			var su=$("#amount").val();
  			<%if (loginMember == null) {
				String loc = "/order/productOrder";%>
  				location.assign('<%=request.getContextPath()%>/view/login.jsp?productNo=<%=p.getProductNo()%>&loc=<%=loc%>&su='+su);
  			<%} else {%>
  				location.assign('<%=request.getContextPath()%>/order/productOrder?productNo=<%=p.getProductNo()%>&amount='+su);
  		<%}%>
  			
  			
  		}
  		function movecart(){
  			var su=$("#amount").val();
  			location.assign('<%=request.getContextPath()%>/basket/inBasket?productNo=<%=p.getProductNo()%>&su='+su);
  		}
        // 수량/가격 기능 script 구문
        var price = <%=p.getProductPrice()%>;
        var amount;
        onload=function(){
        		document.getElementById("sum").textContent = price+"원";
        		
        		}
            
        
        function add() {//수량추가 하는 함수
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            hm.value++;
        
            sum.textContent = parseInt(hm.value) * price+"원";
        }
        
        function del() {//수량감소 하는 함수
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            if (hm.value > 1) {
                hm.value--;
                sum.textContent = parseInt(hm.value) * price+"원";
            }
        }
        //스와이퍼
   /*      var swiper = new Swiper('.swiper-container', {
     spaceBetween: 30,
     centeredSlides: true,
     autoplay: {
       delay: 2500,
       disableOnInteraction: false,
     },
     pagination: {
       el: '.swiper-pagination',
       clickable: true,
     },
     navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
     },
   }); */
        $(function() {
        	$(".puoduct_slide").click(function() {
        		$(".puoduct_list_content2").css("display","none");
        		$(this).next().slideToggle(500);
        		
        	});
        	
        });
        $(".puduct_size").hover(e=> {
    		$(e.target).next().css("display","inline-block");
    		}, function(){
    		  $(".img_span").not(this).css("display","none");
    		}); 

    	$(".btn-reply").click(e=>{
    	<%if (loginMember != null) {%>
    	
    	
    		let tr=$("<tr>");
    		let form=$("#form1").clone();
    		form.find("textarea").attr("rows","1");
    		form.find("[name=productCommentLevel]").val("2");
    		form.find("[name=productCommentRef]").val(e.target.value);
    		form.find("[name=productRef]").val(e.target.id);
    		form.find("[type=submit]").addClass("btn-insert2");
    		let td=$("<td>").attr("colspan","2");
    		console.log(form);
    		td.append(form);
    		tr.append(td);
    		tr.find("td").css("display","none");
    		$(e.target).parents("tr").after(tr.children("td").slideDown(800));
    		$(e.target).off("click");//클릭이벤트제거하기
    		
    		
    	
    	<%}%>
    	
    });
    	$(function(){
    		<%if (productRef != 0||pages!=null) {%>
    		
    		
    		/* var location= $("#scroll").offset(); */
    		console.log(location);
    		window.scrollTo({left: 85.3046875 , top: 4339.59375, behavior:'auto'});
    		
    		for(var i=0;i<$(".tableTd").length;i++){
    		
    			if(<%=productRef%>==$(".tableTd")[i].textContent){
    			
    			$(".puoduct_slide")[i].click();
    			};};
    			
    			<%}%>
    		});
    	
    	$(".like").click(e=>{
   		 $.ajax({
   			url:"<%=request.getContextPath()%>/Produnt/ProduntLikeCountServlet",
   			data:{"like_count":$(e.target).parent().parent().prev().children().children().children().children().first().text(),"userId":"<%=loginMember != null ? loginMember.getMemberId() : ""%>"},
   			dataType:"html",
   			type:"post",
   			success:data=>{
   				
   				$(e.target).parent().next().html(data);
   			}
   			
   		})
   		              console.log($(e.target).parent().parent().prev().children().children().children().children().first().text());
   	})
    			
    			
       
        </script>

<%-- <%@include file="/view/common/footer.jsp"%> --%>