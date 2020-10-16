<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.en.basket.model.vo.Basket,java.util.List,java.text.DecimalFormat" %>
    <%
    DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
    List<Basket> list = (List)request.getAttribute("list");
		int totalPrice=0;
		
		for(Basket b : list){
			totalPrice+=b.getMount()*(b.getSalePrice()!=0? b.getPrice()-(b.getPrice()*b.getSalePrice()/100):b.getPrice());
			
		}
		
    %>
    
<% for(Basket b : list) {%>
                                <tr>
                                    <!-- 사진 -->
                                    <td>
	                                    <input type="hidden" class="b-No" name="basketNo" value="<%=b.getBasketNo() %>">
	                                	<input type="hidden" class="p-No" name="productNo" value="<%=b.getProductNo() %>">  
                                            <img class="jfdnqud" src="<%=request.getContextPath()+b.getProductThumbnail() %>" alt="">
                                    </td>
                                    <!-- 제품정보 -->
                                    <td>
                                            <p class="p-info"><%=b.getProductName()%></p>
                                            <p class="p-info"><%=b.getProductContent() %></p>
                                    </td>
                                    <!-- 수량 -->
                                    <td>
                                      <div>  수량 : 
                                       		<input type="button" class="del far fa-minus-square fa-2x" value="-" style="width:26px; height:29px;">
                                            <input type="text" class="amount" name="amount" value="<%=b.getMount() %>" size="3" style="text-align:center;">
                                            <input type="button" class="add far fa-plus-square fa-2x" value="+">
                                        <div>
                                        <div>
                                            금액 :    <i class=sum><%=formatter.format(b.getSalePrice()!=0?(b.getPrice()-(b.getPrice()*b.getSalePrice()/100))*b.getMount():b.getPrice()*b.getMount()) %></i>원      
                                          <div> 
                                            <%--  <i class=sum><%=b.getPrice()*b.getMount() %></i>  --%>
                                    </td>
                                    <!-- 배송비 -->
                                    <td>
                                            <span>[기본 배송조건]</span>													
                                    </td>
                                    <!-- 가격 -->													  				
                                    <td><i class="price"><%= formatter.format(b.getSalePrice()!=0? b.getPrice()-(b.getPrice()*b.getSalePrice()/100):b.getPrice())%></i>원</td>
                                    <!-- 비고 -->
                                    <td>
                                         
                                         <input type="button" class="remove" value="삭제하기"> 
                                    </td>
                                </tr>
                                <%} %>
<style> 
			 .del,.add{
        	vertical-align:bottom;
			outline: 0;
			color: green;
			background-color: #fff;
			cursor: pointer;
			line-height: 0.8;
			border : green solid 3px;
			}
			 .fab:hover, .far:hover {
			color: white;
			background-color: #35ad73;
			line-height: 0.8;
			}
			 	
	.p-info{
		margin:30px;
	}
	
	.amount{
		border: 0;
		height:42px;
	}
	.moveorder{
		
		 display: flex; 
		 justify-content: center; 
	}
		i{
	    font-size: 20px;
	    font-weight: bold;
	    font-style: normal;
	    } 
	
    .basket{
        /* margin-top: 50px;
        margin-bottom: 50px; */
    }
    td{
        border: lightgray 1px solid;
        
    }
	#cartList-children{
        width: 100%;
        height: 100%;
       /*  border: 1px red solid; */
        display: flex; 
        
    }
    #productContent{	
        width: 100%;
      /*   border: 1px blueviolet solid; */
        
        
    }
    table{
    	width:90%;
        text-align: center;
        margin: auto;
        border-collapse: collapse;
    }
    tr{
    	height:165px;
    }
    
    
</style>
<script>
	
var prices=$(".price");//가격클래스명들 배열
var sums=$(".sum");//수량 * 금액 클래스명들 배열
var amounts=$(".amount");//수량 클래스명들의 배열
var adds=$(".add");//더하기버튼 클래스명들의 배열
var dels=$(".del");//빼기버튼 클래스명들의 배열
var removes=$(".remove");//삭제버튼 클래스명들의 배열
var productNos=$(".p-No");//상품번호 클래스명들의 배열
var basketNos=$(".b-No");//장바구니번호 클래스명들의 배열 
var total_price=0;
var productNo;
var basketNo;
var totalPrice="<%=formatter.format(totalPrice) %>";//처음 총 구매금액
     
     
$(document).ready(function(){
    $(".total-price").html(totalPrice);//onload로 페이지 처음에 처음 총 구매금액을 보여줌
});   	   
     
      
</script>
                       