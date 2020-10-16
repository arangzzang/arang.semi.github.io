<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.en.product.model.vo.Product,java.util.List,com.en.product.model.service.ProductService" %>
 <%@include file="/view/common/header.jsp"%>
 <%List<Product> list=new ProductService().selectProductAll(); %>
 <section>
 <div class="form-container">
	<div><h1>상품수정 및 삭제</h1></div>
	<div class="table-container">
		 <form id="f" name="product" action="<%=request.getContextPath() %>/admin/productUpdate" method="post" enctype="multipart/form-data"> 
			<table class=product-table>
				<tr>
					<td>
						<select id="product">
							 <option>상품선택</option> 
						<%for(Product p : list){ %>
							<option value="<%=p.getProductName()%>"><%=p.getProductName() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tbody id="detail">
					
				</tbody>
			</table>
			<div class="btn-container">
				<input type="submit" value="수정하기" style="width:200px; height:50px;">
				<input type="button" onclick="del();" value="삭제하기" style="width:200px; height:50px;">
			</div>
		</form>
	</div>
	
</div>
 </section>
<style>
.form-container{
	width:95%;
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
	outline:0;
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
#product{
	width:200px;
	height:50px;
}
.p-img{
	width:300px;
	height:300px;
}

</style>
<script>
	$("#product").on("change",(e)=>{
		
		var product=$("#product option:selected").val();
		
		 $.ajax({
       	  url :"<%=request.getContextPath()%>/view/admin/productInfo.jsp",
       	  data:{"product":product},
       	  success:data=>{
       		console.log(data);
       		     $("#detail").empty(); 
       		     $("#detail").html(data);  
       		   
       	  }
         }); 
	});
	
	function del(){
		var pNo=$("#pNo").val();
		location.assign('<%=request.getContextPath()%>/admin/productDelete?pNo='+pNo);
		
	}
</script>
  <%@include file="/view/common/footer2.jsp"%>