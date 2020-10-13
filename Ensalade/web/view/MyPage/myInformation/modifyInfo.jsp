<%@page import="com.en.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/common/header.jsp"%>
<%
	//회원정보수정 로직
	String oldPw=loginMember.getMemberPw();

	String oldPw2=request.getParameter("password");
		
	String newPw="";
	try{
	newPw=request.getParameter("newPw");
	}catch(NullPointerException e){
		System.out.println("123");
	}
	String mPw="";
	System.out.println(newPw);
	 if(!oldPw.equals(oldPw2)){
		request.setAttribute("msg", "비밀번호가 다릅니다.");
		request.setAttribute("loc", "/view/MyPage/myInformation/modifyInformation.jsp");
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
		return;
	}else if(newPw.equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==")){
		mPw=oldPw;
	}else{
		mPw=newPw;
	}
	
	
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String address=String.join(",",request.getParameterValues("address"));
	Member m=new Member();
	m.setMemberId(loginMember.getMemberId());
	m.setMemberPw(mPw);
	m.setEmail(email);
	m.setMemberPhone(phone);
	m.setMemberAddress(address);
	int result=new MemberService().modifyInfo(m);
	if(result>0){
		request.setAttribute("msg", "수정되었습니다.");
		request.setAttribute("loc", "/");
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "수정에 실패했습니다.");
		request.setAttribute("loc", "/view/MyPage/myInformation/modifyInformation.jsp");
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}
%>