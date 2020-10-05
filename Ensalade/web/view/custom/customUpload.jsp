<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.en.custom.model.vo.CustomOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<%
	List<CustomOrder> list=(List)request.getAttribute("list");
	for(CustomOrder c:list){
		System.out.println(c);
	}
%>

<section>
   <h2>글 올리기</h2>

<form action="<%=request.getContextPath()%>/upload/customUpload" method="post"
enctype="multipart/form-data">
    <div class="cbox">
    
      <!-- 파일첨부&미리보기박스  -->
      <div class="c_imgbox">
         <img class="cimg" id="c"> <input type="file" id="upload" style="display: none;" name="upload"><br>
         <div id="imgContainer"></div>
      </div>
      
      <!-- 상품번호 선택 셀렉박스 div -->
      <%-- <div class="c_selectbox">
      <select id="customNo" name="customNo">
      <option>번호</option>
      <%for(CustomOrder c:list){ %>
         <option><%=c.getCustomNo()%></option>
         <%} %>
      </select>
      </div> --%>

      <!-- 제목작성 div -->
      <div class="c_textbox">
      <div>
      	<select id="customNo" name="customNo">
      	<option selected disabled>커스텀을 골라주세요.</option>
      	<%for(CustomOrder p:list){%>
      		<%CustomOrder co=new CustomService().memberCustom2(p.getCustomNo());%>
      		<option value="<%=p.getCustomNo()%>"><%=co.getCustomName()%></option>
      		<%} %>
      	</select>
      </div>
         <div class="c_titlebox">
            <input type="text" id="ctitle" name="ctitle" placeholder="제목 입력">
         </div>

         <!-- 본문작성 div -->
         <div class="c_textbox">
            <textarea name="ctext" cols="55" rows="10" style="resize: none" placeholder="내용을 입력하세요."></textarea>
         </div>
      </div>
   </div>
   
   <!-- 글올리기 버튼 -->
   <div>
   <input type="submit" value="글 등록">
   </div>
   <input type="hidden" value="<%=loginMember.getMemberId()%>" name="userId">
</form>
</section>

<script>
//파일 업로드 처리
 $("#postup").click(e=>{
   let form=new FormData();
   //제목+내용
   form.append("title",$("#ctitle").val());
   form.append("content",$("#ctext").val());
   //업로드파일
   form.append("custom",$("#upload").files);

   
   $.ajax({
      url:"<%=request.getContextPath()%>/upload/customUpload", 
      data:form,
      type:"post",
      processData:false,
      contentType:false,
      success:data=>{
         console.log("업로드 성공");
         //alert("글이 성공적으로 등록되었습니다.");
      }
   });
});



//이미지태그 클릭시 파일업로드창 열기
$("#c").click(e=>{
   $("#upload").click();
});

// 미리보기 띄우기
$("#upload").change(e => {
   $("#imgContainer").html("");//리셋
   
   $.each(e.target.files, (i,v) => {
      let reader=new FileReader();
      reader.onload=e=>{
      /*    let img=$("<img>",{"src":e.target.result,"width":"100","height":"100"});
         $("#imgContainer").append(img); */
      $("#c").attr("src",e.target.result);
      }
   reader.readAsDataURL(v);
   });
   
});

/* $("#title").attr("value",$("#customNo").val()); */

	<%-- $("#customNo").change(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/view/custom/customValue.jsp",
			data:{"data1":$(e.target).val()},
			success:data => {
				$("#title").attr("value",data);
			}
		})
		
	}) --%>



</script>

<style>

.cimg {
   width: 500px;
   height: 500px;
   padding: 30px;
}

.cbox {
   display: flex;
   justify-content: center;
   align-items: center;
}
</style>

<%@ include file="/view/common/footer2.jsp"%>