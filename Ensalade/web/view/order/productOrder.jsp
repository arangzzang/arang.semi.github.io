<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp" %>
<%@page import="com.en.product.model.vo.Product" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>
<%Product p =(Product)request.getAttribute("selectProduct");
int su=Integer.valueOf((String)request.getAttribute("su")); 
%>

<script>
        $(document).ready(function(){
            $(".sidebar").scrollFollow({
                speed : 1000,    // 꿈지럭 거리는 속도
                offset : 200     // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
            });
        });
        
    </script>
    
    <section>
 		
        <h1>주문결제</h1>
        <div class="container">
            <div class="left">
                <div class="left-address">
                        <label><input type="radio" name="address" value="default" class="address" checked>기본배송</label>
                        <label><input type="radio" name="address" value="self" class="address">직접입력</label><br>
                   		<div class="address-type"><p>기본회원주소</p></div>
                    
                </div>
                <hr>
                <div class="left-request">
                    <form action="">
                        <input type="text" class="request" placeholder="요청 사항 입력"><br>
                    </form>
                    <select name="" id="">
                        <option >배송시 요청사항</option>
                        <option >안녕</option>
                        <option >하세요</option>
                    </select>
                </div>
                
                <hr>
                <h3>주문상품</h3>
                <div class="left-productinfo">
	                
	                <table border="1">
		                <tr>
		                	<th>상품이름<th>
		                	<th>상품종류</th>
		                	
		                </tr>
		                <tr>
		                	<td>
			                <%=p.getProductName() %>
			                </td>
			                <td>
			                <img src="<%=request.getContextPath() %>/img/test1.jpg" alt="">
			                <td>
			                <%=p.getProductType() %>
			                </td>
		                </tr>
	                </table>
                </div>
                <hr>
                <div class="left-point">
                    <h3>할인포인트</h3>
                    <span>소유포인트</span>
                    <input type="text" placeholder="보유포인트">
                    <input type="text" placeholder="사용할포인트">
                </div>
                <hr>
                <div class="left-pay">
                    <h3>결제수단</h3>
					<label><input type="radio" name="pay" checked>카드결제</label>
					<label><input type="radio" name="pay">무통장입금</label>
                </div>
                <div id="a"></div>

            </div>
            
            <div class="right">
                <nav class="sidebar">
                    <h2>결제금액</h2>
                            <form class="count" name="form" method="get">
                         <p id="price">상품금액: <%=p.getProductPrice()%>원</p>
                        수량 : <input class="su" type="button" value=" - " onclick="del();"> 
                        <input type="text" id="amount" value="<%=su %>" size="10" >
                        <input class="su" type="button" value=" + " onclick="add();"><br>
                        최종금액 :  <p id=sum></p>
                    </form>
                </nav>
                
            </div>
        </div>
        
    </section>
        
        <style>
	        td{
	        	width:300px;
	        	
	        }
	        table{
	        	text-align:center;
	        }
        	img{
        		width:100px;
        		height:100px;
        	}
        	h1{
        	margin-left:190px;
        	margin-bottom:30px;
        	}
	        .orderbtn{
			        border:3px green solid;
			        background-color: green;
			        width: 200px;
			        height: 50px;
			        margin-left: 30px;
	        
	    		}
	          hr{
	          	margin-bottom:50px;
	          	margin-top:50px;
	           }
            .sidebar{
                    height: 200px;
                    width: 350px;
                    position: absolute;
                    border: 3px yellow solid;

        
                }
            .container{
            display: flex;
            justify-content: space-around;
        }
        .right{
            
            width: 350px;
            border: green 3px solid;
        }
        .left{
            
            border: 3px red solid;
        }
        #a{
            height: 5000px;
        }
        </style>
        <script>
            $(".address").click(e=>{
            	
            if($(e.target).val()=="default"){
            	
               	var address="<p>기본회원주소</p>";
            }else{
            	
				var address="<p>직접입력주소</p>";
            } 
            $(".address-type").html(address);
            
            });
            // 수량/가격 기능 script 구문
            var price = <%=p.getProductPrice()%>;
             var firstPrice=<%=p.getProductPrice()*su%>;
            var amount;
            onload=function(){
            		document.getElementById("sum").textContent = firstPrice+"원";
            		
            		}
                
            
            function add() {//수량추가 하는 함수
                hm = document.getElementById("amount");
                sum = document.getElementById("sum");
                hm.value++;
            
                sum.textContent = parseInt(hm.value) * price+"원";
            }
            
            function del() {//수량감소 하는 함수
                hm = document.getElementById("amount");
                sum = document.getElementById("sum");
                if (hm.value > 1) {
                    hm.value--;
                    sum.textContent = parseInt(hm.value) * price+"원";
                }
            }
            
           
            
       
        </script>
        <%@include file="/view/common/footer.jsp" %>
