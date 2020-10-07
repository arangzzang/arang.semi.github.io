<%@page import="com.en.notice.model.vo.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	NoticeBoard nb = (NoticeBoard)request.getAttribute("nb");
%>

<section class="contents-wrap">
        <div id="notice-container">
            <div class="notice-title-wrap">
                <h2>공지사항 상세화면</h2>
            </div>
            <div class="notice-view_area">
                <table class="notice-view_table" id="tbl-notice">
                    <caption>게시판 상세</caption>
                    <colgroup>
                        <col style="width: 130px;">
                        <col style="width: auto;">
                    </colgroup>
                    <tr>
                        <th>제 목</th>
                        <td><%=nb.getNotice_title() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=nb.getNotice_writer() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul class="etcArea">
                                <li><strong>작성일</strong><span class="txtD"><%=nb.getNotice_write_date() %></span></li>
                                <!-- <li><strong>조회수</strong><span class="txtD">1147</span></li> -->
                            </ul>
                            <div class="detail">
                                <p style="border-top: 1px solid #eaeaea;">
                                    <%=nb.getNotice_contents() %>
                                    <img src="<%=request.getContextPath() %><%=nb.getContentImg() %>">
                                </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
                        <!-- 다운로드 서비스 구현하기 -->
                            <%if(nb.getFilepath()!=null){ %>
                                <img alt="" src="<%=nb.getFilepath()%>" width="20" height="20">
                            <%}else{%>

                            <%} %>
                        </td>
                    </tr>
                </table>
                <div class="noticeV-button">
                    <span class="gLeft">
                        <div><input class="form-control_input_btn" type="button" value="목록" id="listBack">
                        </div>
                    </span>
                    <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
                    <span class="gRight">
                        <div style="display: flex;margin-right: 20px;">
                            <input class="form-control_input_btn padd" type="button" value="수정하기" id="updateBtn">
                            <input class="form-control_input_btn padd" type="button" value="삭제하기" id="deleteBtn">
                        </div>
                    </span>
                    <input type="hidden" id="noticeNo" value="<%=nb.getNotice_no()%>">
                    <%} %>
                </div>
            </div>
        </div>
    </section>
    
<script>
	let no = $("#noticeNo").val();
	$("#updateBtn").click(e => {
		location.assign('<%=request.getContextPath()%>/admin/updateNotice?no='+no);
	});
	
	$("#deleteBtn").click(e => {
		location.assign('<%=request.getContextPath()%>/admin/deleteNotice?no='+no);
	});
	$("#listBack").click(e =>{
		location.assign('<%=request.getContextPath()%>/searchNotice');
	});
</script>

<style>
.notice-title-wrap{
	text-align: center;
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

.gLeft {
	float: left;
	text-align: left;
}

.notice-view_table .detail p {
	text-align: inherit;
}
.notice-view_table .detail {
	margin-top: -9px;
	padding: 45px 12px 55px;
	min-height: 100px;
	border-top: 1px solid #eaeaea;
	text-align: center;
}

.txtD {
	display: inline-block;
	font-size: 11px;
	color: #939393;
	word-break: normal;
}

.notice-view_table .etcArea li {
	height: 59px;
	line-height: 59px;
	padding: 0 0 0 0;
	margin: -16px 0 0;
	min-width: 140px;
	float: left;
	position: relative;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.notice-view_table .etcArea li {
	display: inline-block;
	margin: 0 0 9px;
	padding: 8px 0px 10px;
	vertical-align: top;
	line-height: 22px;
	color: #666;
}

.notice-view_table .etcArea li span.txtD {
	margin-right: 20px;
}

.notice-view_table .etcArea li strong {
	font-weight: normal;
	color: #353535;
	display: inline-block;
	width: 50px;
}

.etcArea {
	margin-left: 15px;
}

.notice-view_table {
	table-layout: fixed;
	border-collapse: collapse;
	border-spacing: 0;
	color: #555;
	line-height: 16px;
	min-width: 1100px;
}

.notice-view_area {
	padding: 39px 0 50px;
	border-top: 1px solid #cdcdcd;
}

.notice-view_area th:first-child {
	border-right: 0;
	border-left: 0;
}

.notice-view_area tbody th {
	background-color: #ffffff;
	padding: 10px 0 10px 15px;
	border: 1px solid #dfdfdf;
	border-bottom-width: 0;
	color: #353535;
	text-align: left;
	font-weight: normal;
}

.notice-view_area th {
	vertical-align: middle;
}

.notice-view_area td {
	padding: 11px 10px 10px;
	border-top: 1px solid #dfdfdf;
	border-color: #e7e7e7;
	color: #353535;
	vertical-align: middle;
	word-break: break-all;
	height: 26px;
	padding: 8px 0 8px;
}

section.contents-wrap {
	position: relative;
	top: 10px;
	margin-left: auto;
	margin-right: auto;
	max-width: 80%;
	box-sizing: border-box;
	min-height: 1px;
	padding-left: 15px;
	padding-right: 15px;
}

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

caption {
	display: none;
}
</style>

<%@ include file="/view/common/footer2.jsp"%>