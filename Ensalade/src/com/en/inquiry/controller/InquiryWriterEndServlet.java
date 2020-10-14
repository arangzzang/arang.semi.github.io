package com.en.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.inquiry.model.service.InquiryService;
import com.en.inquiry.model.vo.Inquiry;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InquiryWriterEndServlet
 */
@WebServlet("/inquiry/inquiryWriteEnd")
public class InquiryWriterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InquiryWriterEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("no"));
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류! 관리자에게 문의하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
		}

		String path = getServletContext().getRealPath("/image/upload/inquiry");
		int maxSize = 1024 * 1024 * 10; // 파일 최대크기 10MB
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();// 중복 파일명이 있으면 숫자로 저장
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", rename);

		String filename = "/image/upload/inquiry/"+ (mr.getFilesystemName("upload"));
		
		Inquiry i = new Inquiry();

		i.setInquiryType(mr.getParameter("qType"));
		i.setInquiryWriter(mr.getParameter("writer"));
		i.setInquiryTitle(mr.getParameter("title"));
		i.setInquiryContent(mr.getParameter("content"));
		i.setFilePath(filename);
		
		System.out.println(filename);

		int result = new InquiryService().insertInquiry(i);

		request.setAttribute("result", result);

		String msg = "";
		String loc = "/inquiry/searchInquiryMem?no="+memberNo;
		msg = result > 0 ? "문의하기가 완료되었습니다! 금방 답변드릴게요!" : "문의하기 실패. 다시 등록해주세요ㅠㅠ";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
