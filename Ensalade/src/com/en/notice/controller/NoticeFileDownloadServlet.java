package com.en.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet("/notice/fileDownload")
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
			fileName = fileName.replace("/upload/notice/", "");
			System.out.println(fileName);
		String path = getServletContext().getRealPath("/upload/notice/");
		File f = new File(path+"/"+fileName);
			System.out.println(f);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
		//파일 인코딩처리
		String fileReName = "";
		String header = request.getHeader("user-agent");
		//trident나 MSIE 라면!
		boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident")!= -1;
		if(isMSIE) {
			fileReName = URLEncoder.encode(fileName,"UTF-8").replace("\\+", "%20");
		}else {
			fileReName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		//파일전송
		response.setContentType("application/actet-stream");
		response.setHeader("content-Disposition", "attachment;filename"+fileReName);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		int read = -1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
