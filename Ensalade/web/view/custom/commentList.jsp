<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="java.text.SimpleDateFormat"%>
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
			댓글 <span class="comment-box_header_count"><%=new CustomService().commentCount(ref) %></span>
		</h2>
		<div class="comment-box_form">
			<div class="comment-box_form_input">
				<input class="comment-box_form_input_text" type="text"
					placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="text_" name="text_">
				<div class="comment-box_form_input_action">
					<input class="comment-box_form_submit btn_" type="button" value="등록">
						<input type="hidden" name="commentLevel" id="level" value="1">
				<input type="hidden" name="commentRef" id="cRef" value="0">
				</div>
			</div>
		</div>
	<div class="comment-box_recomm">
			<%if(!list.isEmpty()){%>
		<div class="form-control_comment">
		<ul class="comment_1">
    <%for(CustomComment c:list){ %>
    <%SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String a=sdf.format(c.getCustomCommentDate());%>
    <%if(c.getCustomCommentLevel()==1){ %>
			<li class="li1">
			<article class="cBox_">
			<div class="smile">	
			<svg class="svgcolor" aria-hidden="true" focusable="false" data-prefix="far" data-icon="smile" class="svg-inline--fa fa-smile fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512"><path fill="currentColor" d="M248 8C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm0 448c-110.3 0-200-89.7-200-200S137.7 56 248 56s200 89.7 200 200-89.7 200-200 200zm-80-216c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32zm160 0c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32zm4 72.6c-20.8 25-51.5 39.4-84 39.4s-63.2-14.3-84-39.4c-8.5-10.2-23.7-11.5-33.8-3.1-10.2 8.5-11.5 23.6-3.1 33.8 30 36 74.1 56.6 120.9 56.6s90.9-20.6 120.9-56.6c8.5-10.2 7.1-25.3-3.1-33.8-10.1-8.4-25.3-7.1-33.8 3.1z"></path></svg>
			</div>
			<div class="cContent_">
			<span class="user_"><%=c.getCustomCommentWriter()%></span>
			<span class="content_"><%=c.getCustomCommentContent() %></span>
			<div style="margin-bottom: 10px;">
			<content>·</content>
			<span class="time_ time_font"><%=a%></span>
			<button class="btn_2" value="<%=c.getCustomCommentNo()%>"><content>·</content>답글달기</button>
			</div>
			</div>
			</article>
			<%}else if(c.getCustomCommentLevel()==2){ %>
			<ul>
			<li>
			<article class="cBox_ level2_">
			<div class="smile">
			<svg class="svgcolor" aria-hidden="true" focusable="false" data-prefix="far" data-icon="smile" class="svg-inline--fa fa-smile fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512"><path fill="currentColor" d="M248 8C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm0 448c-110.3 0-200-89.7-200-200S137.7 56 248 56s200 89.7 200 200-89.7 200-200 200zm-80-216c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32zm160 0c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32zm4 72.6c-20.8 25-51.5 39.4-84 39.4s-63.2-14.3-84-39.4c-8.5-10.2-23.7-11.5-33.8-3.1-10.2 8.5-11.5 23.6-3.1 33.8 30 36 74.1 56.6 120.9 56.6s90.9-20.6 120.9-56.6c8.5-10.2 7.1-25.3-3.1-33.8-10.1-8.4-25.3-7.1-33.8 3.1z"></path></svg>
			</div>
			<div class="cContent_">
			<span class="user_"><%=c.getCustomCommentWriter()%></span>
			<span class="content_"><%=c.getCustomCommentContent() %></span>
			<div>
			<content>·</content>
			<span class="time_ time_font"><%=a%></span>
			</div>
			</div>
			</article>
			</li>
			</ul>
			<%} %>
			</li>
		<%}%>
		</ul>
		</div>
		<%}%>
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
				div.attr("class","div22 width1");
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
		
		$(function(){
		$(".time_").each((i,v)=>{
			   let t=$(v).html();
			   timeForToday(i,t);
			   		  
		  })
		  })
		
		 	function timeForToday(i,value) {
        const today = new Date();
        const timeValue = new Date(value);
        let a=$(".time_")[i];
		console.log(a);
		console.log(a.innerHTML);
           const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) {a.innerHTML='방금전'; 
        return;
        }
        if (betweenTime < 60) {
        	a.innerHTML=betweenTime+'분전';
            return;
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
        	a.innerHTML=betweenTimeHour+'시간전';
            return;
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
        	console.log(betweenTimeDay);
        	a.innerHTML=betweenTimeDay+"일전";
            return;
        }

        a.innerHTML=Math.floor(betweenTimeDay / 365)+'년전';
 }
		
	 	
		
		
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
		
		 <style>
    .btn_2{
    	background-color:rgb(255,255,255,0);
    	border:none;
    	color: inherit;
    font-size: inherit;
    font-weight: 600;
    outline-color:rgb(255,255,255,0);
    }
.btn_ {
	position: absolute;
	right: 20px;
	background-color:rgb(255,255,255,0);
	border: none;
	padding: 1px 5px 0px;
	font-weight: 800;
	color: cadetblue;
	font-size: 16px;
	cursor:pointer;
}
.comment-box_form_input_text:focus{
	outline-color:cadetblue;
}
	.comment_1 li{
		list-style: none;
	}
	.smile{
		width:26px;
		height:26px;
		margin-right:10px;
		padding: 7px 0px 0px;
	}
	.cBox_{
		display:flex;
		margin-bottom: 15px;
	}
	.cContent{
		line-height: 8px;
	}
	.content_{
		font-size:15px;
	}
	.svgcolor{
		color: darkcyan;
	}
	.user_{
		font-weight:700;
		font-size:15px;
		margin-right:10px;
	}
	.width1{
		width:600px;
	}
	.time_font{
		color: inherit;
    font-size: inherit;

	}
	.level2_{
		background-color: #f7f8fa;
    	border-radius: 4px;
    	padding: 0px 20px 0px;
	}
</style>