<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<style>
	section{padding:100px;}
</style>
<section>
    <form action="<%=request.getContextPath()%>/loginjoin/join.do" method="post">
	    <h4>계정 정보</h4>
	    <label for="userId">아이디</label><br><input type="text" name="userId" id="userId_" required>
	    <input type='button' onclick="doubleCheck();" value='중복확인'><br>
	    <!--아이디 중복확인을 위한 기능 / 4글자 이상 입력-->
	   
	    <label for="password">비밀번호</label><br>
	    <input type="password" name="password" id="password_" placeholder="비밀번호 8글자 이상 입력 (영문 대소문자 포함)" required><br> <!--8글자 이상 입력, 영문 대소문자 포함-->
	
	    <label for="password2">비밀번호 재확인</label><br>
	    <input type="password" name="password2" id="password2" placeholder="비밀번호 재입력" required>
	    
	    <!-- <br> -->
	
	    <h4>개인 정보</h4>
	    <label for="userName">이름</label>
	    <input type="text" name="userName" id="userName_" required><br>
	
	    <label for="email">이메일</label>
	    <input type="text" name="email" id="email_" required><br>
	    
	    <label for="phone">연락처</label>
	    <input type="text" name="phone" id="phone_" required><br>
	
	    <!--주소검색기능 추후 추가-->
	    <!-- <label for="address">주소</label>
	    <input type="text" name="address" id="address_" required><br> -->
	    <input type="text" name="address" id="sample6_postcode" placeholder="우편번호">
		<input type="button" name="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
		<input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소"><br>
	
	    <label for="birth">생년월일</label>
	    <input type="number" name="year" id="year_" placeholder="YYYY" required>
	    <input type="number" name="month" id="month_" placeholder="MM" required>
	    <input type="number" name="date" id="date_" placeholder="DD" required><br>
	
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
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <script>
        	//api
           function sample6_execDaumPostcode() {
               new daum.Postcode({
                   oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var addr = ''; // 주소 변수
                       var extraAddr = ''; // 참고항목 변수

                       //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                       if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                           addr = data.roadAddress;
                       } else { // 사용자가 지번 주소를 선택했을 경우(J)
                           addr = data.jibunAddress;
                       }
                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById('sample6_postcode').value = data.zonecode;
                       document.getElementById("sample6_address").value = addr;
                       // 커서를 상세주소 필드로 이동한다.
                       document.getElementById("sample6_detailAddress").focus();
                   }
               }).open();
           }
       </script> 
<%@include file="/view/common/footer.jsp"%>
	
	
	