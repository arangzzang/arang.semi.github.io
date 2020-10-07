<%@page import="com.en.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%!
public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
  PasswordAuthentication pa;
  public MyAuthentication(){
    pa=new PasswordAuthentication("lsh0001895@gmail.com","tpgus9578462");   //발신인 이메일 비밀번호     
  }
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
}
%>


<%
 // SMTP 서버 주소
 String smtpHost = "smtp.gmail.com";


 //받는 사람의 정보
 Member m=(Member)request.getAttribute("member");
 String toName = m.getMemberName();
 String toEmail = m.getEmail();
 
 //type에 따른 주소값
 String type=(String)request.getAttribute("type");
 String loc="";
 if(type.equals("member_id")){
	 loc="/view/search/searchPw.jsp";
 }else if(type.equals("member_name")){
	 loc="/view/search/searchId.jsp";
 }


 //보내는 사람의 정보
 String fromName = "이세현";//메일 보내는 사람 이름
 String fromEmail = "lsh0001895@gmail.com";//발신인 이메일
 String temp1="";
 
 try {
  Properties props = new Properties();
props.put("mail.smtp.user", fromEmail);
props.put("mail.smtp.host", "smtp.googlemail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

  // 메일 인증
  Authenticator myauth=new MyAuthentication(); 
  Session sess=Session.getInstance(props, myauth);


  InternetAddress addr = new InternetAddress();
  addr.setPersonal(fromName,"UTF-8");
  addr.setAddress(fromEmail);
  
  StringBuffer temp =new StringBuffer();
  Random rnd = new Random();
  for(int i=0;i<10;i++)
  {
      int rIndex = rnd.nextInt(3);
      switch (rIndex) {
      case 0:
          // a-z
          temp.append((char) ((int) (rnd.nextInt(26)) + 97));
          break;
      case 1:
          // A-Z
          temp.append((char) ((int) (rnd.nextInt(26)) + 65));
          break;
      case 2:
          // 0-9
          temp.append((rnd.nextInt(10)));
          break;
      }
  }
  
  String AuthenticationKey = temp.toString();
  temp1=temp.toString();


  Message msg = new MimeMessage(sess);
  msg.setFrom(addr);         
  msg.setSubject(MimeUtility.encodeText("이메일 제목", "utf-8","B"));
  msg.setContent("이메일 보낼 내용 - 인증 번호 : "+temp, "text/html;charset=utf-8");
  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


  Transport.send(msg);


 } catch (Exception e) {
  e.printStackTrace();
  out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
  return;
 }
 
  request.setAttribute("temp", temp1);
  request.setAttribute("loc", loc);
  request.setAttribute("type", type);
  request.getRequestDispatcher("/view/search/checkEmail.jsp").forward(request, response);
  
 out.println("<script>alert('메일이 전송되었습니다.');<script>");

%>
