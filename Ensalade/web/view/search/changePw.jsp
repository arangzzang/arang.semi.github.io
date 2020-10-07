<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	String check=(String)request.getAttribute("check");
	if(check==null){
		response.sendRedirect(request.getContextPath()+"/view/search/checkPage.jsp");
	}
%>

<div class=search_all>
	<div class="search">
		<div class="search_body">
			<div class="search_1">
				<h2>비밀번호 변경</h2>
				<p>입력 해주세요</p>
			</div>
			<div class="search_form">
				<form class="form1" method="post" action="<%=request.getContextPath()%>/updatePw">
					<input type="text" class="form2" placeholder="아이디를 입력하세요." name="userId">
					<input name="newPw" type="password" class="form2" placeholder="새로운 비밀번호 입력" id="newPw1">
					<input name="newPwCheck" type="password" class="form2" placeholder="비밀번호 재입력" id="newPw2">
					
					<button type="submit" class="form3">요청</button>
				</form>
			</div>
		</div>
	</div>
</div>

<style>
		.form3{
		height: 40px;
    	border-radius: 3px;
    	border: 1px solid #e7e7e7;
    	background-color:#27b06e;
    	color:white;
    	font-weight:600;
    	font-size: 15px;
    	max-width:340px;
    	margin-top:10px;
		}
		.form2{
		height: 40px;
    	border-radius: 3px;
    	border: 1px solid #e7e7e7;
    	margin-bottom: 15px;
    	font-size: 15px;
    	max-width:340px;
		}
		.form1{
		padding: 40px 0px 0px;
		display:grid;
		min-width:330px;
		margin:0 auto;
		}
		
		.search_all{
		margin:0 auto;
		padding: 50px 0px 0px;
		}
		
		.search{
		padding: 50px 100px 100px;
		width: 50%;
    	margin: 0 auto;
		}
		.search_body{
		
		}
		.search_1{
		text-align:center;
		}
		.search_form{
		display:grid;
		}
		.form3:hover{
		background-color:#3B966E;
		}
	</style>
	
	 <script>
     $(".form2").focus(e=>{
    	 $(e.target).css("outline-color","#27b06e");
     })
     
     $("#newPw").blur(e => {
		let pw = $("#newPw").val();
		let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if (!regPw.test(pw)) {
			alert("비밀번호 4~13글자로 작성하고 숫자, 문자");
			$("#newPw").val("");
		}
	});

	$("#newPwCheck").blur(e => {
		let pw = $("#newPw").val();
		let pw2 = $("#newPwCheck").val();
		if (pw != pw2) {
			alert('비밀번호가 일치하지 않습니다.');
			$("#newPw").val("");
			$("#newPwCheck").val("");
		}
	});
	
	$(function(){
		let a=<%=check%>;
		if(a!='check'){
			alert("입력한 정보가 없습니다.");
		}
	})
     
     
     </script>

<%@ include file="/view/common/footer2.jsp"%>