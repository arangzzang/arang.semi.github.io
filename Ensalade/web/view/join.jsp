<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>

<section>
    <form action="<%=request.getContextPath()%>/loginjoin/join.do" method="post">
	    <h4>계정 정보</h4>
	    <label for="userId">아이디</label><br><input type="text" name="userId" id="userId_" required class="text_">
	    <input type='button' onclick="doubleCheck();" value='중복확인'><br>
	    <!--아이디 중복확인을 위한 기능 / 4글자 이상 입력-->
	   
	    <label for="password">비밀번호</label><br>
	    <input type="password" name="password" id="password_" placeholder="비밀번호 8글자 이상 입력 (영문 대소문자 포함)" required class="text_"><br> <!--8글자 이상 입력, 영문 대소문자 포함-->
	
	    <label for="password2">비밀번호 재확인</label><br>
	    <input type="password" name="password2" id="password2" placeholder="비밀번호 재입력" class="text_" required>
	    
	    <!-- <br> -->
	
	    <h4>개인 정보</h4>
	    <label for="userName">이름</label>
	    <input type="text" name="userName" id="userName_" class="text_" required><br>
	
	    <label for="email">이메일</label>
	    <input type="text" name="email" id="email_" class="text_" required><br>
	    
	    <label for="phone">연락처</label>
	    <input type="text" name="phone" id="phone_" class="text_" required><br>
	
	    <!--주소검색기능 추후 추가-->
	    <label for="address">주소</label>
	    <input type="text" name="address" id="address_" class="text_" required><br>
	
	    <label for="birth">생년월일</label>
	    <input type="number" name="year" id="year_" placeholder="YYYY" class="text_" required>
	    <input type="number" name="month" id="month_" placeholder="MM" class="text_" required>
	    <input type="number" name="date" id="date_" placeholder="DD" class="text_" required><br>
	
	    <label for="gender">성별</label>
	    <input type="radio" name="gender" id="gender_m" value="M" required>남자
	    <input type="radio" name="gender" id="gender_f" value="F" required>여자<br>
	
	    <h4>이용약관</h4>
	    <!--이용약관 선택 시 세부내용 팝업창처럼 띄움-->
	    <!--전체동의 선택 시 아래 두가지 체크박스 자동 체크할 수 있도록-->
	    <input type="checkbox" name="checkAll" id="checkAll_"> 전체 동의<br>
	    <input type="checkbox" name="terms1" id="terms1_">(필수) 이용약관에 동의합니다.<br>
	    <input type="checkbox" name="terms2" id="terms2_">(필수) 개인정보처리방침에 동의합니다.<br>
        <input type="submit" value="가입하기" onclick="return enrollDeny();">
	</form>
	<form action="" method="post" name="checkDuplicate">
		<input type="hidden" name="userId">
	</form>
</section>    

<script>
       /*  전체버튼으로 체크박스의 온오프를 위한 구문 */
        $(document).ready(function(){
            $("#checkAll_").click(function(){
        	if($("#checkAll_").prop('checked')){
                $("#terms1_").prop('checked',true)
                $("#terms2_").prop('checked',true)
                // console.log($("#terms1_").prop('checked'));
            }else{
                $("#terms1_").prop('checked',false)
                $("#terms2_").prop('checked',false)
            }
            })
            
        }); 
       /*  체크박스 두 개가 체크되어있지않으면 다음으로 넘어갈 수 없게 하는 구문 */
        function enrollDeny(){
        	if($("#terms1_").prop('checked')==false|| $("#terms2_").prop('checked')==false){
        		return false;
        	}else{
        		return true;
        	}
        }
       /* 아이디 4글자 이상을 위해 */
       function doubleCheck(){
    	   let userId=$("#userId_").val();
    	   if($("#userId_").val().trim().length<4){
    		   alert('아이디를 4글자 이상 입력하세요.');
    		   return;
    	   }  
    	   const url="<%=request.getContextPath()%>/checkDuplicate.do";
    	   const title="checkDuplicate";
    	   const status="left=500,top=200,width=500,height=300";
    	   open("",title,status);
    	   
    	   checkDuplicate.target=title;
    	   checkDuplicate.action=url;
    	   checkDuplicate.userId.value=userId;
    	   checkDuplicate.submit();
       }
       
       /* 비밀번호 영문과 숫자 포함을 위한 패스워드 이벤트 */
      $("#password_").blur(e=>{
           let pw=$("#password_").val();
           let regPw=/^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
       if(!regPw.test(pw)){
           alert("비밀번호 4~13글자로 작성하고 숫자, 문자");
           $("#password_").val("");
       }
       });
       
       $("#password2").blur(e=>{
    	   let pw=$("#password_").val();
    	   let pw2=$("#password2").val();
    	   if(pw!=pw2){
    		   alert('비밀번호가 일치하지 않습니다.');
    		  	$("#password_").val("");
        	    $("#password2").val("");
    	   }
       });
       /* $("#password_").click(e=>{
           if($("#password_").next().attr("type")==("P")){
        	   $("#password_").next().remove();
           }
           } */
       
    //    $("#password_").on({"click":
    // 	   function(e){
    // 	   if($(e.target).next().filter("p")!=null){
    //     	   $(e.target).next().remove();
    //        }
    //    },"blur":function(e){
    // 	   let pw=$(e.target).val();
    //        let regPw=/^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
    //    if(!regPw.test(pw)){
    //        alert("비밀번호 4~13글자로 작성하고 숫자, 문자");
    //        $(e.target).val("");
    //    }}
    //    });
       
       
       
        </script>
<%@include file="/view/common/footer.jsp"%>
	
	
	