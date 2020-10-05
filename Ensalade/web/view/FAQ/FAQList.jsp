<%@page import="com.en.FAQ.model.vo.FAQ"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/common/header.jsp"%>

<%
	List<FAQ> list = (List) request.getAttribute("list");
	
%>
<style>
	section {padding-top: 100px; height:auto;}	
	section#FAQ-container {	width: 600px;	margin: 0 auto;	text-align: center; height:575px; min-height: 100%; position: relative; padding-bottom: 200px;}
	section#FAQ-container h2 {	margin: 10px 0;}
	div#faq-container{ width:100%;height:400px;}
	div#tbl-FAQ {width:60%; margin: 0 auto;	border: 1px solid ivory; border-collapse: collapse;}
	div#tbl-FAQ div, div#tbl-notice p {	border: 1px solid ivory;	padding: 5px 0;	text-align: center;}
	div#tbl-notice p{font-size: 50px;} 
	div#tbl-FAQ div#faq-title{width:100%; height:30px; background-color: olive; cursor:pointer;}
	div#tbl-FAQ div#faq-title+p{display:none; width:100%; height:auto; }
	
</style>
<script type="text/javascript">
	$(function (){
		$("div#faq-title").click(function(){
			$(this).next().slideToggle(500);
		})
	})
</script>

<section style="text-align:center; id="FAQ-container">
	<h2>자주하는 질문</h2>
	<div id="faq-container">
		<div id="tbl-FAQ">
			<%if (list != null) {
				for (FAQ f : list) {%>
			<div id="faq-title"><%=f.getFaqQuestion()%></div>
			<p><%=f.getFaqAnswer()%></p>
				<%}
			}%>
		</div>
	</div>
</section>


<%@include file="/view/common/footer.jsp"%>