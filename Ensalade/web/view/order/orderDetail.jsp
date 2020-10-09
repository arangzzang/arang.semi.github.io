<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp" %>
<%@page import="com.en.product.model.vo.Product,java.util.List" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<section>
<h1>주문 상품 정보</h1>
<table>
	<tr>
		<th>주문일자</th>
		<th>이미지</th>
		<th>상품정보</th>
		<th>수량</th>
		<th>상품구매금액</th>
		<th>주문처리상태</th>
		<th>취소/교환/반품</th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
</section>
<%@include file="/view/common/footer.jsp" %>