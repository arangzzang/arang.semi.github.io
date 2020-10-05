<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.en.product.model.vo.Product,java.util.List" %>

<%@include file="/view/common/header.jsp"%>

<%Product p = (Product)request.getAttribute("selectProduct");//서블렛에 있는 키값으로 불러와야함.
List<Product> list = (List)request.getAttribute("relateProduct");
%>

<!-- Swiper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">

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
                <div>
                    <h2><%=p.getProductName() %></h2>
                    
                    <p><%=p.getProductContent() %></p>
                    
                </div>
                <div class="su-form" >
                             <form class="count" name="form" method="get">
                         <p id="price">상품금액: <%=p.getProductPrice()%>원</p>
                        수량 : <input class="su" type="button" value=" - " onclick="del();"> 
                        <input type="text" id="amount" value="1" size="10" name="su">
                        <input class="su" type="button" value=" + " onclick="add();"><br>
                        최종금액 :  <p id=sum></p>
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

    <hr>
    <!-- 상품 상세 이미지 -->
    <div class="detail-product-img">
        <p>여긴 이미지가 들어갈 내용</p>
    </div>
	<div class="review-go">
		<span>후기를 작성해보세요!</span>
		<button>후기 쓰러가기</button>
	</div >
		<h3>사진 모아보기</h3>
		<div class="review-img">
			<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
			<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
			<hr>
		</div>
	<div>
	
	</div>
</section>

<style>
	
	hr{
	 margin : 50px;
	}
    /* 세션 */
    .thisproduct{
        /* 헤더와 풋터 간격 */
        margin : 50px 50px;
    }

    /* 상품 썸네일 / 정보 부모창 */
    .infromation-parent{
        display:table;
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
    .btn{
        
    }
    /* 장바구니 */
    .jangbtn{
        border:3px green solid;
        background-color: white;
        width: 200px;
        height: 50px;
        margin-left: 30px;
        
        
    }
    /* 주문하기 */
    .orderbtn{
        border:3px green solid;
        background-color: green;
        width: 200px;
        height: 50px;
        margin-left: 30px;
        
    }
    /* 관련상품 */
    .relate{
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
    .swiper-slide>ul{display:flex;}
    .swiper-slide>ul>li{list-style:none;}
    .swiper-slide>ul>li>a>.product-img{width:200px; height:230px; background-color:red;}

    
    
    
    /* 상품 상세 이미지 */
    .detail-product-img{
        border: 1px tomato solid;
        display: table;
        margin: 20px auto;
        width: 800px;
        height: 3000px;
    }

  
</style>



  <script >
  		function moveorder(){
  			
  			var su=$("#amount").val();
  			<%if(loginMember==null){
  			String loc="/order/productOrder";
  			%>
  				location.assign('<%=request.getContextPath()%>/view/login.jsp?productNo=<%=p.getProductNo()%>&loc=<%=loc%>&su='+su);
  			<%}else{%>
  				location.assign('<%=request.getContextPath()%>/order/productOrder?productNo=<%=p.getProductNo()%>&su='+su);
  		<%}%>
  			
  			
  		}
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
        var swiper = new Swiper('.swiper-container', {
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
   });

        
       
        </script> 

<%@include file="/view/common/footer.jsp"%>