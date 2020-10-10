<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/view/common/header.jsp"%>
<style>
	section {padding-top: 100px; height:auto;}	
	section#inquiry-container {height:100%; width: 600px;margin: 0 auto;text-align: center;}
	section#inquiry-container h2 {margin: 10px 0;}
	div#inquiry-container{position:relative width:100%;height:575px;}
</style>
<section>
	<section id="container">
	<form action="<%=request.getContextPath()%>/Product/ProductReviewInsertSevlet?productNo=<%=request.getParameter("productNo")%>"
		method="post" enctype="multipart/form-data">
		<h2>상품후기</h2>
		<div id="inquiry-container">
			<div id="writer">
				
				<input type="hidden"  name="ReviewWriter" value="<%=loginMember.getMemberId()%>" readonly >
			</div>
			<div id="title">
				제목 <input type="text" name="ReviewTitle" placeholder="제목을 입력해주세요" >
			</div>
			<div id="content">
				내용
				<textarea name="ReviewContent" cols="30" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
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

</section>
<%@ include file="/view/common/footer.jsp"%>