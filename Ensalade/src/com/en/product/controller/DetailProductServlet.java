package com.en.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;
import com.en.product.model.vo.ProductComment;
import com.en.product.model.vo.ProductReview;

/**
 * Servlet implementation class DetailProductServlet
 */
@WebServlet("/product/detailProduct")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상품 상세화면
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		//관련 상품 정보출력
		Product p = new ProductService().detailProduct(productNo);
		
		String type = p.getProductType();
	    List<Product> list = new ProductService().relateProduct(type,productNo);
	    
	    
	    String pageBar = "";
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));

		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 10;

		int totalData = 0;

		List<ProductReview> reviewList = new ProductService().ProductReview(productNo, cPage, numPerPage);

		totalData = new ProductService().puoductCount(productNo);

		int totalPage = (int) Math.ceil((double) totalData / numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<i class='"+"fas fa-chevron-left fa-1x"+"'></i>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/product/detailProduct?productNo=" + productNo
					+ "&cPage=" + (pageNo - 1) + "'><i class='"+"fas fa-chevron-left fa-1x"+"'></i></a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='"+"number_color"+"'>" + pageNo + "</span>";
			} else {
				pageBar += "<a class='"+"number_color"+"'href='" + request.getContextPath() + "/product/detailProduct?productNo=" + productNo
						+ "&cPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<i class='"+"fas fa-chevron-right fa-1x"+"'></i>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/product/detailProduct?productNo=" + productNo
					+ "&cPage=" + pageNo + "'><i class='"+"fas fa-chevron-right fa-1x"+"'></i></a>";
		}
		List<ProductComment> commentList = new ProductService().searchComment();
		
		
		//댓글 리스트
		request.setAttribute("commentList", commentList);
		//페이징바
		request.setAttribute("pageBar", pageBar);
		//상품리뷰 리스트 & 관련상품
		request.setAttribute("relateProduct", list);

	  

		request.setAttribute("selectProduct", p);
		request.setAttribute("totalData",totalData);
		request.setAttribute("reviewList",reviewList);
		request.getRequestDispatcher("/view/product/productDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
