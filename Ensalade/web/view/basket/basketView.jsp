<%@page import="oracle.net.aso.b"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.en.basket.model.vo.Basket,java.util.List"%>
<%@include file="/view/common/header.jsp"%>
<%
	List<Basket> list=(List)request.getAttribute("list");
	int totalPrice=0;
	int ba=0;
	for(Basket b : list){
		totalPrice+=b.getMount()*b.getPrice();
		
	}
	if(totalPrice!=0){
		ba=2500;
	}
%>
<section>
    <div class="basket">
        <label class="basket"><h2>장바구니</h2></label>
        <!-- 전체 선택 -->
        <div id="choice"><input type="checkbox" id="cartListAll" value="productList();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체선택</div>
        <hr>
        <!-- 상품 정보 -->
        <div id="cartList">
            <!-- 상품 선택 -->
            <input type="checkbox" id="list">
            <div id="cartList-children">
                <!-- 상품 상세 내용 -->
                <div id="productContent">
                    <table>
                        <caption style="text-align: center;">장바구니 담신상품 목록</caption>
                        <colgroup>

                        </colgroup>
                        <thead>
                            <tr>
                                <th>사진</th>
                                <th>제품 정보</th>
                                <th>수량</th>
                                <th>배송비</th>
                                <th>가격</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <form class="count" method="post" id="moveorder" action="<%=request.getContextPath()%>/order/productOrder">  
                            <tbody class="basketList"> 
        <% for(Basket b : list) {%>
                                <tr>
                                    <!-- 사진 -->
                                    <td>
	                                    <input type="hidden" class="b-No" name="basketNo" value="<%=b.getBasketNo() %>">
	                                	<input type="hidden" class="p-No" name="productNo" value="<%=b.getProductNo() %>">  
                                            <img src="" alt="">
                                    </td>
                                    <!-- 제품정보 -->
                                    <td>
                                            <p><%=b.getProductName()%></p>
                                    </td>
                                    <!-- 수량 -->
                                    <td>
                                       수량 : 
                                       		<input type="button" value=" - " class="del">
                                            <input type="text" class="amount" name="amount" value="<%=b.getMount() %>" size="3">
                                            <input type="button" value=" + " class="add"><br>
                                            금액 :  <p class=sum><%=b.getPrice()*b.getMount() %></p>원    
                                    </td>
                                    <!-- 배송비 -->
                                    <td>
                                            <span>[기본 배송조건]</span>
                                    </td>
                                    <!-- 가격 -->
                                    <td><p class="price"><%=b.getPrice()%></p>원</td>
                                    <!-- 비고 -->
                                    <td>
                                         
                                          <p class="remove">삭제</p> 
                                    </td>
                                </tr>
                                <%} %>
                                 </tbody> 
                      	 </form> 
                         <tfoot> 
                            <tr>
                                <td colspan="6">
                                    총구매 금액 : 상품가격 + 배송비(2500원) = 총 상품가격<p class="total-price"></p> 원
                                </td>
                            </tr>
                         </tfoot> 
                       
                    </table>
                    <div>
                        <button form="moveorder">주문하기</button>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    .basket{
        margin-top: 50px;
        margin-bottom: 50px;
    }
    td{
        border: blueviolet 2px solid;
    }
	#cartList-children{
        width: 100%;
        height: 100%;
        border: 1px red solid;
        display: flex;
    }
    #productContent{
        
        width: 100%;
        border: 1px blueviolet solid;
        align-items: center;
    }
    table{
    	width:80%;
        text-align: center;
        margin: auto;
    }
    #thumnail{
    	
        width: 200px;
        height: 200px;
        border: 1px turquoise solid;
    }
    #product{
        border: 1px tomato solid;
    }
    #amount{
        border: 1px blue solid;
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
     
     
     var totalPrice=<%=totalPrice+ba %>;
     $(document).ready(function(){
         $(".total-price").html(totalPrice);
     });

   	  var total_price=0;
    	$(".add").click(e=>{
    	for(var i=0;i<prices.length;i++){
    		if(e.target==adds[i]){//for문 이용하여 클릭이벤트 발생한 e.target과 더하기버튼이 같은것을 찾는다
    			hm=amounts[i];
        		sum=sums[i];
        		hm.value++; 
        		sum.textContent = parseInt(hm.value) * prices[i].textContent;
        		total_price+=parseInt(sum.textContent);
    		}else{
    			total_price+=parseInt(sums[i].textContent);
    		}
    		
    		 }
    		$(".total-price")[0].textContent=total_price+2500;
    		total_price=0;
    	});
	     $(".del").click(e=>{
	     	for(var i=0;i<prices.length;i++){
	     		if(e.target==dels[i]){//발생버튼과 같은인덱스
	     			hm=amounts[i];
	         		if(hm.value>1){
	         			hm.value--; 
		         		sums[i].textContent = parseInt(hm.value) * prices[i].textContent;
		         		total_price+=parseInt(sums[i].textContent);
		         		
	        		}else{//해당인덱스이지만 수량이1일때"web/view/basket/ajaxBasketDelete.jsp"
	        			total_price+=parseInt(sums[i].textContent);
	        		}
	         		
	        	}else{"web/view/basket/ajaxBasketDelete.jsp"
	        		
        			total_price+=parseInt(sums[i].textContent);
	     		}
	     	}
	     	$(".total-price")[0].textContent=total_price+2500;
	     	total_price=0;
	     	}); 
	   //장바구니 목록 삭제
	   var productNo;
  	   var basketNo;
  	 	
        $(".remove").click(e => {
    	 for(var i=0;i<prices.length;i++){
    		 if(e.target==removes[i]){
    			 productNo=productNos[i].value;
    			 basketNo=basketNos[i].value;
    		 }
    	 }
          $.ajax({
        	  url :"<%=request.getContextPath()%>/ajax/deleteBasket",
        	  data:{"productNo":productNo,"basketNo":basketNo},
        	  success:function(data){
        		     $("tbody").empty();
        		     $("tbody").append(data);  
        		   
        	  }
          }); 
       });   
	     
	     
	     
	  
</script>

<%@include file="/view/common/footer.jsp"%>