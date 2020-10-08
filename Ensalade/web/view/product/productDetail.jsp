<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.en.product.model.vo.Product,java.util.List" %>

<%@include file="/view/common/header.jsp"%>

<%
	Product p = (Product)request.getAttribute("selectProduct");//서블렛에 있는 키값으로 불러와야함.
	List<Product> list = (List)request.getAttribute("relateProduct");
%>
<!-- Swiper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productDetail.css">

<section class="thisproduct" >
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
            	<div class="productintro">
	                <div class="content">
	                    <h2><%=p.getProductName() %></h2>
	                    <p><%=p.getProductContent() %></p>
	                </div>
	                <div class="su-form" >
	                   <form class="count" name="form" method="get">
	                        <p id="price">상품금액: <%=p.getProductPrice()%>원</p>
	                        수량 : <input type="text" id="amount" value="1" size="3" name="su" >
	                        <button class="su1" type="button" onclick="del();">-</button>
	                        <button class="su2" type="button" onclick="add();">+</button><br>
	                        금액 :  <label id=sum></label>
	                   </form>
	                </div>
                </div>
                <div class="btn">
                <hr>
                   <button class="jangbtn" onclick="movecart()">장바구니 담기</button>
                   <button class="orderbtn" onclick="moveorder()">주문하기</button>
                </div>
            </div>
        </div>
    </div>
   <!-- 관련상품 -->
   <div class="relate">
        <div class="swiper-container">
            <div class="swiper-wrapper">
               <%for(int i=0;i < Math.ceil(list.size()/4);i++){ %>
              <div class="swiper-slide">
                <ul>
                <%for(int j=i*4;j<(i+1)*4;j++){%>
                   <li>
	                  <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo()%>">
		                  <img alt="" src="<%=list.get(i).getProductThumbnail() %>" class="product-img">
		                  <p><%=list.get(i).getProductName() %></p>
		                  <p><%=list.get(i).getProductPrice() %></p> 
	                  </a>
	               </li>
            	<%} %>
	            </ul>
	          </div>
	            <%} %>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    <!-- 상품 상세 이미지 -->
    <div id="infobtns">
    	<div id="infobtns-ch">
<!--     		<div class="infos-ch2"> -->
	    		<button onclick="move('1')" class="infobtn">상품 정보</button>
<!-- 	    	</div> -->
<!-- 	    	<div class="infos-ch2"> -->
		    	<button onclick="move('2')" class="infobtn">후기 보기</button>
<!-- 		    </div> -->
<!-- 		    <div class="infos-ch2"> -->
		    	<button onclick="move('3')" class="infobtn">사진 모아 보기</button>
<!-- 		    </div> -->
	    </div>
	    <div class="detail-product-img">
	    	<div id="infobtn1"><!-- 이동 1 -->
	    		<img alt="" src="<%=request.getContextPath()%>/image/product/common/common.jpg">
	    		<img alt="" src="<%=request.getContextPath()%>/image/product/common/common1.jpg">
	    		<img alt="" src="<%=request.getContextPath()%>/image/product/common/common2.jpg">
	    		<img alt="" src="<%=request.getContextPath()%>/image/product/common/common3.jpg">
	    		<img alt="" src="<%=request.getContextPath()%>/image/product/common/common4.jpg">
	        </div>
	    </div>
		<div class="review-go">
			<div id="infobtn2"><!-- 이동 2 -->
				<span>후기를 작성해보세요!</span>
				<button>후기 쓰러가기</button>
			</div>
		</div >
		<h3>사진 모아보기</h3>
		<div class="review-img">
			<div id="infobtn3"><!-- 이동 3 -->
				<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
				<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
				<hr>
			</div>
		</div>
	</div>
</section>




  <script >
  		//주문하기이동
  		function moveorder(){
  			var su=$("#amount").val();
  			<%if(loginMember==null){
  				String loc="/order/productOrder";%>
  				location.assign('<%=request.getContextPath()%>/view/login.jsp?productNo=<%=p.getProductNo()%>&loc=<%=loc%>&su='+su);
  			<%}else{%>
  				location.assign('<%=request.getContextPath()%>/order/productOrder?productNo=<%=p.getProductNo()%>&amount='+su);
  		<%}%>
  		}
  		//장바구니이동
  		function movecart(){
  			var su=$("#amount").val();
  			location.assign('<%=request.getContextPath() %>/basket/inBasket?productNo=<%=p.getProductNo() %>&su='+su);
  		}
        // 수량/가격 기능 script 구문
        var price = <%=p.getProductPrice()%>;
        var amount;
        onload=function(){
   			document.getElementById("sum").textContent = price+"원";
   		}
        //사용자가 수량 직접 입력시 -> 문자입력 X 경고창 첫글자 0X
        $("#amount").keyup(function(){
        	var sum = document.getElementById("sum");
        	var hm = document.getElementById("amount");
        	if(hm.value=this.value.replace(/[^0-9]/g, '')){
        		sum.textContent = parseInt(hm.value)*price+"원";
        	}else if(hm.value==0||hm.value.chatAt(0)==0){
        		alert("0이상의 숫자만 입력해주세요.")
        		hm.value=1;
        	}
        });
        //수량 값을 0을 보낼수 없음
        $("#amount").keyup(e=>{
            let a=$(e.target).val();
            var sum = document.getElementById("sum");
            if(a==0){
               $("#amount").val(1);
            }
         });
//         if(hm.value==0||hm.value.chatAt(0)==0){
//     		alert("0이상의 숫자만 입력해주세요.")
// 			hm.value=1;        		
//     	}
//     	else{
//     		sum.textContent = parseInt(hm.value)*price+"원";
//     	}
        //수량 버튼 클릭시 태그 색변경
        $("#amount").focus(e=>{
        	$(e.target).css("outline-color","#27b06e");
    	})
      //수량추가 하는 함수
        function add() {
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            hm.value++;
        
            sum.textContent = parseInt(hm.value) * price+"원";
        }
      //수량감소 하는 함수
        function del() {
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            if (hm.value > 1) {
                hm.value--;
                sum.textContent = parseInt(hm.value) * price+"원";
            }
        }
        //상품 정보,배송 정보, 상품 후기
        function move(seq){
        	var offset = $("#infobtn" + seq).offset();
            $('html, body').animate({scrollTop : offset.top}, 400);
        }
        //버튼 클릭시 색상 변경하고 다른 버튼들은 원래 색상
        var infosch2 = document.getElementsByClassName("infos-ch2");

        for (var i = 0; i < infosch2.length; i++) {
        	infosch2[i].addEventListener('click', function(){
            for (var j = 0; j < infosch2.length; j++) {
            	infosch2[j].style.color = "black";
            }
            this.style.color = "gold";
          })
        }
        //스크롤 내릴시 css(sticky) 설정
//         window.onscroll = function(){scrollsticky()};
//         let infobtns = doucument.getElementById("infobtns-ch");
//         let sticbar = infobtns.offsetTop;
// 		function scrollsticky(){
// 			if (window.pageYOffset >= sticbar) {
// 				infobtns.classList.add("sticbar")
// 			  } else {
// 				  infobtns.classList.remove("sticbar");
// 			  }
// 		}
        
        //스와이퍼
        var swiper = new Swiper('.swiper-container', {
	    spaceBetween: 30,
	    centeredSlides: true,
	    autoplay: {
       	delay: 2500,
       	disableOnInteraction: false,
     	},
     	agination: {
       	el: '.swiper-pagination',
       	clickable: true,
     	},
     	navigation: {
       	nextEl: '.swiper-button-next',
       	prevEl: '.swiper-button-prev',
	   		},		
	   	});

        
       
        </script> 

<%@include file="/view/common/footer.jsp"%>