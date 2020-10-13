<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp" %>

<%
	List<Member> list = (List) request.getAttribute("list");
	String pageBar1 = (String)request.getAttribute("pageBar1");
	String type = request.getParameter("searchType");
	String key = request.getParameter("searchKeyword");	
%>	

<section class="contents-wrap">
	<div class="content-title">
        <p>회원관리</p>
    </div>
    <div class="member-wrap">
		<table class="member-table" id="tbl-notice">
			<thead class="notice-table_thead">
				<tr>
					<th>회원아이디</th>
					<th>회원이름</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>생일</th>
					<th>포인트</th>
					<th>매니저YN</th>
				</tr>
			</thead>
			<tbody>
			<%if (list.isEmpty()) {	%>
				<tr>
					<td colspan="9">존재하는 회원이 없습니다.</td>
				</tr>
			<%} else {
				for (Member m : list) {%>
				<tr>
					<td><%=m.getMemberId()%></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getMemberGender()%></td>
					<td><%=m.getMemberPhone()%></td>
					<td><%=m.getMemberAddress()%></td>
					<td><%=m.getEmail()%></td>
					<td><%=m.getBirthday()%></td>
					<td><%=m.getPoint()%></td>
					<td><%=m.getMangerYn()%></td>
				</tr>
			<%}}%>
			</tbody>
		</table>
	</div>
	<div class="search-form">
		<div class="search-form_wrap">
		<span>검색타입 : </span> <select id="searchType" class="form-control">
			<option value="member_name"
				<%=type != null && type.equals("member_name") ? "selected" : ""%>>이름</option>
			<option value="member_id"
				<%=type != null && type.equals("member_id") ? "selected" : ""%>>아이디</option>
			<option value="brithday"
				<%=type != null && type.equals("brithday") ? "selected" : ""%>>생일</option>
			<option value="manager_yn"
				<%=type != null && type.equals("manager_yn") ? "selected" : ""%>>매니저</option>
		</select></div>
		
		<div id="search_member_name">
			<form id="formCss"
				action="<%=request.getContextPath()%>/admin/memberAll">
				<input type="hidden" name="searchType" value="member_name">
				<div class="formCss-submit-wrap">
					<input class="form-control" id="inputMember" type="text" name="searchKeyword" placeholder="이름검색" size="25"
						value="<%=key != null && type != null && type.equals("member_name") ? key : ""%>">
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
		<div id="search_member_id">
			<form id="formCss"
				action="<%=request.getContextPath()%>/admin/memberAll">
				<input type="hidden" name="searchType" value="member_id">
				<div class="formCss-submit-wrap">
					<input class="form-control" id="inputMember" type="text" name="searchKeyword" placeholder="아이디검색" size="25"
						value="<%=key != null && type != null && type.equals("member_id") ? key : ""%>">
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
		<div id="search_brithday">
			<form id="formCss"
				action="<%=request.getContextPath()%>/admin/memberAll">
				<input type="hidden" name="searchType" value="brithday">
				<div class="formCss-submit-wrap">
					<input class="form-control" id="inputMember" type="text" name="searchKeyword" placeholder="생일검색" size="25"
						value="<%=key != null && type != null && type.equals("brithday") ? key : "YY/MM/DD"%>">
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
		<div id="search_manager_yn">
			<form id="formCss"
				action="<%=request.getContextPath()%>/admin/memberAll">
				<input type="hidden" name="searchType" value="manager_yn">
				<div class="formCss-submit-wrap">
					<select>
						<option>Y</option>
						<option>N</option>
					</select>
					<%-- <input class="form-control" id="inputMember" type="text" name="searchKeyword" placeholder="Y/N" size="25"
						value="<%=key != null && type != null && type.equals("manager_yn") ? key : "Y/N"%>"> --%>
					<button class="formCss-submit-btn" id="submitCss" type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>
	<div id="pagebar2"><%=pageBar1%></div>
	<%-- 
	<div class="noticeV-button">
         <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
         <span class="gRight">
             <div style="display: flex;margin-right: 20px;">
                 <input class="form-control_input_btn padd" type="button" value="글쓰기" id="writeBtn">
             </div>
         </span>
         <%} %>
     </div> --%>
     
     
	<script type="text/javascript">
		let pagebar=$("#pageBar")

		$(function(){
			let name=$("#search_member_name");
			let id=$("#search_member_id");
			let birth=$("#search_brithday");
			let manager=$("#search_manager_yn");
			
			$("#searchType").change(e=>{
				name.css("display","none");
				id.css("display","none");
				birth.css("display","none");
				manager.css("display","none");
				let s=$(e.target).val();
				$("#search_"+s).css("display","inline-block");
			});
		});
		$(function(){$("#searchType").change()});
		
		$("#writeBtn").click(e =>{
			location.assign('');
		});
	</script>
</section>

<style type="text/css">
.form-control_input_btn {
	height: 25px;
	width: 100px;
	height: 25px;
	box-sizing: border-box;
	border-radius: 4px;
	font-size: 14px;
	font-weight: 400;
	cursor: pointer;
	border-style: none;
	font-weight: inherit;
}
.padd {
	margin-right: 10px;
}

.noticeV-button {
	margin: 10px 0 40px;
	font-size: 0;
	padding: 20px 0;
	text-align: center;
	margin: 0 50px;
}

.gRight {
	float: right;
	text-align: right;
}

.search-form_wrap>span {
	font-size: 17px;
	padding: 2px 10px;
}

.search-form_wrap, .formCss-submit-wrap {
	margin: 0 10px;
}

body {
	position: relative;
}

.formCss-submit-wrap {
	display: flex;
}

.form-control {
	display: block;
	box-sizing: border-box;
	padding: 0 15px;
	line-height: 6px;
	border-radius: 2px;
	border: solid 1px #dbdbdb;
	background-color: #ffffff;
	color: #424242;
	font-size: 13px;
	height: 30px;
}

.formCss-submit-btn {
	border-radius: 2px;
	border: solid 1px #dbdbdb;
	background-color: #dbdbdbaf;
	color: #535353;
	font-size: 12px;
	height: 30px;
	width: 30px;
}

section.contents-wrap {
	padding-top: 100px;
	height: auto;
	margin: 0 auto;
	text-align: center;
}

table.table {
	position: absolute;
	top: 200px;
	left: 160px;
}

table#tbl-notice {
	width: 80%;
	margin: 0 auto;
	border: solid 1px #dbdbdb;
	border-collapse: collapse;
}
table#tbl-notice td:nth-child(5){width:30px}

table#tbl-notice th, table#tbl-notice td {
	border: 1px solid #dbdbdb;
	padding: 5px 0;
	text-align: center;
}

div#search_notice_title {
	display: inline-block;
}

div#search_notice_write_date {
	display: none;
}

.content-title {
	height: 60px;
}

.content-title>p {
	font-size: 30px;
	font-weight: 700;
}

.member-table {
	min-width: 100%;
	border: 0;
	border-spacing: 0;
	table-layout: fixed;
}

.member-table_thead {
	background-color: #dbdbdbaf;
}

.member-wrap {
	padding-bottom: 30px;
	margin: 0 50px;
}

.search-form {
	display: flex;
	justify-content: center;
	position: relative;
}

.search-form_wrap {
	display: flex;
}
</style>

<%@ include file="/view/common/footer.jsp" %>