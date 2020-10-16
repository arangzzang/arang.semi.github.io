<%@page import="com.en.custom.model.service.CustomService"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.en.custom.model.vo.CustomPost"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    //게시물 수정 jsp 로직
    if(!ServletFileUpload.isMultipartContent(request)) {
        request.setAttribute("msg","요청이 잘못되었습니다.관리자에게 문의하세요.");
        request.setAttribute("loc", "/view/customUpload");
        request.getRequestDispatcher("/view/common/msg.jsp").forward(request,response);
        return;
     }
    
     
     //업로드 경로
     String path=getServletContext().getRealPath("/upload/custom");
     System.out.println(path);
     File dir=new File(path);
     if(!dir.exists()) {
        dir.mkdir();
     }
     
     int maxSize=1024*1024*50;
     
     
     MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
     
     int no=Integer.parseInt(mr.getParameter("no1"));
 	System.out.println(no);
 	String c=new CustomService().postList(no);
 	
 	String oldPath=getServletContext().getRealPath("/upload/custom/"+c);
 	System.out.println(oldPath);
    File old=new File(oldPath);
    if(old.exists()){
    	old.delete();
    }
     
     CustomPost cp=new CustomPost();
     
     cp.setcIdx(no);
     cp.setTitle(mr.getParameter("ctitle"));
     cp.setContent(mr.getParameter("ctext"));
     cp.setcImage(mr.getFilesystemName("upload"));
     cp.setMemberId(mr.getParameter("userId"));
     
     int result=new CustomService().updatePost(cp);//--------------------------
     
     String msg="";
     String loc="/custom/customView?no="+no;
     msg=result>0?"게시글 수정 성공":"게시글 수정 실패";
     request.setAttribute("msg",msg);
     request.setAttribute("loc", loc);
     request.getRequestDispatcher("/view/common/msg.jsp").forward(request,response);
    
    %>