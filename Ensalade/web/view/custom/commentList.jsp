<%@page import="com.en.member.model.vo.Member"%>
<%@page import="com.en.custom.model.vo.CustomComment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	List<CustomComment> list=(List)request.getAttribute("comment");
    	Member loginMember=(Member)session.getAttribute("loginMember");
    	int ref=Integer.parseInt(String.valueOf(request.getAttribute("ref")));
    %>
    
    <!-- 커스텀 상세 페이지에 댓글을 보여줄 수 있게 해주는 페이지 ajax를 사용하여 얻은 데이터는 여기서 뽑아주는 데이터를 쓴다. -->
    
    
    		<h2 class="comment-box_header">
			댓글 <span class="comment-box_header_count">16</span>
		</h2>
		<div class="comment-box_form">
			<div class="comment-box_form_input">
				<input class="comment-box_form_input_text" type="text"
					placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="text_" name="text_">
				<div class="comment-box_form_input_action">
					<input class="comment-box_form_submit btn_" type="button" value="등록"
						class="btn_">
						<input type="hidden" name="commentLevel" id="level" value="1">
				<input type="hidden" name="commentRef" id="cRef" value="0">
				</div>
			</div>
		</div>
	<div class="comment-box_recomm">
		<div class="form-control_comment">
		<ul class="comment_1">
			<%if(list!=null){%>
    <%for(CustomComment c:list){ %>
    <%if(c.getCustomCommentLevel()==1){ %>
			<li class="li1">
			<article>
			<span><%=c.getCustomCommentWriter()%></span>
			<p><%=c.getCustomCommentContent() %></p>
			<button class="btn_2" id="btn_2" value="<%=c.getCustomCommentNo()%>">답글달기</button>
			</article>
			<%}else if(c.getCustomCommentLevel()==2){ %>
			<ul>
			<li>
			<article>
			<span><%=c.getCustomCommentWriter()%></span>
			<p><%=c.getCustomCommentContent() %></p>
			</article>
			</li>
			</ul>
			<%} %>
			</li>
		<%}%>
		<%}%>
		</ul>
		</div>
		<div>
		</div>
	</div>
    
		
		<script>
		 $(".btn_2").click(e=>{
			$(".li1").find(".div22").remove();
				let div=$(".comment-box_form").clone(true);
				div.find("[name=commentLevel]").val("2");
				div.find("[name=commentRef]").val(e.target.value);
				div.css("display","none");
				div.attr("class","div22");
				$(e.target).parent().after(div.slideDown(200));
				console.log(div);
				console.log($(".btn_"));
		});
		
		
		$(".btn_").click(e=>{
			console.log(123321);
			<%if(loginMember==null){%>
				location.replace("<%=request.getContextPath()%>/view/loginAlert.jsp");
			<%}%>
			$.ajax({
				url:"<%=request.getContextPath()%>/custom/cComment",
				data:{"no":'<%=ref%>','level':$(e.target).parent().find("[name=commentLevel]").val(),"writer":'<%=loginMember!=null?loginMember.getMemberId():""%>',
					"text":$(e.target).parent().parent().find("[name=text_]").val(),'cRef':$(e.target).parent().find("[name=commentRef]").val()},
				success:data=>{
					$(".comment-box").html(data);
					$("#text_").val("");
				}
				
			})
		})
		
		
		 <%-- $(".div22").find(".btn_").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/custom/cComment",
				data:{"no":'<%=ref%>','level':$(e.target).find("[name=commentLevel]").val(),
					"writer":'<%=loginMember.getMemberId()%>',"text":$(e.target).children("input[type=text]").val(),"cRef":$(e.target).find(".btn_2").val()},
				success:data=>{
					$("#comment_1").html(data);
					$("#text_").val("");
				}
				
			})
		}) --%>
		</script>