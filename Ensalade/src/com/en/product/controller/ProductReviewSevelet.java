package com.en.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;
import com.en.product.model.vo.ProductComment;

/**
 * Servlet implementation class productComment
 */
@WebServlet("/product/productReview")
public class ProductReviewSevelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductReviewSevelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int level=Integer.parseInt(request.getParameter("productCommentLevel"));
		System.out.println(level);
		String writer=request.getParameter("productCommentWriter");
		
		int productRef=Integer.parseInt(request.getParameter("productRef"));
		System.out.println(productRef);
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		
		int productCommentRef=Integer.parseInt(request.getParameter("productCommentRef"));
		
		String productCommentContent=request.getParameter("productCommentContent");
		
		 
		
		
		
		
		ProductComment pc=new ProductComment(level,writer,productCommentContent,productRef,productCommentRef);
		
		
		int result=new ProductService().insertComment(pc);
		request.setAttribute("rt", result);
		String msg="";
		
		if(result>0) {
			msg="댓글등록성공";
		}else {
			msg="댓글등록실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/product/detailProduct?productNo="+productNo+"&msg="+msg+"&productRef="+productRef);
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
