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
		<%for(Product p : list) {
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getProductThumbnail());
		}
		%>
		<li>
	        <div class="total">
	         <!-- 상품 상세 페이지로 가는 서블릿 호출( 쿼리스트링 상품번호) -->
		         <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo() %>">
		            <!-- 상품정보 -->
		            <img class="main-product-img "src="<%=request.getContextPath()%><%=p.getProductThumbnail()%>">
		             <p>
						<h5><strong><%=p.getProductName() %></strong></h5>
							<p><%=p.getProductContent() %></p>
						<!-- 할인 적용 로직  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
					          <%if(p.getSalePer()!=0){ %>
					         
					            <span class="productInfo"><em><%=formatter.format(p.getProductPrice()-(p.getProductPrice()*p.getSalePer()/100)) %></em>원</span>
				            	<span class="productInfoin"><em><s><%=formatter.format(p.getProductPrice()) %>원</s></em></span>
				            	<% }else {%>
				            	 <span class="productInfoin2"><em><%=formatter.format(p.getProductPrice()) %>원</em></span>
				            	<%} %>
					</p>
		         </a>
		     </div>
	     </li>
		        <%} %>
	 </div>
</ul>


