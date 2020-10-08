<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.en.product.model.vo.Product,java.util.List" %>
<%List<Product> list = (List)request.getAttribute("list");%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productAll.css">
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