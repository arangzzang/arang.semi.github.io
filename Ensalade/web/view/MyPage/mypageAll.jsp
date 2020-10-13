<%@page import="com.en.inquiry.model.service.InquiryService"%>
<%@page import="com.en.order.model.service.OrderService"%>
<%@page import="com.en.product.model.service.ProductService"%>
<%@page import="com.en.custom.model.service.CustomService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollfollow.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageAll.css">
<section style="text-align:center;">
<%@page import="java.util.List,com.en.order.model.vo.Order
				,com.en.product.model.vo.ProductReview,com.en.custom.model.vo.CustomPost
				,com.en.inquiry.model.vo.Inquiry"  %>
<%
	List<Order> oList = new OrderService().myPage(loginMember.getMemberId());
	List<ProductReview> prList = new ProductService().myPage(loginMember.getMemberId());
	List<CustomPost> cpList =new CustomService().customList();
	List<Inquiry> iList = new InquiryService().searchMemberInquiry(loginMember.getUser_no());
%>
			
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
	      <p><%=oList %></p>
	    </div>
	  </div>
	  <div class="status">
	    <h3>배송현황</h3>
	    <ul>
	      <li>
	        주문 대기
	        <span>></span>
	      </li>
	      <li>
	        주문 완료
	        <span>></span>
	      </li>
	      <li>
	        배송 준비
	        <span>></span>
	      </li>
	      <li>
	        배송 중
	        <span>></span>
	      </li>
	      <li>
	        배송 완료
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
	          	<a class="mysidemenu">
	          	<span class="underbar">주문 내역</span>
	          	<span></span>
	          </a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu">
	          		<span class="underbar">내 게시글</span>
	          		<span></span>
	          	</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu">
	          		<span class="underbar">1:1문의</span>
	          		<span></span>
	          	</a>
	          </li>
	          <li class="sidemenu">
	          	<a class="mysidemenu">
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
	    <div class="contents">
	      <table class="orderHistory">
	        <caption><h2>주문 내역</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:350px;">
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
	          <th>비고 (취소/교환/반품)</th>
	        </tr>
	        <%if(oList != null) {%>
	        	<%for(Order o : oList) {%>
	        <tr>
	          <td><%=o.getOrderDate() %></td>
	          <td><%=o.getProductThumbnail() %></td>
	          <td>
	          	<p><%=o.getProductName() %></p>
	          	<p><%=o.getProductContent() %></p>
	          </td>
	          <td><%=o.getOrderMount() %></td>
	          <td><%=o.getProductPrice() %></td>
	          <td><%=o.getOrderStatus() %></td>
	          <td>
	          	<button>취소</button>
	          	<button>교환</button>
	          	<button>반품</button>
	          </td>
	        </tr>
	        	<%} %>
	      </table>
	        <%}else{ %>
	      <p>주문하신 상품이 존재하지 않습니다.</p>
	      <%} %>
	    </div>
	    <div class="contents">
	      <table class="myborder">
	        <caption><h2>내 게시글</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:350px;">
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
	        <%if(prList != null) {%>
	        	<%for(ProductReview pr : prList) {%>
	        <tr>
	          <td><%=pr.getReviewtNo()%></td>
	          <td><%=pr.getReviewTitle() %></td>
	          <td><%=pr.getReviewContent() %></td>
	          <td><%=pr.getReviewWriter() %></td>
	          <td><%=pr.getReviewWriteDate() %></td>
	        </tr>
	        	<%} %>
	      </table>
	        <%}else{ %>
	      <p>현재 존재하는 게시글이 없습니다.</p>
	      <%} %>
	    </div>
	    <div class="contents">
	      <table class="myborder">
	        <caption><h2>나의 커스텀</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:350px;">
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
	        <%if(cpList != null) {%>
	        	<%for(CustomPost cp : cpList) {%>
	        <tr>
	          <td><%=cp.getcIdx() %></td>
	          <td><%=cp.getTitle() %></td>
	          <td><%=cp.getContent() %></td>
	          <td><%=cp.getMemberId() %></td>
	          <td><%=cp.getWriteDate() %></td>
	          <td><%=cp.getLikeCount() %></td>
	        </tr>
	        	<%} %>
	      </table>
	      <%} else {%>
	      <p>회원님이 만드신 커스텀이 존재하지 않습니다.</p>
	      <%} %>
	    </div>
	    <div class="contents">
	      <table class="myborder">
	        <caption><h2>1:1 문의</h2></caption>
	        <colgroup>
	          <col style="width :160px;">
	          <col style="width:100px;">
	          <col style="width:350px;">
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
	        <%if(iList != null) {%>
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
	      </table>
	      <%}else{ %>
	      <p>회원님이 문의하신 내용이 없습니다.</p>
	      <%} %>
	    </div>
	  </div>
	</div>

</section>

<script>
	//사이드바 스크롤
	$(document).ready(function(){
	    $(".sidebarnav").scrollFollow({
	        speed : 500,    // 꿈지럭 거리는 속도
	        offset : 200     // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
	    });
	});
	//
	
</script>

<%@include file="/view/common/footer.jsp"%>








