<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/loginForm.css">
<%
	String loc=(String)request.getAttribute("loc");
	
%>


<section class="contents-wrap" id="contents-wrap">
    <% if(loc==null){%>
    <form class="login-form" action="<%=request.getContextPath()%>/loginjoin/login.do" method='post'></form>
        <%}else{ %>
        <form action="<%=request.getContextPath()%>/loginjoin/login.do?loc=<%=loc %>" method='post'>
            <%} %>
            <div class="login-form_title">
                <p>Ensalade</p>
            </div>
            <div class="login-form_subtitle">
                <p>로그인</p>
            </div>
            <div class="login-textbox">
                <div class="id-textbox content_row"><input type="text" class="form-control_input form2" name="userId"
                        id="userId_" placeholder="아이디 입력"><br></div>
                <div class="pw-textbox content_row"><input type="password" class="form-control_input form2"
                        name="password" id="password_" placeholder="비밀번호 입력"><br></div>
            </div>
            <div class="login-btnbox content_row">
                <input type="submit" class="form-control_input_btn" value="로그인">
            </div>
            <div class="login-findbox content_row" >
                <div class="">
                    <a type="button" class="" href="<%=request.getContextPath()%>/view/search/searchId.jsp">아이디 찾기</a>
                    <a type="button" class="" href="<%=request.getContextPath()%>/view/search/searchPw.jsp">비밀번호 찾기</a><br>
                </div>
                <div class="">
                    <a type="button" class="" href="<%=request.getContextPath()%>/view/join.jsp">회원가입</a><br>
                </div>
            </div>
        </form>
</section>

<%-- <%@include file="/view/common/footer2.jsp"%> --%>
<script>
     $(".form2").focus(e=> {
        $(e.target).css("outline-color","#27b06e");
     });
</script>


