<%@page import="java.util.ArrayList"%>
<%@page import="com.en.inquiry.model.service.InquiryService"%>
<%@page import="com.en.order.model.service.OrderService"%>
<%@page import="com.en.product.model.service.ProductService"%>
<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="java.util.List,com.en.order.model.vo.Order ,com.en.product.model.vo.ProductReview,com.en.custom.model.vo.CustomPost	,com.en.inquiry.model.vo.Inquiry"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.scrollfollow.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypageAll.css">


<%
	if(loginMember==null){
		response.sendRedirect(request.getContextPath()+"/view/login.jsp");
		return;
	}
	List<Order> oList = new OrderService().myPage(loginMember.getMemberId());
	List<ProductReview> prList = new ProductService().myPage(loginMember.getMemberId());
	List<CustomPost> cpList = new CustomService().myPage(loginMember.getMemberId());
	List<Inquiry> iList = new InquiryService().searchMemberInquiry(loginMember.getUser_no());
	String delivery="";
	for(Order ds:oList){
		delivery=ds.getOrderStatus();
	}
	int status = new OrderService().statusCount(delivery,loginMember.getMemberId());
	
	int oNo = 0;
	int count = 0;
	int mount =0;
	//총 주문량
	if(!oList.isEmpty()){
		for(Order hm : oList){
			count = hm.getOrderMount();
		}
	}
	mount+= count;

%>
<section style="text-align: center;">
	<!--마이페이지 헤드공용-->
	<div class="mypageHead">
	  <div class="headfix">
	    <div>
	      <h4><%=loginMember.getMemberName() %></h4>
	      <p><%=loginMember.getEmail() %></p>
	    </div>
	    <div>
	      <h4>적립금</h4>
	      <p><%=loginMember.getPoint() %></p>
	    </div>
	    <div>
	      <h4>총 주문</h4>
	      <p id="1"><%=mount %></p>
	    </div>
	  </div>
		<div class="status">
			<h3>배송현황</h3>
			<ul>
				<li>
					<span class="statusCount">주문대기</span>
					<p> ></p>
					<label class="count"><%=status %></label>
				</li>
				<li>
					<span class="statusCount">주문완료</span>
					<p> ></p>
					<label class="count"><%=status %></label>
				</li>
				<li>
					<span class="statusCount">배송준비</span>
					<p> ></p>
					<label class="count"><%=status %></label>
				</li>
				<li>
					<span class="statusCount">배송중</span>
					<p> ></p>
					<label class="count"><%=status %></label>
				</li>
				<li>
				<span class="statusCount">배송 완료</span>
				<label class="count"><%=status %></label>
				</li>
			</ul>
		</div>
	</div>
	<div id="mypagebody">
	  <!--사이드바-->
	  <div class="sidebar-container">
	    <div class="sidebar">
	      <nav class="sidebarnav">
	        <h3>마이페이지</h3>
	        <ul>
	          <li class="sidemenu">
          		<a class="mysidemenu" onclick="move('1')">
		          	<span class="underbar">주문 내역</span>
		          	<span></span>
          		</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu" onclick="move('2')">
	          		<span class="underbar">내 게시글</span>
	          		<span></span>
	          	</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu" onclick="move('3')">
	          		<span class="underbar">나의 커스텀</span>
	          		<span></span>
	          	</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu" onclick="move('4')">
	          		<span class="underbar">1:1 문의</span>
	          		<span></span>
	          	</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu" href="<%=request.getContextPath()%>/view/MyPage/myInformation/modifyInformation.jsp">
	          		<span class="underbar">회원 정보 수정</span>
	          		<span></span>
	          	</a>
	          </li>
	        </ul>
	      </nav>
	    </div>
	  </div>
	    <!--상세 내용-->
	  <div class="myPage">
	    <div class="contents"  id="mysidemenu1">
	      <table class="orderHistory">
	        <caption><h2>주문 내역</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:auto;">
	          <col style="width:70px;">
	          <col style="width:150px;">
	          <col style="width:160px;">
	          <col style="width:100px;">
	        </colgroup>
	        <tr class="thead">
	          <th>주문일자</th>
	          <th>이미지</th>
	          <th>상품정보</th>
	          <th>수량</th>
	          <th>상품구매금액</th>
	          <th>주문처리상태</th>
	          <th>비고</th>
	        </tr>
	        <%if(oList.isEmpty()) {%>
	      	<tr>
	      		<td colspan='7'>
	      			<p>주문하신 상품이 존재하지 않습니다.</p>
	      		</td>
	      	</tr>
	        <%}else { %>
	        	<%for(Order o : oList) {
	        	oNo=o.getOrderNo();%>
	        <tr>
	          <td><%=o.getOrderDate() %></td>
	          <td><img style="width:200px;,height:200px;" src=<%=o.getProductThumbnail() %>></td>
	          <td>
	          	<p><%=o.getProductName() %></p>
	          	<p><%=o.getProductContent() %></p>
	          </td>
	          <td class="2"><%=o.getOrderMount() %></td>
	          <td><%=o.getProductPrice() %></td>
	          <td class="deliveryStatus"><%=o.getOrderStatus() %></td>
	          <%if(o.getOrderStatus().equals("주문대기")) {%>
	          <td>
	          	<button class="remove" onclick="location.replace('<%=request.getContextPath()%>/mypage/orderRemove?no=<%=o.getOrderNo() %>')">주문 취소</button>
	          </td>
	          <%} else{ %>
	          <td>고민중</td>
	          <%} %>
	        </tr>
	        	<%} %>
	      <%} %>
	      </table>
	    </div>
	    <div class="contents"  id="mysidemenu2">
	      <table class="myborder">
	        <caption><h2>내 게시글</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:auto;">
	          <col style="width:70px;">
	          <col style="width:150px;">
	          <col style="width:160px;">
	        </colgroup>
	        <tr class="thead">
	          <th>번호</th>
	          <th>제목</th>
	          <th>작성내용</th>
	          <th>작성자</th>
	          <th>작성일</th>
	        </tr>
	        <%if(prList.isEmpty()) {%>
	        <tr>
	        	<td colspan='5'>
	      			<p>현재 존재하는 게시글이 없습니다.</p>
	      		</td>
	      	</tr>
	        <%}else{ %>
	        	<%for(ProductReview pr : prList) {%>
	        <tr>
	          <td><%=pr.getReviewtNo()%></td>
	          <td><%=pr.getReviewTitle() %></td>
	          <td><%=pr.getReviewContent() %></td>
	          <td><%=pr.getReviewWriter() %></td>
	          <td><%=pr.getReviewWriteDate() %></td>
	        </tr>
	        	<%} %>
	        
	      <%} %>
      	</table>
	    </div>
	    <div class="contents"  id="mysidemenu3">
	      <table class="myborder">
	        <caption><h2>나의 커스텀</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:auto;">
	          <col style="width:70px;">
	          <col style="width:150px;">
	          <col style="width:160px;">
	        </colgroup>
	        <tr class="thead">
	          <th>번호</th>
	          <th>제목</th>
	          <th>재료 및 내용</th>
	          <th>만든이</th>
	          <th>작성일</th>
	          <th>좋아요</th>
	        </tr>
	        <%if(cpList.isEmpty()) {%>
	        <tr>
		      	<td colspan='6'>
		      		<p>회원님이 만드신 커스텀이 존재하지 않습니다.</p>
		      	</td>
		      </tr>
	      <%} else {%>
	        	<%for(CustomPost cp : cpList) {%>
	        <tr>
	          <td id="<%=cp.getcIdx()%>" class="5"><%=cp.getcIdx() %></td>
	          <td class="123" id="<%=cp.getcIdx()%>" style="cursor:pointer;"><%=cp.getTitle() %></td>
	          <td><%=cp.getContent() %></td>
	          <td><%=cp.getMemberId() %></td>
	          <td><%=cp.getWriteDate() %></td>
	          <td><%=cp.getLikeCount() %></td>
	        </tr>
	        	<%} %>
	      <%} %>
	      </table>
	    </div>
	    <div class="contents" id="mysidemenu4">
	      <table class="myborder">
	        <caption><h2>1:1 문의</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:auto;">
	          <col style="width:70px;">
	          <col style="width:150px;">
	          <col style="width:160px;">
	        </colgroup>
	        <tr class="thead">
	          <th>분류</th>
	          <th>제목</th>
	          <th>문의 내용</th>
	          <th>작성자</th>
	          <th>날짜</th>
	          <th>답변상태</th>
	        </tr>
	        <%if(iList.isEmpty()) {%>
	        <tr>
	      	<td colspan='6'>
	      		<p>회원님이 문의하신 내용이 없습니다.</p>
	      	</td>
	      </tr>
	      <%}else{ %>
	        	<%for(Inquiry i : iList) {%>
		        <tr>
		          <td><%=i.getInquiryType() %></td>
		          <td><%=i.getInquiryTitle() %></td>
		          <td><%=i.getInquiryContent() %></td>
		          <td><%=i.getInquiryWriter() %></td>
		          <td><%=i.getInquiryWriteDate() %></td>
		          <td><%=i.getCommentStatus() %></td>
		        </tr>
	        	<%} %>
	      <%} %>
		</table>
	    </div>
	  </div>
	</div>
</section>
<script>
	//사이드바 스크롤
	$(document).ready(function() {
		$(".sidebarnav").scrollFollow({
			speed : 500, // 꿈지럭 거리는 속도
			offset : 200
		// 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
		});
	});
	//사이드바 호버시 색 변경 
	$(".mysidemenu").click(e=>{
    	   $(".mysidemenu").children().removeClass();
    	  $(e.target).next().addClass("bars");
    	  $(e.target).addClass("underbar");
       })
     //버튼 클릭시 이동
	function move(seq){
			var head = $("#menu").height();
        	var offset = $("#mysidemenu" + seq).offset();
            $('html, body').animate({scrollTop : offset.top-head},400);
        }
	//총 주문량
	$(function(){
		let b=0;
		$(".2").each((i,v)=>{
			let a=Number($(v).html());
			b+=a;
		})
		$("#1").html(b);
	})
	
	
 	$(function(){
 		let count=0;
 		let w =0; 
 		let e =0;
 		let r =0;
 		let t =0;
 			let b=$(".count");
 		$(".deliveryStatus").each((i,v)=>{
 			let status= $(v).html();
			if(status == '주문대기'){
				count++;
 			}
			if(status=='주문완료'){
				w++;
			}
			if(status=='배송준비'){
				e++;
			}
			if(status=='배송중'){
				r++;
			}
			if(status=='배송완료'){
				t++;
			}
 		});
 				b[0].innerHTML=count;
 				b[1].innerHTML=w;
 				b[2].innerHTML=e;
 				b[3].innerHTML=r;
 				b[4].innerHTML=t;
//  				console.log($(b[1]).html());
//  		console.log($(b[0]).html());
 	});
// 	$(".5").each((i,v)=>{
// 		console.log($(v).attr("id"));
// 	})

	$(".123").click(e=>{
		location.assign("<%=request.getContextPath()%>/custom/customView?no="+$(e.target).attr("id"));
	})
</script>


<%@include file="/view/common/footer.jsp"%>








