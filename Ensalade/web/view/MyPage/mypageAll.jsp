<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageAll.css">
<section style="text-align:center;">
<%@page import="java.util.List,com.en.product.model.vo.Product,com.en.notice.model.vo.NoticeBoard"  %>
<%
	
%>
			
	<!--마이페이지 헤드공용-->
	<div class="mypageHead">
	  <div class="headfix">
	    <div>
	      <h4>회원성명</h4>
	      <p>회원 이메일</p>
	    </div>
	    <div>
	      <h4>적립금</h4>
	      <p>1,000</p>
	    </div>
	    <div>
	      <h4>총 주문</h4>
	      <p>0</p>
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
	          <li>주문 내역</li>
	          <li>내 게시글</li>
	          <li>나의 커스텀</li>
	          <li>1:1문의</li>
	          <li>로그아웃</li>
	          <li>회원 정보 수정</li>
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
	        <tr>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	        </tr>
	      </table>
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
	          <th>분류</th>
	          <th>제목</th>
	          <th>작성자</th>
	          <th>작성일</th>
	          <th>조회</th>
	        </tr>
	        <tr aria-colspan="6">
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	        </tr>
	      </table>
	      <p>여긴 게시글</p>
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
	          <th>분류</th>
	          <th>커스텀이름</th>
	          <th>만든이</th>
	          <th>좋아요</th>
	          <th>조회</th>
	        </tr>
	        <tr aria-colspan="6">
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	        </tr>
	      </table>
	      <p>여긴 게시글</p>
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
	          <th>이미지</th>
	          <th>제목</th>
	          <th>작성자</th>
	          <th>날짜</th>
	          <th>답변상태</th>
	        </tr>
	        <tr aria-colspan="6">
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td></td>
	        </tr>
	      </table>
	      <p>여긴 게시글</p>
	    </div>
	  </div>
	</div>

</section>

<%@include file="/view/common/footer.jsp"%>