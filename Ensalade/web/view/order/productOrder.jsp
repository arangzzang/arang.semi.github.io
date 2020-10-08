<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp" %>
<%@page import="com.en.product.model.vo.Product,java.util.List" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>
<%
List<String> aList=(List)request.getAttribute("amount");
List<Product> list=(List)request.getAttribute("list");
int totalPrice=0;
for(int i=0;i<list.size();i++){
	int amount=Integer.parseInt(aList.get(i));
	int price=list.get(i).getProductPrice();
	totalPrice+=amount*price;
}
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
                		<label><input type="radio" name="address" value="default" class="address" checked>기본배송</label><br>
                		<label><input type="radio" name="address" value="search" class="address" >검색으로 찾기</label>
                   		<div class="address-type"> 
		                   	<p><%=loginMember.getMemberAddress()%></p>
						</div>
                    
                </div>
                <hr>
                <div class="left-request">
                   <!--  <form action="">
                        <input type="text" class="request" placeholder="요청 사항 입력"><br>
                    </form> -->
                    <select name="" id="">
                        <option >배송시 요청사항</option>
                        <option >빠른 배송 부탁드립니다.</option>
                        <option >배송 전,연락주세요.</option>
                        <option >부재 시,휴대폰으로 연락주세요.</option>
                        <option >부재 시,경비실에 맡겨주세요.</option>
                        <option >경비실이 없습니다.배송 전,연락주세요.</option>
                        <option >배송 전,연락주세요.</option>
                        <option >선택안함.</option>
                    </select>
                </div>
                
                <hr>
                <h3>주문상품</h3>
                <div class="left-productinfo">
	                <table border="1">
		                <tr>
		                	<th>상품이름<th>
		                	<th>상품종류</th>
		                	<th>상품금액</th>
		                	<th>수량</th>
		                </tr>
		                <%for(int i=0;i<list.size();i++){ %>
		                <tr>
		                	<td>
			                <%=list.get(i).getProductName() %>
			                </td>
			                <td>
			                <img src="<%=request.getContextPath() %>/img/test1.jpg" alt="">
			                <td>
			                <%=list.get(i).getProductType() %>
			                </td>
			                <td>
			               	<p class="price"><%=list.get(i).getProductPrice() %></p>원
			                </td>
			                <td>
			                 <input class="del" type="button" value=" - " > 
	                        <input type="text" class="amount" value=" <%=Integer.parseInt(aList.get(i)) %>" size="10" >
	                        <input class="add" type="button" value=" + " ><br>
			                </td>
		                </tr>
		                <%} %>
	                </table>
                </div>
                <hr>
                <div class="left-point">
                    <h3>할인포인트</h3>
                    <span>소유포인트</span>
                    <input type="text" value="<%=loginMember.getPoint() %>" dir="rtl" readonly>
                    <input type="text" dir="rtl" placeholder="사용할포인트">
                </div>
                <hr>
                <div class="left-pay">
                    <h3>결제수단</h3>
                    <label><input type="radio" class="pay" value="mubank" name="pay"checked>무통장입금</label>
					<label><input type="radio" class="pay" value="card" name="pay">카드결제</label>
                </div>
                <div id="a"></div>

            </div>
            
            <div class="right">
                <nav class="sidebar">
                    <h2>결제금액</h2>
                        <form class="count" name="form" method="get">
                       	 <span>상품이름 :</span> <p id=sum></p>
                       	 최종금액 :<p class="total-price"></p> <br>
                        <input type="submit" value="주문하기">
                    </form>
                </nav>
                
            </div>
        </div>
        
    </section>
        
        <style>
	        td{
	        	width:160px;
	        	
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
        var amounts=$(".amount");//수량 클래스명들의 배열
        var adds=$(".add");//더하기버튼 클래스명들의 배열
        var dels=$(".del");//빼기버튼 클래스명들의 배열
        var prices=$(".price");//가격클래스명들 배열
        
        	
            $(".address").click(e=>{//배송주소 라디오버튼 클릭시
            	
            if($(e.target).val()=="default"){
            	
            	$(".address-type").html("<p><%=loginMember.getMemberAddress()%></p>");
            }else{
            	
            	$(".address-type").html("<input type='text' id='sample6_postcode' placeholder='우편번호'>"+
            			"<input type='button' onclick='sample6_execDaumPostcode()' value='우편번호 찾기'>"+"<br>"+
            			"<input type='text' id='sample6_address' placeholder='주소'>"+"<br>"+
            			"<input type='text' id='sample6_detailAddress' placeholder='상세주소'>");
            } 
            
            });
        
            var totalPrice=<%=totalPrice+2500 %>;
            $(document).ready(function(){//처음에 한번실행
                $(".total-price").html(totalPrice);
            });

          	 var total_price=0;
          	  
           	$(".add").click(e=>{
	           	for(var i=0;i<amounts.length;i++){
	           		hm=amounts[i];
	           		if(e.target==adds[i]){//for문 이용하여 클릭이벤트 발생한 e.target과 더하기버튼이 같은것을 찾는다
	           			
	               		hm.value++;
	               		total_price+=parseInt(hm.value)*prices[i].textContent;
	           		}else{
	           			total_price+=parseInt(hm.value)*prices[i].textContent;
	           		}
	           	}
           		$(".total-price")[0].textContent=total_price+2500;
           		total_price=0;
           		
           	});
            $(".del").click(e=>{
    	     	for(var i=0;i<prices.length;i++){
    	     		hm=amounts[i];
    	     		if(e.target==dels[i]){//발생버튼과 같은인덱스
    	     			
    	         		if(hm.value>1){
    	         			hm.value--; 
    	         			total_price+=parseInt(hm.value)*prices[i].textContent;
    		         		
    	        		}else{//해당인덱스이지만 수량이1일때
    	        			total_price+=parseInt(hm.value)*prices[i].textContent;
    	        		}
    	         		
    	        	}else{
    	        		
            			total_price+=parseInt(hm.value)*prices[i].textContent;
    	     		}
    	     	}
    	     	$(".total-price")[0].textContent=total_price+2500;
    	     	total_price=0;
    	     	}); 
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script>
 	//주소 api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
 	//결제 api
 	//var IMP = window.IMP; // 생략가능
	
	$(".pay").click(e=>{
		if($(e.target).val()=="card"){
			IMP.init('imp26494745');
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}	, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
		
	});
</script> 
        <%@include file="/view/common/footer.jsp" %>
