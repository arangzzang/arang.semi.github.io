<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<%
	String loc=(String)request.getAttribute("loc");
	
%>

<script>
     $(".form2").focus(e=> {
        $(e.target).css("outline-color","#27b06e");
     });
</script>

<section class="contents-wrap">
    <% if(loc==null){%>
    <form class="login-form" action="<%=request.getContextPath()%>/loginjoin/login.do" method='post'>
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
            <div class="login-findbox content_row" style="text-align:left;margin-left: 30px;">
                <div class="login-findbox_en">
                    <a type="button" class="login-findbox_en_f" href="<%=request.getContextPath()%>/view/search/searchId.jsp" style="margin-left: 110px;">아이디 찾기</a>
                    <a type="button" class="login-findbox_en_f" href="<%=request.getContextPath()%>/view/search/searchPw.jsp">비밀번호 찾기</a><br>
                </div>
                <div class="login-findbox_en">
                    <a type="button" class="login-findbox_en_f" href="<%=request.getContextPath()%>/view/join.jsp">회원가입</a><br>
                </div>
            </div>
        </form>
</section>
<style>

    a {
        text-decoration: none;
    }

    .login-findbox_en_f {
        display: inline-block;
 
    }

    .login-findbox_en {
        display: inline-block;
        padding: 3px 5px;
        /* margin: 0 100px; */
        margin-right: 60px;
    }

    .login-findbox {
        margin: 20px 0;
        text-align: center;
        color: #424242;
        font-size: 15px;
        line-height: 1.4;
        text-align: -webkit-center;
        min-width: 665px;
    }

    .button-wrap {
        display: flex;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        height: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .form-control_input_btn {
        height: 25px;
        width: 60%;
        border: solid 1px #dbdbdb00;
        display: block;
        height: 40px;
        box-sizing: border-box;
        border-radius: 4px;
        font-size: 1rem;
        font-weight: 400;
        color: #fff;
        background: #27b06e;
        cursor: pointer;
        outline: none;
    }

    .login-btnbox {
        display: block;
        padding: 0 25px;
        width: 100%;
        text-align: -webkit-center;
    }

    .login-textbox {
        display: block;
        padding: 15px 25px 0;
    }

    .content_row {
        margin-bottom: 15px;
    }

    .form-control_input {
        box-sizing: border-box;
        height: 40px;
        width: 60%;
        min-width: 250px;
        padding: 0 15px;
        line-height: 40px;
        border-radius: 4px;
        border: solid 1px #dbdbdb;
        background-color: #ffffff;
        color: #424242;
        font-size: 14px;
        font-weight: 300;

    }

    .login-form_input_text {
        max-width: 350px;

    }

    .login-form_subtitle>p {
        font-size: 25px;
        font-weight: 500;
    }

    .login-form_title>p {
        font-size: 30px;
        font-weight: 700;
    }

    .login-form {
        display: inline-block;
        width: 40%;
    }

    section.contents-wrap {
        position: relative;
        top: 100px;
        min-height: 100%;
        padding-bottom: 20px;
        text-align: center;
        margin-bottom: 50px;
    }
</style>
<%-- <%@include file="/view/common/footer.jsp"%> --%>