<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   %>
<%@ page 
   import="com.en.inquiry.model.vo.Inquiry"
   import="java.util.List"
 %>
 <%List<Inquiry> list=(List)request.getAttribute("list"); %>
<%@ include file="/view/common/header.jsp"%>
<style>
div#tbl-FAQ {
   position: relative;
    left: 30%;
}

ul#inquiryUl {
   display: flex;
   justify-content: space-around;
   width: 500px;
   background-color: aqua;
}

li {
   list-style-type: none;
}

div#tjfwlsgh {
   display: none;
   width: 500px;
   height: auto;
}
</style>

<script type="text/javascript">
   $(function() {
      $(".tjfwlsdgh").click(function() {
         $(this).next().slideToggle(500);
      })
   })
</script>
<section>
   <h2>1:1문의</h2>

   <div class="tjfwlsdgh">
      
      <div id="tbl-FAQ" class="tjfwlsdgh">
         <%for(Inquiry ii  :list){ %>
         <div class="tjfwlsdgh">
            <ul id="inquiryUl">
               <li><%=ii.getInquiryType() %></li>
               <li><%=ii.getInquiryTitle() %></li>
               <li><%=ii.getInquiryWriter() %></li>
               <li><%=ii.getInquiryWriteDate() %></li>
               <li><%=ii.getCommentStatus() %></li>
            </ul>
         </div>
         <div id="tjfwlsgh">
            <div>
               <p><%=ii.getInquiryContent() %></p>
            </div>
            <hr>
            <div>
               <img
                  src="<%=request.getContextPath()%>/upload/inquiry/img3.jpg">
            </div>
            <div>
               <label>답변</label>
               <form action="<%=request.getContextPath() %>/Inquriry/InquriryManagerTextServlet"  >
                  <input type="hidden" name="no" value="<%=ii.getInquiryNo()%>">
                  <textarea id="" name="MangerText"rows="5" cols="33"></textarea>
                  <button type="submit">답변</button>
               </form>
               
            </div>
         </div>
      <%} %>
      </div>
   
   </div>
   

</section>
<script type="text/javascript">
   $("#inquiryUl").ho
</script>
<%-- <%@ include file="/view/MyPage/inquiry/inquiryManger.jsp"%> --%>
