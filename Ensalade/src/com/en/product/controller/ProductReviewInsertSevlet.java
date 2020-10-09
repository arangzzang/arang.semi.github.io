package com.en.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.ProductReview;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductReviewInsertSevlet
 */
@WebServlet("/Product/ProductReviewInsertSevlet")
public class ProductReviewInsertSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductReviewInsertSevlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			 request.setAttribute("msg", "공지사항작성 오류![form:enctype에러. 관리자에게 문의하세요!]");
	         request.setAttribute("loc", "/");
	         request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	         return; //중단
		}

		String path = getServletContext().getRealPath("/image/upload/productReview");
		int maxSize = 1024 * 1024 * 10; // 파일 최대크기 10MB
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();// 중복 파일명이 있으면 숫자로 저장
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", rename);

		String filename = "/image/upload/productReview/"+ (mr.getFilesystemName("upload"));
		
		int productNo =Integer.parseInt(mr.getParameter("productNo"));
		ProductReview pr = new ProductReview();
		pr.setPageRef(productNo);
		pr.setReviewTitle(mr.getParameter("ReviewTitle"));
		pr.setReviewWriter(mr.getParameter("ReviewWriter"));
		pr.setReviewContent(mr.getParameter("ReviewContent"));
		pr.setFilepath(filename);

		int result = new ProductService().insertReview(pr);
		
		request.setAttribute("result", result);
		

		String msg = "";
		String loc = "/product/detailProduct?productNo="+productNo;
		msg = result > 0 ? "등록" : "등록 실패";
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
