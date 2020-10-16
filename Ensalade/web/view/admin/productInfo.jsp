<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.en.product.model.vo.Product,java.util.List,com.en.product.model.service.ProductService" %>
 <%@page import="com.en.event.model.vo.Event,java.util.List,com.en.event.model.service.EventService" %>
 <%
 List<Product> list=new ProductService().selectProductAll(); 
 String pName=request.getParameter("product");
 List<Event> eList=new EventService().eventList(); 
 
 Product select=null;
for(Product p : list){
	if(p.getProductName().equals(pName)){
		 select=p; 
	}
}

  %>
					<tr>
						<th>상품명</th>
						<td><input id="pName"name="pName" class="p" type="text" value="<%=select.getProductName() %>"required></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input name="price" class="p" type="text" value="<%=select.getProductPrice() %>" required></td>
					</tr>
					<tr>
						<th>상풍종류</th>
						<td>
							<select name="type" style="width:200px; height:30px;">
								<option class="t" value="비건">비건</option>
								<option class="t" value="육류">육류</option>
								<option class="t" value="해산물">해산물</option>
								<option class="t" value="유제품">유제품</option>
							</select>
						</td>
					</tr>
					<tr>
					<th>이벤트</th>
					<td>
						<select name="event" style="width:200px; height:30px;">
							<option>이벤트선택</option>
							<%for(Event e : eList){ %>
							<option value="<%=e.getEventCode()%>"><%=e.getEventName() %></option>
							<%} %>
						</select>
					</td>
					</tr>
					<tr>
						<div>
							<th rowspan="2">사진</th>
							<td>
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductThumbnail() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductSubimg() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg1() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg2() %>">
							</td>
						</div>
					</tr>
					 <tr>
						<div>
							<td>
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg3() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg4() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg5() %>">
								<img class="p-img" src="<%=request.getContextPath()%><%=select.getProductImg6() %>">
							</td>
						</div>
					</tr> 
					<tr>
						<div>
							<th rowspan="2">첨부파일</th>
							<td>
								<span>썸네일</span><input type="file" name="th">
							    <span>서브</span><input type="file" name="sub">
								<span>img1</span><input type="file" name="img1">
								<span>img2</span><input type="file" name="img2"> 
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
								<input type="hidden" name="pNo" id="pNo" value=<%=select.getProductNo() %>>
								<input type="hidden" name="t" value="<%=select.getProductThumbnail() %>">
								<input type="hidden" name="s" value="<%=select.getProductSubimg() %>">
								<input type="hidden" name="i1" value="<%=select.getProductImg1() %>">
								<input type="hidden" name="i2"value="<%=select.getProductImg2() %>">
								<input type="hidden" name="i3"value="<%=select.getProductImg3() %>">
								<input type="hidden" name="i4"value="<%=select.getProductImg4() %>">
								<input type="hidden" name="i5"value="<%=select.getProductImg5() %>">
								<input type="hidden" name="i6"value="<%=select.getProductImg6() %>">
							</td>
						</div>
					</tr> 
					<tr>
						<th colspan="2">상품설명(내용)</th>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<textarea class="content" name="content" style="resize: none;" required><%=select.getProductContent() %></textarea>
						</td>
					</tr>
<script>

	
	
		
		 $(".t").each((i,v)=>{
		if($(v).val()=='<%=select.getProductType()%>'){
			
			$(v).attr("selected","selected");
			return;
		}
	});  

</script>