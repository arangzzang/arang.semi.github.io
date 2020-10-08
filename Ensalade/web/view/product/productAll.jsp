<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.en.product.model.vo.Product" %>    
<%@include file="/view/common/header.jsp"%> 
<%
	List<Product> list=(List)request.getAttribute("list");
%>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productAll.css">

    
<section>
   <div class="container">
      <div class="left">
         <nav id="sidebar">
             <ul class="productul">
                <li><strong><p class="menu" style="cursor:pointer;">전체보기</p></strong></li>
                <li><strong><p class="menu" style="cursor:pointer;">비건</p></strong></li>
                <li><strong><p class="menu" style="cursor:pointer;">육류</p></strong></li>
                <li><strong><p class="menu" style="cursor:pointer;">해산물</p></strong></li>
                <li><strong><p class="menu" style="cursor:pointer;">유제품</p></strong></li>
             </ul>
          </nav>
   	  </div>
      <div class="right">
        <h1>ENSALAD</h1>
        <hr>
        <ul class="clearfix" >
			<div class="menus">
				<%for(Product p : list) {%>
				<li>
			         <div class="total">
			         <!-- 상품 상세 페이지로 가는 서블릿 호출( 쿼리스트링 상품번호) -->
				         <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo() %>">
				            <!-- 상품정보 -->
				            <img src="<%=request.getContextPath()%>/image/salad1.jpg">
				            <p>
					            <h5><strong><%=p.getProductName() %></strong></h5>
					            <p><%=p.getProductContent() %></p>
					            <span class="productInfo"><em><%=p.getProductPrice() %></em></span>
				            </p>
				         </a>
			         </div>
		         </li>
		         <%} %>
			</div>
		</ul>
      </div>
      <div id="sort"></div>
   </div>
   <div id="test"></div>
</section>
    
    
    <script>
      //사이드바 스크롤바
      $(document).ready(function(){
          $("#sidebar").scrollFollow({
              speed : 500,    // 꿈지럭 거리는 속도
              offset : 200     // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
          });
      });
      //사이드바 클릭 이벤트
      $(".menu").click(e=>{<!-- ajax로 상품종류를 분류하여 덮어씌움 -->
    	  $.ajax({
    		  url:"<%=request.getContextPath()%>/ajax/selectType",
    		   data:{"type":e.target.textContent},
    		  success:function(data){
    			  $(".menus").html(data);
    			  
    		  }
    	  });
      });
	</script>
    
<%@include file="/view/common/footer.jsp"%>