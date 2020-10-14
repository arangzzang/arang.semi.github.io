<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/notice/noticeWrite.css">
<section class="contents-wrap">
        <div id="notice-container">
        	<form action="<%=request.getContextPath()%>/admin/noticeWriteEnd" method="post" enctype="multipart/form-data">
	            <div class="">
	                <h2>게시판 글쓰기</h2>
	            </div>
	            <div class="notice-view_area">
	                <table class="notice-view_table" id="tbl-notice">
	                    <caption>게시판 글쓰기</caption>
	                    <colgroup>
	                        <col style="width: 130px;">
	                        <col style="width: auto;">
	                    </colgroup>
	                    <tr>
	                        <th>제 목</th>
	                        <td>
	                            <div class="update-input_wrap">
	                                <input class="update-input form2" type="text" name="title" required>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>작성자</th>
	                        <td><div class="update-input_wrap">
	                                <input class="update-input" type="text" value="<%=loginMember.getMemberId() %>" name="writer" required>
	                            </div></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <ul class="etcArea">
	                                <!-- <li><strong>작성일</strong><span class="txtD"><input type="date"></span></li> -->
	                            </ul>
	                            <div class="detail">
	                                <p style="border-top: 1px solid #eaeaea;">
	                                <!-- 블로그처럼 글&이미지 수정하는 기능 구현필요 -->
	                                    <textarea class="form-control form2" name="content" cols="60" rows="5" style="resize: none;" required></textarea>
						        </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>첨부파일</th>
	                        <td><input type="file" name="upload"></td>
	                    </tr>
	                </table>
	                <div class="noticeV-button">
	                    <span class="gLeft">
	                        <div><input class="form-control_input_btn" type="button" value="목록" id=""></div>
	                    </span>
	                    <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
	                    <span class="gRight">
	                        <div style="display: flex;margin-right: 20px;">
	                            <input class="form-control_input_btn padd" type="submit" value="글 쓰기">
	                        </div>
	                    </span>
	                    <%} %>
	                </div>
	            </div>
            </form>
        </div>
    </section>

<script type="text/javascript">
 
$(".form2").focus(e=>{
   $(e.target).css("border","none");
   $(e.target).css("outline-color","#27b06e");
}); 
$(" .update-input").focus(e=>{
   $(e.target).css("border","none");
   $(e.target).css("outline-color","#27b06e");
}); 
</script>

<%@ include file="/view/common/footer.jsp"%>