package com.en.custom.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.custom.model.service.CustomService;

import com.en.custom.model.vo.CustomPost;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class CustomUploadServlet
 */
@WebServlet("/upload/customUpload")
public class CustomUploadServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
      
      CustomPost cp=new CustomPost();
      
      
      cp.setTitle(mr.getParameter("ctitle"));
      cp.setContent(mr.getParameter("ctext"));
      cp.setcImage(mr.getFilesystemName("upload"));
      cp.setMemberId(mr.getParameter("userId"));
      try {
      cp.setCustomNo(Integer.parseInt(mr.getParameter("customNo")));
      }catch(NumberFormatException e) {
    	  request.setAttribute("msg", "커스텀 번호를 선택해주세요.");
    	  request.setAttribute("loc", "/custom/customWrite?userId="+mr.getParameter("userId"));
    	  request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
    	  return;
      }
      int result=new CustomService().insertPost(cp);
      
      String msg="";
      String loc="/custom/customList";
      msg=result>0?"게시글 등록 성공":"게시글 등록 실패";
      request.setAttribute("msg",msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/view/common/msg.jsp").forward(request,response);
      
      
   }
   
   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}