<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	 String check=(String)request.getAttribute("check");
	if(check==null){
		response.sendRedirect(request.getContextPath()+"/view/search/checkPage.jsp");
	}
	String id=(String)request.getAttribute("id");
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
					<input type="hidden" value="<%=id%>" name="id2">
					<input type="text" class="form2" placeholder="아이디를 입력하세요." name="userId" style="margin-bottom:15px;">
					<input name="newPw" type="password" class="form2" placeholder="새로운 비밀번호 입력 (4글자이상 문자와 숫자 조합)" id="newPw1">
					<p id="cPw" class="mb"></p>
					<input name="newPwCheck" type="password" class="form2" placeholder="비밀번호 재입력 (4글자이상 문자와 숫자 조합)" id="newPw2">
					<p id="cPw2" class="mb"></p>
					<button type="submit" class="form3" onclick="return checkPw();">요청</button>
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
		.mb{
			margin-bottom:15px;
		}
	</style>
	
	 <script>
	 let ch=0;
     $(".form2").focus(e=>{
    	 $(e.target).css("outline-color","#27b06e");
     })
     
     $("#newPw1").keyup(e => {
		let pw = $("#newPw1").val();
		let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if(pw==""){
			$("#cPw").html("");
		}
		if (!regPw.test(pw)&&pw!="") {
			$("#cPw").attr("style","color:red;font-size:12px;");
			$("#cPw").html("사용할 수 없습니다.");
			ch=0;
			return;
		}else if(regPw.test(pw)&&pw!=""){
			$("#cPw").attr("style","color:green;font-size:12px;");
			$("#cPw").html("사용가능합니다.");
			ch=1;
		}
	});
     

	$("#newPw2").keyup(e => {
		let pw = $("#newPw1").val();
		let pw2 = $("#newPw2").val();
		let regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if(pw2==""){
 			$("#cPw2").html("");
 			return;
 		}
		if (pw != pw2) {
			$("#cPw2").attr("style","color:red;font-size:12px;");
			$("#cPw2").html("일치하지 않습니다.");
			ch=0;
			return;
		}else if(regPw.test(pw)&&pw==pw2){
			$("#cPw2").attr("style","color:green;font-size:12px;");
			$("#cPw2").html("비밀번호가 일치합니다.");
			ch=1;
		}else{
			$("#cPw2").attr("style","color:red;font-size:12px;");
			$("#cPw2").html("사용할 수 없습니다.");
			ch=0;
		}
		
	});
	
	 $(function(){
		let a=<%=check%>;
		if(a!='check'){
			alert("입력한 정보가 없습니다.");
		}
	})
     
	$("#newPw1").blur(e => {
		let pw = $("#newPw1").val();
		let pw2 = $("#newPw2").val();
		if(pw!=pw2){
			ch=0;
		}
	})
	$("#newPw2").blur(e => {
		let pw = $("#newPw1").val();
		let pw2 = $("#newPw2").val();
		if(pw!=pw2){
			ch=0;
		}
	})
	
	function checkPw(){
		console.log(ch);
		if(ch==0){
			alert('비밀번호를 확인하세요.');
			return false;
		}
			return true;
	}
     
     </script>

<%@ include file="/view/common/footer2.jsp"%>