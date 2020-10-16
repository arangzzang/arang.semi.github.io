<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.en.event.model.vo.Event,java.util.List,com.en.event.model.service.EventService" %>
<%@include file="/view/common/header.jsp"%>
<%List<Event> list=new EventService().eventList(); 
%>
<section>
<div class="form-container">
	<div><h1>상품등록</h1></div>
	<div class="table-container">
		<form action="<%=request.getContextPath() %>/admin/productInsert" method="post" enctype="multipart/form-data">
			<table class=product-table>
				
				<tr>
					<th>상품명</th>
					<td><input name="pName" class="p" type="text" required></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input name="price" class="p" type="text" required></td>
				</tr>
				<tr>
					<th>상풍종류</th>
					<td>
						<select name="type" style="width:200px; height:30px;">
							<option>비건</option>
							<option>육류</option>
							<option>해산물</option>
							<option>유제품</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이벤트</th>
					<td>
						<select name="event" style="width:200px; height:30px;">
							<option>이벤트선택</option>
							<%for(Event e : list){ %>
							<option value="<%=e.getEventCode()%>"><%=e.getEventName() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				
				<tr>
					<div>
						<th rowspan="2">첨부파일</th>
						<td>
							<span>썸네일</span><input type="file" name="th" required>
						    <span>서브</span><input type="file" name="sub" required>
							<span>img1</span><input type="file" name="img1" required>
							<span>img2</span><input type="file" name="img2" required> 
						</td>
					</div>
				</tr>
				 <tr>
					<div>
						<td>
							<span>img3</span><input type="file" name="img3">
							<span>img4</span><input type="file" name="img4">
							<span>img5</span><input type="file" name="img5">
							<span>img6</span><input type="file" name="img6">
						</td>
					</div>
				</tr> 
				<tr>
					<th colspan="2">상품설명(내용)</th>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<textarea name="content" class="content" style="resize: none;" required></textarea>
					</td>
				</tr>
			</table>
			<div class="btn-container">
				<input type="submit" value="등록하기" style="width:200px; height:50px;">
			</div>
		</form>
	</div>
	
</div>
</section>
<style>
.form-container{
	width:90%;
	margin:auto; 
}
.product-table{
	
	width:100%;
	border-collapse:collapse;

}
.p{
	width:600px;
	height:30px;
	border-radius:10px;
	outline:0;.
	font-size:18px;

}
.content{
	width:600px;
	height:200px;
	font-size:22px;
	font-weight:bold;
}
tr {
	border-bottom: 1px solid lightgray;
}
td{
	padding:8px 0px 8px;
}
th{
 	padding:8px 0px 8px;
}
.btn-container{
	text-align:center;
}

</style>
<%@ include file="/view/common/footer.jsp"%>