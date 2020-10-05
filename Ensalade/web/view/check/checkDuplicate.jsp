<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String result=(String)request.getAttribute("result");
    String id=(String)request.getAttribute("id");
  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
		text-align:center;
	}
</style>
<body>

<% if(result!=null){%>
	<p> <%=id %>는 존재하는 아이디입니다.</p>
	
	<form action='<%=request.getContextPath()%>/checkDuplicate.do' method="post">
	<input type="text" id="searchId" name="userId">
	<button type="submit">중복검색</button><br>
	<input type="button" onclick="closed();" value="닫기">
	</form>
	
	<%}else{ %>
	<!--아이디 사용가능할 때  -->
	
	<p> '<%=id %>'는 사용가능합니다.</p>
	<input type="button" onclick="closed();" value="닫기">
	<%} %>
	
</body>

	<script>
		function closed(){
 			const id='<%=request.getParameter("userId")%>';
			opener.document.getElementById("userId_").value=id;
			close();
			console.log(123);
		}
	</script>
</html>