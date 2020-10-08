package com.en.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.member.model.vo.Member;
import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;

/**
 * Servlet implementation class ProductOrderServlet
 */
@WebServlet("/order/productOrder")
public class ProductOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] amount=request.getParameterValues("amount");
		List<String> aList=new ArrayList();
		for(String su:amount){
			aList.add(su);
		}
		List<Product> list=new ArrayList();//상품리스트
		if(amount.length==1){//상품하나 주문하기했을때
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			Product p = new ProductService().detailProduct(productNo);
			list.add(p);
			request.setAttribute("list", list);
			request.setAttribute("amount", aList);
			request.getRequestDispatcher("/view/order/productOrder.jsp").forward(request, response);
		}else{//장바구니에서 주문하기 했을때
			String[] productNo=request.getParameterValues("productNo");//상품번호들을 받음
			for(String no: productNo){
				int pNo=Integer.parseInt(no);
				Product p=new ProductService().detailProduct(pNo);
				list.add(p);
			}
			request.setAttribute("amount", aList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/view/order/productOrder.jsp").forward(request, response);
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
