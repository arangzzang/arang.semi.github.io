<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>


<style>
	section{padding: 150px;}
</style>

<section>
	<form action="<%=request.getContextPath()%>/loginjoin/login.do"
		method='post'>
		<h4>Ensalade</h4>
		<h2>로그인</h2>
		<input type="text" name="userId" id="userId_" placeholder="아이디 입력"><br>
		<input type="password" name="password" id="password_"
			placeholder="비밀번호 입력"><br> <input type="submit"
			value="로그인"> <input type="button" value="회원가입"
			onclick=location.assign(
			"<%=request.getContextPath()%>/view/join.jsp")><br> <input
			type="button" value="아이디 찾기"> <input type="button"
			value="비밀번호 찾기"><br> <input type="button"
			value="네이버 로그인">




	</form>
	<%-- <button onclick=location.assign("<%=request.getContextPath() %>/view/join.jsp") id="join">회원가입</button>
	
    <button onclick="" id="findId">아이디 찾기</button>
    <button onclick="" id="findPw">비밀번호 찾기</button>
    <button onclick="" id="naverLogin">네이버계정으로 로그인</button> --%>
</section>
<%@include file="/view/common/footer.jsp"%>