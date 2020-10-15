package com.en.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.inquiry.model.service.InquiryService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InquriryMangerTextServlet
 */
@WebServlet("/admin/InquriryManagerTextServlet")
public class InquriryManagerTextServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquriryManagerTextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      

      String managerText=request.getParameter("ManagerText");
      System.out.println(managerText);
      int no=Integer.parseInt(request.getParameter("no"));
      System.out.println(no);
      int result =new InquiryService().managerAnswer(no,managerText);
      request.setAttribute("result", result);
      String msg = "";
      String loc = "/admin/inquiry";
      msg = result > 0 ? "답변이 완료되었습니다!" : "ㅠㅠ";
      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);


      

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}