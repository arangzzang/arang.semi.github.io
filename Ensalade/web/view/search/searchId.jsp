<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>


<div class=search_all>
	<div class="search">
		<div class="search_body">
			<div class="search_1">
				<h2>아이디 찾기</h2>
				<p>입력 해주세요</p>
			</div>
			<div class="search_form">
				<form class="form1" action="<%=request.getContextPath()%>/search/searchIdPw">
					<input type="text" class="form2" placeholder="이름을 입력하세요." name="userName"><input name="email" type="text" class="form2" placeholder="이메일을 입력하세요.">
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
     
     </script>

<%@ include file="/view/common/footer2.jsp"%>