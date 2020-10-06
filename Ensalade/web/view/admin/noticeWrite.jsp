<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<section>
	<div id="notice-container">
		<h2>공지사항 작성</h2>
		<form action="<%=request.getContextPath() %>/admin/noticeWriteEnd"
			method="post" enctype="multipart/form-data">
			<table id="tbl-notice">
				<tr>
					<th>제 목</th>
					<td><input type="text" name="title" required></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"
						value="<%=loginMember.getMemberName()%>" readonly></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upload"></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="5" cols="40" name="content"></textarea></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="등록하기" onclick="">
					</th>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="/view/common/footer.jsp"%>