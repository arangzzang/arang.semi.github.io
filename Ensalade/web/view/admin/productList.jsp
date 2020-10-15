<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.en.product.model.vo.Product,java.util.List,com.en.product.model.service.ProductService" %>
 <%@include file="/view/common/header.jsp"%>
 <%List<Product> list=new ProductService().selectProductAll(); %>
 <section>
 <div class="container">
 	<div class=btn-container>
 	<button onclick="insert()"id="insert">상품 등록</button>
 	<button onclick="update()"id="update">상품 수정 및 삭제</button>
 	</div>
 	<table>
 		<tr>
 			<th>상품이름</th>
 			<th>상품가격</th>
 			<th>상품타입</th>
 			<th width=40%;>상품내용</th>
 			<th width=10%;>썸네임</th>
 			<th width=10%;>서브이미지</th>
 		</tr>
 		<%for(Product p : list){ %>
 		<tr>
 			<td><%=p.getProductName() %></td>
 			<td><%=p.getProductPrice() %></td>
 			<td><%=p.getProductType() %></td>
 			<td><%=p.getProductContent() %></td>
 			<td><img class="pImg" src="<%=request.getContextPath()%><%=p.getProductThumbnail()%>"></td>
 			<td><img class="pImg" src="<%=request.getContextPath()%><%=p.getProductSubimg()%>"></td>
 		</tr>
 		<%} %>
 	</table>
 </div>
 </section>
 <style>
 	td{
 	border:solid 1px black;
 	width:70px;
 	height:50px;
 	}
 	table{
 	width:90%;
 	margin:auto;
 	text-align:center;
 	}
 	.pImg{
 		width:70px;
 		height:30px;
 	}
 	#insert,#update{
 		width:200px;
 		height:50px;
 	}
 	.btn-container{
 		margin-top:10px;
 		text-align:center;
 	}
 </style>
 <script>
 	function update(){
 		location.assign('<%=request.getContextPath()%>/view/admin/productUpdate.jsp');
 	}
 	function insert(){
 		location.assign('<%=request.getContextPath()%>/view/admin/productInsert.jsp');
 	}
 </script>
 <%@include file="/view/common/footer2.jsp"%>