<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.en.basket.model.vo.Basket,java.util.List" %>
    <%List<Basket> list = (List)request.getAttribute("list");
		int totalPrice=0;
		int ba=0;
		for(Basket b : list){
			totalPrice+=b.getMount()*b.getPrice();
			
		}
		if(totalPrice!=0){
			ba=2500;
		}
    %>

       <% for(Basket b : list) {%>
                                <tr>
                                    <!-- 사진 -->
                                    <td>
	                                    <input type="hidden" class="b-No" value="<%=b.getBasketNo() %>">
	                                	<input type="hidden" class="p-No" value="<%=b.getProductNo() %>">  
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
                                            <input type="text" class="amount" value="<%=b.getMount() %>" size="3">
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
                                         <button class="remove">삭제</button>
                                    </td>
                                </tr>
                                <%} %>
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

   	  total_price=0;
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
	     		if(e.target==dels[i]){
	     			hm=amounts[i];
	         		sum=sums[i];
	         		if(hm.value>1){
	         			hm.value--; 
		         		sum.textContent = parseInt(hm.value) * prices[i].textContent;
		         		total_price+=parseInt(sum.textContent);
	        		}
	        	}else{
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
                       