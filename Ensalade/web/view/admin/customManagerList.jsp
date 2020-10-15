<%@page import="com.en.admin.model.service.AdminService"%>
<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomComment"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
     //ajax 출력용 데이터
     	int cNo=0; //게시물 고유 번호
     	int ccNo=0; //댓글 고유 번호
     try{
     	 cNo=Integer.parseInt(request.getParameter("cNo")); //managerlist 에 ajax로 처음 값을 뽑아서 번호가 null값이 생기기 때문에 처리
     }catch(NumberFormatException e){
    	 cNo=0;
     }
     try{
     	 ccNo=Integer.parseInt(request.getParameter("ccNo"));
     }catch(NumberFormatException e){
    	 ccNo=0;
     }

     	int cNoresult=new AdminService().customPostDelete(cNo);//게시물 삭제
		int ccNoresult=new AdminService().customCommentDelete(ccNo);//댓글 삭제
		
// 게시물 페이징=========================================================================================================
		int cPage;
		
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			cPage=1;
		}
		
		int numPerPage=10;
		
		int totalData=new AdminService().postCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<button class='post_' value="+(pageNo-1)+">[이전]</button>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<button class='post_' value="+pageNo+">"+pageNo+"</button>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<button class='post_' value="
					+pageNo+">[다음]</button>";
		}
		
//댓글 페이징 =========================================================================================
	/* int cPage2;
		
		try{
			cPage2=Integer.parseInt(request.getParameter("cPage2"));
		}catch(NumberFormatException e){
			cPage2=1;
		}
		
		int numPerPage2=10;
		
		int totalData2=new AdminService().commentCount();
		int totalPage2=(int)Math.ceil((double)totalData2/numPerPage2);
		
		int pageBarSize2=5;
		int pageNo2=((cPage2-1)/pageBarSize2)*pageBarSize2+1;
		int pageEnd2=pageNo2+pageBarSize2-1;
		
		String pageBar2="";
		System.out.println(pageNo2);
		if(pageNo2==1) {
			pageBar2+="<span>[이전]</span>";
		}else {
			pageBar2+="<a href='"+request.getContextPath()+
					"/view/admin/customManagerList.jsp?cPage2="+(pageNo2-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo2>pageEnd2||pageNo2>totalPage2)) {
			if(cPage2==pageNo2) {
				pageBar2+="<span>"+pageNo2+"</span>";
			}else {
				pageBar2+="<a href='"+request.getContextPath()+
						"/view/admin/customManagerList.jsp?cPage2="+pageNo2+"'>"+pageNo2+"</a>";
			}
			pageNo2++;
		}
		
		if(pageNo2>totalPage2) {
			pageBar2+="<span>[다음]</span>";
		}else {
			pageBar2+="<a href='"+request.getContextPath()+"/view/admin/customManagerList.jsp?cPage2="
					+pageNo2+"'>[다음]</a>";
		} */
		
int cPage2;
		
		try{
			cPage2=Integer.parseInt(request.getParameter("cPage22"));
		}catch(NumberFormatException e){
			cPage2=1;
		}
		int numPerPage2=10;
		
		int totalData2=new AdminService().commentCount();
		int totalPage2=(int)Math.ceil((double)totalData2/numPerPage2);	
		int pageBarSize2=5;
		int pageNo2=((cPage2-1)/pageBarSize2)*pageBarSize2+1;
		int pageEnd2=pageNo2+pageBarSize2-1;
		
		String pageBar2="";
		if(pageNo2==1) {
			pageBar2+="<span>[이전]</span>";
		}else {
			pageBar2+="<button class='comment' value="+(pageNo2-1)+">[이전]</button>";
		}
		
		while(!(pageNo2>pageEnd2||pageNo2>totalPage2)) {
			if(cPage2==pageNo2) {
				pageBar2+="<span>"+pageNo2+"</span>";
			}else {
				pageBar2+="<button class='comment' value="+pageNo2+">"+pageNo2+"</button>";
			}
			pageNo2++;
		}
		
		if(pageNo2>totalPage2) {
			pageBar2+="<span>[다음]</span>";
		}else {
			pageBar2+="<button class='comment' value="+pageNo2+">[다음]</button>";
		}
		
		
    	List<CustomPost> post=new CustomService().customList(cPage, numPerPage);//리스트 출력  	
    	List<CustomComment> comment=new AdminService().customCommentList(cPage2, numPerPage2);
   
    %>
    
	<!-- section에 들어가는 data -->
			<div class="center"><h2>커스텀 게시물</h2></div>
    	<table  class="center">
    	<thead>
    		<tr>
    		<th>게시물 번호</th>
    		<th>제목</th>
    		<th>내용</th>
    		<th>날짜</th>
    		<th>좋아요</th>
    		<th>조회수</th>
    		<th>참조 상품</th>
    		<th>ID</th>
    		<th colspan="2">image</th>
    		</tr>
    	</thead>
    	<tbody>
    	
    	<%if(!post.isEmpty()){%>
    	<%for(CustomPost cp:post){ %>
    		<tr>   		
    			<td><%=cp.getcIdx() %></td>
    			<td><%=cp.getTitle() %></td>
    			<td><%=cp.getContent() %></td>
    			<td><%=cp.getWriteDate()%></td>
    			<td><%=cp.getLikeCount()%></td>
    			<td><%=cp.getViewCount() %></td>
    			<td><%=cp.getCustomNo()%></td>
    			<td><%=cp.getMemberId() %></td>
    			<td><%=cp.getcImage() %></td>
    			<td class="center"><button value="<%=cp.getcIdx()%>" class="dBtn">삭제</button></td>
    		</tr>   
    		<%} %>
    		<%}else{%>
    		<tr>
    			<td colspan="10">내용이 없습니다.</td>
    		</tr>
    		
    		<%}%>
    	</tbody>
    	</table>
    		<div id="postBar">
    		<%=pageBar%>
    		</div>
    	
    		<div class="center"><h2>댓글 목록</h2></div>
    	
    	<table  class="center">
    	<thead>
    		<tr>
    			<th>댓글 번호</th>
    			<th>레벨</th>
    			<th>작성자</th>
    			<th>내용</th>
    			<th>참조 게시물</th>
    			<th>참조 댓글</th>
    			<th colspan="2">날짜</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%if(!comment.isEmpty()){%>
    		<%for(CustomComment c:comment){%>
    		<tr>
    			<td><%=c.getCustomCommentNo()%></td>
    			<td><%=c.getCustomCommentLevel()%></td>
    			<td><%=c.getCustomCommentWriter()%></td>
    			<td><%=c.getCustomCommentContent()%></td>
    			<td><%=c.getCustomRef()%></td>
    			<td><%=c.getCustomCommentRef()%></td>
    			<td><%=c.getCustomCommentDate()%></td>
    			<td class="center"><button value="<%=c.getCustomCommentNo()%>" class="dBtn2">삭제</button></td>
    		</tr>
    		<%} %>
    		<%}else{%>
    		<tr>
    			<td colspan="8">내용이 없습니다.</td>
    		</tr>
    		<%} %>
    	</tbody>
    	</table>
    	<div id="commentBar">
    		<%=pageBar2 %>
    	</div>
    
    <style>
    	tr>td,th{
    		border:1px solid black;
    		width:100px;
    		height:50px;
    	}
    	.center{
    		text-align: center;
    	}
    	.sort{
    		text-align: -webkit-center;
    	}
    	.cur{
    		cursor:pointer;
    	}
    	.comment{
    		background: none;
    		border: none;
    		outline:none;
    	}
    	.post_{
    		background: none;
    		border: none;
    		outline:none;
    	}
    </style>
    <script>
    $(".dBtn").click(e=>{//게시물 삭제
		let cNo=$(e.target).val();
		console.log(cNo);
		$.ajax({
			url:"<%=request.getContextPath()%>/view/admin/customManagerList.jsp",
			data:{"cNo":cNo},
			success:data=>{
				$("section").html(data);
				console.log(1232);
			}
		})
	});
	
	$(".dBtn2").click(e=>{//댓글 삭제
		let ccNo=$(e.target).val();
		console.log(ccNo);
		$.ajax({
			url:"<%=request.getContextPath()%>/view/admin/customManagerList.jsp",
			data:{"ccNo":ccNo},
			success:data=>{
				$("section").html(data);
			}
		})
	});
	
	$(".comment").click(e=>{
		console.log($(e.target));
		console.log(1234);
		let a=$(e.target).val();
		$.ajax({
			url:"<%=request.getContextPath()%>/view/admin/customManagerList.jsp",
			data:{"cPage22":a,"cPage":'<%=cPage%>'},
			success:data=>{
				$("section").html(data);
			}
			
		})
	})
	
	$(".post_").click(e=>{
		let a=$(e.target).val();
		$.ajax({
			url:"<%=request.getContextPath()%>/view/admin/customManagerList.jsp",
			data:{"cPage":a,"cPage22":'<%=cPage2%>'},
			success:data=>{
				$("section").html(data);
			}
			
		})
	})
    </script>