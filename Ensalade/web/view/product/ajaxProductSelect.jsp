<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productAll.css">
<%@page import="com.en.product.model.vo.Product,java.util.List,java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productAll.css">
<%
DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
List<Product> list = (List)request.getAttribute("list");
%>

<ul class="clearfix" >
	<div class="menus">
		<%for(Product p : list) {%>
		<li>
	        <div class="total">
	         <!-- 상품 상세 페이지로 가는 서블릿 호출( 쿼리스트링 상품번호) -->
		         <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo() %>">
		            <!-- 상품정보 -->
		            <img class="main-product-img src="<%=request.getContextPath()%><%=p.getProductThumbnail()%>">
		             <p>
						<h5><strong><%=p.getProductName() %></strong></h5>
							<p><%=p.getProductContent() %></p>
						<span class="productInfo"><em><%=formatter.format(p.getProductPrice()) %></em></span>
					</p>
		         </a>
		     </div>
	     </li>
		        <%} %>
	 </div>
</ul>


