<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>
<div id="error">
<h1>찾는 페이지가 없습니다.</h1>
	<button onclick="loc();" id="btn">돌아가기</button>

</div>
</body>
</html>
<style>
	#error{
		text-align:center;
		margin-top:200px;
	}
	#btn{
		background-color: #27b06e;
    border-radius: 5px;
    border: 1px solid #fff;
    color: honeydew;
    width: 20%;
    height: 40px;
    margin-top: 10px;
	}
</style>
<script>
	function loc(){
		location.replace("<%=request.getContextPath()%>");
	}
</script>