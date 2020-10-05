<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp"%>

<style>
	section {padding-top: 100px; height:auto;}	
	section#inquiry-container {height:100%; width: 600px;margin: 0 auto;text-align: center;}
	section#inquiry-container h2 {margin: 10px 0;}
	div#inquiry-container{position:relative width:100%;height:575px;}
</style>
<script type="text/javascript">
	
</script>
<section id="container">
	<form action="<%=request.getContextPath()%>/inquiry/inquiryWriteEnd"
		method="post" enctype="multipart/form-data">
		<h2>1:1 문의</h2>
		<div id="inquiry-container">
			<div id="type">
				질문유형 
				<select id="inquiryType" name="qType" size="1">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="교환/환불">교환/환불</option>
				</select>
			</div>
			<div id="writer">
				작성자 <!-- 테스트중....userId 얻어오기 , readonly체크 -->
				<input type="text"  name="writer" value="<%=loginMember.getMemberId()%>" readonly >
			</div>
			<div id="title">
				제목 <input type="text" name="title" placeholder="제목을 입력해주세요" >
			</div>
			<div id="content">
				내용
				<textarea name="content" cols="30" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
			</div>
			<div id="file">
				사진첨부 <input type="file" name="upload">
			</div>
			<div id="send">
				<input type="submit" value="문의하기">
			</div>
		</div>
	</form>
</section>

<%@ include file="/view/common/footer.jsp"%>