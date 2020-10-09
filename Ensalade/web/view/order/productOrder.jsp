<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp" %>
<%@page import="com.en.product.model.vo.Product,java.util.List,java.text.DecimalFormat" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>
<%
DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
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
 		<form name="orderInfo" action="<%=request.getContextPath()%>/order/orderInsert" method="post">
 		<div class="orderState">
        <h1>주문결제</h1>
        </div>
         <hr class="line">
        <div class="container">
            <div class="left">
           
                <div class="left-address">
                		<label><input type="radio" name="address" value="default" class="address" checked><span>기본배송</span></label>
                		<label><input type="radio" name="address" value="search" class="address" ><span>검색으로 찾기</span></label>
                   		<div class="address-type"> 
		                   	<input type="text" style="margin-top:20px;" class='address-detail' name="address" value="<%=loginMember.getMemberAddress()%>">
		                   	<input type="text" style="margin-top:20px;" class='address-detail' name="address" value="<%=loginMember.getMemberAddress()%>">
		                   	<input type="text" style="margin-top:20px;" class='address-detail' name="address" value="<%=loginMember.getMemberAddress()%>">
						</div>
	                    <div class="left-request">
		                    <select name="" id="" style="width:300px;height:50px;">
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
                </div>
               
                
                
                <hr>
                <h3>주문상품</h3>
                <div class="left-productinfo">
	                <table>
		                <tr>
		                	<th>사진</th>
		                	<th>상품이름</th>
		                	<th>상품종류</th>
		                	<th>상품금액</th>
		                	<th>수량</th>
		                </tr>
		               
		                <%for(int i=0;i<list.size();i++){ %>
		                 
		                <tr>
		                	<td>
			                <img src="<%=request.getContextPath() %>/img/test1.jpg" alt="">
			                </td>
		                	<td>
		                	 <input type="hidden" name="productNo" value="<%=list.get(i).getProductNo() %>"> 
			                <%=list.get(i).getProductName() %>
			                </td>
			                <td>
			                <%=list.get(i).getProductType() %>
			                </td>
			                <td>
			               	<i class="price"><%=formatter.format(list.get(i).getProductPrice()) %></i>원
			                </td>
			                <td>
			                 <input class="del" type="button" value=" - " > 
	                        <input type="text" class="amount" value=" <%=Integer.parseInt(aList.get(i)) %>" size="10" style="text-align:center;">
	                        <input class="add" type="button" value=" + " ><br>
			                </td>
		                	
		                </tr>
		                
		                <%} %>
		                
	                </table>
                </div>
                <hr>
                <div class="left-point">
                    <h3>할인포인트</h3>
                    <span>보유포인트</span>
                    <input type="text" value="<%=loginMember.getPoint() %>" dir="rtl" readonly>
                    <input type="text" dir="rtl" placeholder="사용할포인트">
                </div>
                <hr>               
                
            </div>
            
            <div class="right">
                <nav class="sidebar">
                    <h2>결제금액</h2>
                        
                       	 <span>상품금액 :</span> <i class="total-price"></i>원<br>
                       	 <span>사용포인트:</span> <i class="point"></i>원<br>
                       	 <span>최종금액:</span><i class=""></i>원 <br>
                       	<!-- <button class="payBtn">주문하기</button> -->
                       	<input type="button" class="payBtn" value="결제하기">
                    
                </nav>
                
            </div>
        </div>
        </form>
    </section>
        
        <style>
        	.line{
        	margin-top:0px;
        	margin-bottom:15px;
        	border-color:lightgray;
        	background-color:lightgray;
        	color:lightgray;
        	opacity: 0.2;
        	}
        	#default{
        	margin-top:20px;
        	}
        	.amount{
        	height:42px;
        	border:0;
        	}
        	.search{
        	background-color: green;
	        color: white;
	         border-radius: 10px;
        	}
        	.margin_ {
        	margin-top:20px;
            margin-bottom: 20px;
        	}
        	.address-detail{
            border-radius: 5px;
            height: 50px;
            border-color: #ddd;
            font-size: 13px;
            display: block;
            padding: 0 15px;
            width: 80%;
            height: 43px;
            box-sizing: border-box;
            border: 1px solid #e7e7e7;
            box-shadow: 0 0 0;
            background: #fff;
            font-size: 15px;
            line-height: normal;
            font-weight: 300;
            color: #3d3d3d;
            -webkit-tap-highlight-color: transparent;
            transition: box-shadow .24s ease-out;
            -webkit-appearance: none;
            -moz-appearance: none;
            outline-color: rgb(120, 228, 106);
            outline-style: inherit;
            outline-width: thin;
        
        	}
	        .payBtn{
	        margin-top:50px;
			border:3px green solid;
	        background-color: white;
	        color: green;
	        width: 250px;
	        height: 70px;
	        margin-left: 30px;
	        cursor: pointer;
	        border-top-left-radius:10px;
		    border-bottom-left-radius:10px;
		    border-top-right-radius:10px;
		    border-bottom-right-radius:10px;
			}
			.payBtn:hover{
		       background: green;
		       color: white;
		    }
        	.address{
        	display:none;
        	}
        	.address+span{
        	display:inline-block;
		    background:none;
		    border:1px solid #dfdfdf;    
		    padding:0px 10px;
		    text-align:center;
		    height:35px;
		    line-height:33px;
		    font-weight:500;
		    cursor:pointer;
        	}
        	 .address:checked + span{
			    border:1px solid #23a3a7;
			    background:#23a3a7;
			    color:#fff;
			}
        	.left-request{
			margin-top:10px;        	
        	}
	        i{
		    font-size: 20px;
		    font-weight: bold;
		    font-style: normal;
		    }
        	.del,.add{
		      border:1px solid limegreen;
		      color: limegreen;
		      background-color:rgba(0,0,0,0);
		      padding:10px;
		      cursor: pointer;
		   }    
		   .del:hover,.add:hover{
		      color:white;
		      background-color:lightgreen;
		   }
		   .del{
		      border-top-left-radius:5px;
		      border-bottom-left-radius:5px;
		      margin-right:-1.5px;
		      margin-left:15px;
		   }
		   .add{
		      border-top-right-radius:5px;
		      border-bottom-right-radius:5px;
		      margin-left:-3px;
		   }
        	
	        td{
	        	width:160px;
	        	border-bottom: lightgray 1px solid;
	        	padding:20px;
	        }
	        table{
	        	text-align:center;
	        	border-collapse: collapse;
	        }
        	img{
        		width:100px;
        		height:100px;
        	}
        	h1{
        	margin-left:120px;
        	margin-bottom:10px;
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
                   /*  border: 3px yellow solid; */

        
                }
            .container{
            display: flex;
            justify-content: space-around;
        }
        .right{
            
            width: 350px;
            /* border: green 3px solid; */
        }
        .left{
            
            /* border: 3px red solid; */
        }
        
        </style>
        <script>
        
        var amounts=$(".amount");//수량 클래스명들의 배열
        var adds=$(".add");//더하기버튼 클래스명들의 배열
        var dels=$(".del");//빼기버튼 클래스명들의 배열
        var prices=$(".price");//가격클래스명들 배열
        	
        	
            $(".address").click(e=>{//배송주소 라디오버튼 클릭시
            	
            if($(e.target).val()=="default"){
            	
            	<%-- $(".address-type").html("<input id='default' class='address-detail' type='text' name='address' value='<%=loginMember.getMemberAddress()%>'>"); --%>
            	$(".address-type").html("<div style='display:flex;width:80%;' class='id_ margin_'>"+"<input class='address-detail' type='text' name='address' value='<%=loginMember.getMemberAddress()%>'>"+
            			"</div>"+
            			"<input type='text' class='address-detail' name='address' value='<%=loginMember.getMemberAddress()%>'>"+"<br>"+
            			"<input type='text' class='address-detail' name='address' value='<%=loginMember.getMemberAddress()%>'>");
            }else{
            	
            	$(".address-type").html("<div style='display:flex;width:80%;' class='id_ margin_'>"+"<input class='address-detail' type='text' name='address' id='sample6_postcode' placeholder='우편번호' readonly>"+
            			"<input type='button' class='search' onclick='sample6_execDaumPostcode()' value='우편번호 찾기' style='width: 50%;'>"+"</div>"+
            			"<input type='text' class='address-detail' name='address' id='sample6_address' placeholder='주소'>"+"<br>"+
            			"<input type='text' class='address-detail' name='address' id='sample6_detailAddress' placeholder='상세주소'>");
            } 
            
            });
        
            var totalPrice="<%=formatter.format(totalPrice+2500) %>";
            $(document).ready(function(){//처음에 한번실행
                $(".total-price").html(totalPrice);
            });

          	 var total_price=0;
          	  
           	$(".add").click(e=>{
	           	for(var i=0;i<amounts.length;i++){
	           		hm=amounts[i];
	           		if(e.target==adds[i]){//for문 이용하여 클릭이벤트 발생한 e.target과 더하기버튼이 같은것을 찾는다
	           			
	               		hm.value++;
	               		total_price+=parseInt(hm.value)*prices[i].textContent.replace(/,/g, "");
	           		}else{
	           			total_price+=parseInt(hm.value)*prices[i].textContent.replace(/,/g, "");
	           		}
	           	}
           		$(".total-price")[0].textContent=(total_price+2500).toLocaleString();
           		total_price=0;
           		
           	});
            $(".del").click(e=>{
    	     	for(var i=0;i<prices.length;i++){
    	     		hm=amounts[i];
    	     		if(e.target==dels[i]){//발생버튼과 같은인덱스
    	     			
    	         		if(hm.value>1){
    	         			hm.value--; 
    	         			total_price+=parseInt(hm.value)*parseInt(prices[i].textContent.replace(/,/g, ""));
    		         		
    	        		}else{//해당인덱스이지만 수량이1일때
    	        			total_price+=parseInt(hm.value)*parseInt(prices[i].textContent.replace(/,/g, ""));
    	        		}
    	         		
    	        	}else{
    	        		
            			total_price+=parseInt(hm.value)*parseInt(prices[i].textContent.replace(/,/g, ""));
    	     		}
    	     	}
    	     	$(".total-price")[0].textContent=(total_price+2500).toLocaleString();
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
	
	$(".payBtn").click(e=>{
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
			        orderInfo.submit();
			    }
			    alert(msg);
			});

	});
</script> 
        <%@include file="/view/common/footer.jsp" %>
