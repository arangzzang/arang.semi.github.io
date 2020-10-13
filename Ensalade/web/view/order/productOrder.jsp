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

/* int basketNo=(int)request.getAttribute("basketNo"); */
int totalPrice=0;
for(int i=0;i<list.size();i++){
	int amount=Integer.parseInt(aList.get(i));
	int price=list.get(i).getProductPrice()-(list.get(i).getProductPrice()*list.get(i).getSalePer()/100);
	totalPrice+=amount*price;
}
String[] address=loginMember.getMemberAddress().split(",");
System.out.println(address);
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
 		<form name="orderInfo" action="<%=request.getContextPath()%>/order/orderInsert<%=request.getAttribute("basketNo")!=null?"?basketNo="+request.getAttribute("basketNo"):""%>" method="post">
 		 <%-- <input type="hidden" name="basketNo" value="<%=basketNo %>">  --%>
 		 <%-- <input type="hidden" name="basketNo" value="<%=request.getAttribute("basketNo") %>"> --%>
 		<div class="orderHeader">
        <h1>주문결제</h1>
        <ul class="orderState">
        	<li class="order1">01 장바구니</li>
        	<li class="order2">02 주문서</li>
        	<li class="order3">03 주문완료</li>
        </ul>
        </div>
         <hr class="line">
        <div class="container">
            <div class="left">
           
                <div class="left-address">
                		<label><input type="radio" name="address-select" value="default" class="address" checked><span>기본배송</span></label>
                		<label><input type="radio" name="address-select" value="search" class="address" ><span>검색으로 찾기</span></label>
                   		<div class="address-type"> 
		                   	<input type="text" style="margin-top:20px;" class='address-detail' name="address" value="<%=address[0]%>" readonly>
		                   	<input type="text" style="margin-top:20px;" class='address-detail address-ch' name="address" value="<%=address[1]%>" required>
		                   	<input type="text" style="margin-top:20px;" class='address-detail' name="address" value="<%=address[2]%>" required>
						</div>
	                    <div class="left-request">
		                    <select name="memo" id="" style="width:300px;height:50px;">
		                        <option value="배송시 요청사항">배송시 요청사항</option>
		                        <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
		                        <option value="배송 전,연락주세요.">배송 전,연락주세요.</option>
		                        <option value="부재 시,휴대폰으로 연락주세요.">부재 시,휴대폰으로 연락주세요.</option>
		                        <option value="부재 시,경비실에 맡겨주세요.">부재 시,경비실에 맡겨주세요.</option>
		                        <option value="경비실이 없습니다.배송 전 연락주세요.">경비실이 없습니다.배송 전,연락주세요.</option>
		                        <option value="배송 전,연락주세요.">배송 전,연락주세요.</option>
		                        <option value="선택안함.">선택안함.</option>
		                    </select>
	                	</div>
                </div>
               
                
                
                <hr>
                <h3 style="margin-bottom:15px">주문상품</h3>
                <div class="left-productinfo">
	                <table class="orderTable">
		                <tr>
		                	<th width=5%>사진</th>
		                	<th width=50%>제품정보</th>
		                	<th width=10%>상품금액</th>
		                	<th width=35%>수량</th>
		                </tr>
		               
		                <%for(int i=0;i<list.size();i++){ System.out.println(list.get(i).getSalePer());%>
		                 
		                <tr>
		                	<td>
			                <img src="<%=request.getContextPath()+list.get(i).getProductThumbnail() %>" alt="">
			                </td>
		                	<td>
		                	 <input type="hidden" name="productNo" value="<%=list.get(i).getProductNo() %>">
			                <p class="p-info"><%=list.get(i).getProductName() %></p>
			                <p class="p-info"><%= list.get(i).getProductContent() %></p>
			                </td>
			                <td>
			               	<i class="price"><%=formatter.format(list.get(i).getProductPrice()-(list.get(i).getProductPrice()*list.get(i).getSalePer()/100)) %></i>원
			                </td>
			                <td>								
			                 <input class="del" type="button" value=" - " > 
	                        <input type="text" name="amount" class="amount" value="<%=Integer.parseInt(aList.get(i)) %>" size="10" style="text-align:center;">
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
                       	 <span>배송비:</span><i class="ba"></i>원<br>
                       	 <span>최종금액:</span><i class="total-pay"></i>원 <br> 
                       	 <input type="hidden" id="ba" name="ba">
                       	 <input type="hidden" id="total" name="total-pay">
                       	<!-- <button class="payBtn">주문하기</button> -->
                       	<input type="button" class="payBtn" value="결제하기">
                    
                </nav>
                
            </div>
        </div>
        </form>
    </section>
        
        <style>
        	.order2{
        		background-color:green;
        		color:white;
        	}
        	.orderHeader{
        		display:flex;
        		justify-content: space-between;
        	}
        	.orderState{
        		margin-right:120px;
        		display:flex;
        		list-style:none;
        	}
        	.orderState>li{
        	border:lightgray 1px solid;
        	border-radius:10px;
        	padding: 10px 15px 11px 15px;
        	font-weight: bold;
        	text-align: center;
        	}
        	.p-info{
        		margin:30px;
        	}
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
        	width:52px;
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
	        .ba,.total-pay,.total-price,.price{
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
	        .orderTable{
	        	margin: auto;
	       		width:800px;
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
            
            width: 300px;
            /* border: green 3px solid; */
        }
        .left{
            
             
        }
        
        </style>
        <script>
        
        var amounts=$(".amount");//수량 클래스명들의 배열
        var adds=$(".add");//더하기버튼 클래스명들의 배열
        var dels=$(".del");//빼기버튼 클래스명들의 배열
        var prices=$(".price");//가격클래스명들 배열
        var total_price=0;
        var ba;
        		
		        $(document).on("change",".address-detail",function(){//생성된 주소 태그에 값이 변경되면 	배송비 변경
		        	//지역별 배송비 설정
					var address=$(".address-ch").val();
	                if(address.includes("서울")||address.includes("경기")){
	                	ba=2500;
	                }else if(address.includes("제주")){
	                	ba=7000;
	                }else{
	                	ba=5000;
	                }
	                $(".ba").html(ba.toLocaleString());//배송비 설정
	                $(".total-pay").html((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba).toLocaleString());//상품총가격+배송비 최종가격
	                $("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));
	                $("#ba").val(ba);
		       	});
		        $(".amount").keyup(e=>{
		   	    	for(var i=0;i<amounts.length;i++){
		   	    		if(e.target==amounts[i]){//해당인덱스
		     				if(amounts[i].value=amounts[i].value.replace(/[^0-9]/g, '')){
		     					console.log($(e.target).val());
		     					total_price+=parseInt($(e.target).val())*prices[i].textContent.replace(/,/g, "");
		     	 		}
		   	    	}else{
		   	    		total_price+=parseInt(amounts[i].value)*prices[i].textContent.replace(/,/g, "");
	           		} 	
		   	    }
		   	    	$(".total-price")[0].textContent=(total_price).toLocaleString();
		   	    	$(".total-pay")[0].textContent=(total_price+ba).toLocaleString();
		   	     	$("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));//hidden에 값주기
	           		total_price=0;
		     });   
		     $(".amount").blur(e=>{
		    		    for(var i=0;i<amounts.length;i++){
		    			  if($(e.target).val()==0&&e.target==amounts[i]){
		    				 $(e.target).val(1);
		    				 total_price+=parseInt($(e.target).val())*prices[i].textContent.replace(/,/g, ""); 
		    			 }else{
		    				 total_price+=parseInt(amounts[i].value)*prices[i].textContent.replace(/,/g, "");
			           		}   	
		    		 }
		    		    $(".total-price")[0].textContent=(total_price).toLocaleString();
		    		    $(".total-pay")[0].textContent=(total_price+ba).toLocaleString();
		    		    $("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));//hidden에 값주기
	             		total_price=0;
		     });
		    //수량 버튼 클릭시 태그 색변경
		    $(".amount").focus(e=>{
		    	$(e.target).css("outline-color","#27b06e");
			});
        	
            $(".address").click(e=>{//배송주소 라디오버튼 클릭시
            	
            if($(e.target).val()=="default"){
            	
            	<%-- $(".address-type").html("<input id='default' class='address-detail' type='text' name='address' value='<%=loginMember.getMemberAddress()%>'>"); --%>
            	$(".address-type").html("<div style='display:flex;width:80%;' class='id_ margin_'>"+"<input class='address-detail' type='text' name='address' value='<%=address[0]%>' readonly>"+
            			"</div>"+
            			"<input type='text' class='address-detail address-ch' name='address' value='<%=address[1]%>' required>"+"<br>"+
            			"<input type='text' class='address-detail' name='address' value='<%=address[2]%>' required>");
            }else{
            	
            	$(".address-type").html("<div style='display:flex;width:80%;' class='id_ margin_'>"+"<input class='address-detail' type='text' name='address' id='sample6_postcode' placeholder='우편번호' readonly>"+
            			"<input type='button' class='search' onclick='sample6_execDaumPostcode()' value='우편번호 찾기' style='width: 50%;'>"+"</div>"+
            			"<input type='text' class='address-detail address-ch' name='address' id='sample6_address' placeholder='주소' required>"+"<br>"+
            			"<input type='text' class='address-detail' name='address' id='sample6_detailAddress' placeholder='상세주소' required>");
            }
          
            
            });
        
            var totalPrice="<%=formatter.format(totalPrice) %>";
            $(document).ready(function(){//처음에 한번실행
                $(".total-price").html(totalPrice);
            	//지역별 배송비 설정
            	var address=$(".address-ch").val();
                if(address.includes("서울")||address.includes("경기")){
                	ba=2500;
                }else if(address.includes("제주")){
                	ba=7000;
                }else{
                	ba=5000;
                }
                $(".ba").html(ba.toLocaleString());//배송비 설정
                $(".total-pay").html((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba).toLocaleString());//상품총가격+배송비 최종가격
                $("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));//hidden에 값주기
                $("#ba").val(ba);
            });

          	
          	  
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
           		$(".total-price")[0].textContent=(total_price).toLocaleString();
           		$(".total-pay")[0].textContent=(total_price+ba).toLocaleString();
           	 	$("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));//hidden에 값주기
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
    	     	$(".total-price")[0].textContent=(total_price).toLocaleString();
    	     	$(".total-pay")[0].textContent=(total_price+ba).toLocaleString();
    	     	$("#total").val((parseInt($(".total-price")[0].textContent.replace(/,/g, ""))+ba));//hidden에 값주기
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
