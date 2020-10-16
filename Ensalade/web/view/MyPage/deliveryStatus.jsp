<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
    
<%
	if(loginMember==null){
		response.sendRedirect(request.getContextPath()+"/view/login.jsp");
		return;
	}
    
%>


<section  id="sldkfj"style="text-align:center">
		<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
	        <div class="form-group">
	          <label for="t_key">API key</label>
	          <input type="hidden" class="form-control" id="t_key" name="t_key" placeholder="제공받은 APIKEY" value="FY9TYuX2AZzjrZhU8WNnLQ">
	        </div>
	        <div class="form-group">
	          <label for="t_code">택배사 코드</label>
	          <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
	        </div>
	        <div class="form-group">
	          <label for="t_invoice">운송장 번호</label>
	          <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
	        </div>
        	<button type="submit" class="btn btn-default">조회하기</button>
    </form>
</section>

<style>
#sldkfj{
	margin-top: 50px;
}
.form-group:nth-child(1){
	display:none;
	visibility:hidden;
}

</style>

<%@include file="/view/common/footer.jsp"%>