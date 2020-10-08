<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.en.product.model.vo.Product,java.text.DecimalFormat" %>    
<%@include file="/view/common/header.jsp"%> 
<% 
	DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
	List<Product> list=(List)request.getAttribute("list");
	
%>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>


    
<section>
   <div class="container">
      <div class="left">
          <nav id="sidebar">
              <ul class="productul">
                 <li><p class="menu" style="cursor:pointer;">전체보기</p></li>
                 <li><p class="menu" style="cursor:pointer;">비건</p></li>
                 <li><p class="menu" style="cursor:pointer;">육류</p></li>
                 <li><p class="menu" style="cursor:pointer;">해산물</p></li>
                 <li><p class="menu" style="cursor:pointer;">유제품</p></li>
              </ul>
            </nav>
        </div>
      
      
      <div class="right">
          <h1>ENSALAD</h1>
                <div><span>전체보기</span><span>비건</span><span>해산물</span> <sapn>육류</sapn> <sapn>유제품</sapn></div>
                <hr>
		<div class="menus">
			<%for(Product p : list) {%>
	         <div class="total">
	         <!-- 상품 상세 페이지로 가는 서블릿 호출( 쿼리스트링 상품번호) -->
		         <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo() %>">
		            <!-- 상품정보 -->
		            <img src="<%=request.getContextPath()%>/image/salad1.jpg">
		            <p><%=p.getProductName() %></p>
		            <p><%=formatter.format(p.getProductPrice()) %> 원</p><!-- 숫자3자리마다 ,표시 -->
		            <p><%=p.getProductContent() %> </p>
		         </a>
	         </div>
	         <%} %>
		</div>
      </div>
   </div>
   <div id="test"></div>
</section>
    <style>
        #test{
            height: 5000px;
        }
    	.total>a>p{
    		font-size : 10px;
    	}
        .total{
          display:inline-block;
          margin : 30px;
          width : 200px;
       } 
         ul{
          list-style: none;
       }
       
        span{
            margin: 5px;
        }
        .container{
              
            display: flex;
        }
        .right{
            border: 3px green solid;
            width: 100%;
            
        }
        .left{
           position : relative;
            width: 200px;
            border: 3px red solid;
            
        }
          #sidebar{
                      left : 30px;
                    height: 200px;
                    width: 200px;
                    position: absolute;
                }
    </style>
    
    <script>
      //사이드바 스크롤바
      $(document).ready(function(){
          $("#sidebar").scrollFollow({
              speed : 500,    // 꿈지럭 거리는 속도
              offset : 200     // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
          });
      });
      //사이드바 클릭 이벤트
      $(".menu").click(e=>{
    	  
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