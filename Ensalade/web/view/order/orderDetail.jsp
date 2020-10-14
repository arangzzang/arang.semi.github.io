<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp" %>
<%@page import="com.en.order.model.vo.Order,java.util.List,java.util.List,java.text.DecimalFormat" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<%
DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
List<Order> list=(List)request.getAttribute("list"); %>
<section>
<div>
	<div class="orderHeader">
        <h1 class="orderTitle">주문 상품 정보</h1>
        <ul class="orderState">
        	<li class="order1">01 장바구니</li>
        	<li class="order2">02 주문서</li>
        	<li class="order3">03 주문완료</li>
        </ul>
        </div>
        <hr class="line">
	<table class="orderTable">
		<thead>
			<tr>
				<th>주문일자</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매금액</th>
				<th>배송비<th>
				<th>주문처리상태</th>
				
			</tr>
		</thead>
		<tbody>
		<%for(int i=0;i<list.size();i++){ %>
			<tr>
				<td><%=list.get(i).getOrderDate() %></td>
				<td><img src="<%=request.getContextPath()+list.get(i).getProductThumbnail() %>"></td>
				<td>
				<p><%=list.get(i).getProductName() %></p>
				<p><%=list.get(i).getProductContent() %></p>
				</td>
				<td><%=list.get(i).getOrderMount() %></td>
				<td><i class="price"><%=formatter.format(list.get(i).getOrderMount()*(list.get(i).getProductPrice()-(list.get(i).getProductPrice()*list.get(i).getSalePer()/100))) %></i>원</td>
				<%if(i==0){%>
				<td rowspan="4"><i class="ba"><%=formatter.format(list.get(i).getDelivery()) %></i>원</td>
				 <%-- <%}else{%>
				<td></td>  --%>
				<% }%>
				<td><%=list.get(i).getOrderStatus() %></td>
			</tr>
			<%} %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7">
				 총 구매금액 : <i class="total"><%=formatter.format(list.get(0).getTotalPrice()) %> </i>원
				</td>
			</tr>
		</tfoot>
	</table>
</div>
<style>
	img{
	width:100px;
	height:100px;
	}
	.orderTable{
	width:90%;
	margin: auto;
	text-align:center;
	}
	 td{
	border-bottom: lightgray 1px solid;
	padding:20px;	
	} 
	.line{
        	margin-top:0px;
        	margin-bottom:15px;
        	border-color:lightgray;
        	background-color:lightgray;
        	color:lightgray;
        	opacity: 0.2;
        	}
    .order3{
        		background-color:green;
        		color:white;
        	}
        	.orderHeader{
        		display:flex;
        		justify-content: space-between;
        	}
        	.orderState{
        		margin-right:120px;
        		display:flex;
        		list-style:none;
        	}
        	.orderState>li{
        	border:lightgray 1px solid;
        	border-radius:10px;
        	padding: 10px 15px 11px 15px;
        	font-weight: bold;
        	text-align: center;
        	}
        	.orderTitle{
        	margin-left:120px;
        	margin-bottom:10px;
        	}
        	.ba,.price,.total{
        	  font-size: 20px;
		    font-weight: bold;
		    font-style: normal;
        	}
</style>

</section>
<%@include file="/view/common/footer.jsp" %>