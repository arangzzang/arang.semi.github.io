<%@page import="oracle.net.aso.b"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.en.basket.model.vo.Basket,java.util.List,java.text.DecimalFormat"%>
<%@include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/basket.css">
<%
	DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
	List<Basket> list=(List)request.getAttribute("list");
	
	
	int totalPrice=0;
	
	for(Basket b : list){
		totalPrice+=b.getMount()*( b.getPrice()-(b.getPrice()*b.getSalePrice()/100));
		
	}
	
%>
<section>
 <form method="post" id="moveorder" action="<%=request.getContextPath()%>/order/productOrder">
    <div class="basket">
    	<div class="orderHeader">
        <label class="basket" style="margin-left:120px"><h2>장바구니</h2></label>
        <ul class="orderState">
        	<li class="order1">01 장바구니</li>
        	<li class="order2">02 주문서</li>
        	<li class="order3">03 주문완료</li>
        </ul>
        </div> 
        <hr class="header-line">
        <!-- 상품 정보 -->
        <div id="cartList">
            <!-- 상품 선택 -->
            <div id="cartList-children">
                <!-- 상품 상세 내용 -->
                <div id="productContent">
                    <table class="basketTable">
                        <caption style="text-align: center;font-weight:bold">장바구니 담긴상품 목록</caption>
                        <thead>
                            <tr>
                                <th width=15%>사진</th>
                                <th>제품 정보</th>
                                <th>수량</th>
                                <th>배송비</th>
                                <th>가격</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                          <form method="post" id="moveorder" action="<%=request.getContextPath()%>/order/productOrder">
                            <tbody class="basketList">
        					<% for(Basket b : list) {%>
                                <tr>
                                    <!-- 사진 -->
                                    	
                                    <td style="line-height:0">
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
                                 </tbody> 
                      	    </form>
                         <tfoot> 
                            <tr>
                                <td colspan="6">
                                 총 상품금액<i class="total-price"></i>원
                                </td>
                            </tr>
                         </tfoot> 
                    </table>
                    <div class="moveorder">
                        <button class="moveBtn" form="moveorder">주문하기</button>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


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
	 
	 //장바구니 목록 삭제
      $(document).on("click",".remove",function(e){
    	  console.log("실행");
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
        		     $("tbody").html(data);  
        	  }
          }); 
    	}); 
	 //수량에 숫자만 기입할수있록함
      $(document).on("keyup",".amount",function(e){
   	    	for(var i=0;i<amounts.length;i++){
   	    		if(e.target==amounts[i]){
     				if(amounts[i].value=amounts[i].value.replace(/[^0-9]/g, '')){
     					sums[i].textContent=($(e.target).val()*parseInt(prices[i].textContent.replace(/,/g, ""))).toLocaleString();
     					total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
     	 		}
   	    	}else{
    			total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
    		}  
   	    }
   	     $(".total-price")[0].textContent=(total_price).toLocaleString();
 		total_price=0;
     });   
     //포커스가 벗어났을때 숫자가아닌 글자가 입력되면 1이 나오도록하고 숫자가 입력되면 입력된 숫와 곱해짐
     $(document).on("blur",".amount",function(e){
    		    for(var i=0;i<amounts.length;i++){
    			  if($(e.target).val()==0&&e.target==amounts[i]){
    				 $(e.target).val(1);
    	    		  sums[i].textContent=($(e.target).val()*parseInt(prices[i].textContent.replace(/,/g, ""))).toLocaleString(); 
    	    		  total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
    			 }else{
    	    			total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
    	    			
    	    		} 
    		 }
    		    $(".total-price")[0].textContent=(total_price).toLocaleString();
        		total_price=0;
     });
    //수량 버튼 클릭시 태그 색변경
     $(document).on("focus",".amount",function(e){
    	$(e.target).css("outline-color","#27b06e");
	});
     
     var totalPrice="<%=formatter.format(totalPrice) %>";//처음 총 구매금액
     $(document).ready(function(){
         $(".total-price").html(totalPrice);//onload로 페이지 처음에 처음 총 구매금액을 보여줌
     });
   
   	 //더하기버튼 클릭시 가격과 수량이 함께 올라갈수 있도록함
     $(document).on("click",".add",function(e){
    	 console.log(amounts);
    	for(var i=0;i<prices.length;i++){
    		if(e.target==adds[i]){//for문 이용하여 클릭이벤트 발생한 e.target과 더하기버튼이 같은것을 찾는다
    			hm=amounts[i];
        		hm.value++; 
        		sums[i].textContent = (parseInt(hm.value) * parseInt(prices[i].textContent.replace(/,/g, ""))).toLocaleString();//수량*가격 곱한후에 콤마붙여줌
        		total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
        		//toLocaleString()함수는 숫자3자리마다 콤마를 붙여주고 replace(/,/g, "")는 콤마를 없애줌
    		}else{
    			total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
    		}
    	}
   		$(".total-price")[0].textContent=(total_price).toLocaleString();
   		total_price=0;
    	});
     	//빼기버튼 클릭시 가격과 수량이 함께 내려갈수 있도록함
    	 $(document).on("click",".del",function(e){;
	     	for(var i=0;i<prices.length;i++){
	     		if(e.target==dels[i]){//발생버튼과 같은인덱스
	     			hm=amounts[i];
	         		if(hm.value>1){
	         			hm.value--; 
		         		sums[i].textContent = (parseInt(hm.value) * parseInt(prices[i].textContent.replace(/,/g, ""))).toLocaleString();
		         		total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
	        		}else{//해당인덱스이지만 수량이1일때
	        			total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
	        		}
	        	}else{
        			total_price+=parseInt(sums[i].textContent.replace(/,/g, ""));
	     		}
	     	}
	     	$(".total-price")[0].textContent=(total_price).toLocaleString();
	     	total_price=0;
	     	}); 
	   
	   
  	 	
</script>

<%@include file="/view/common/footer.jsp"%>