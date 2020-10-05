package com.en.ajax.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.basket.model.service.BasketService;
import com.en.basket.model.vo.Basket;

/**
 * Servlet implementation class AjaxDeleteBasketServlet
 */
@WebServlet("/ajax/deleteBasket")
public class AjaxDeleteBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDeleteBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int basketNo = Integer.parseInt(request.getParameter("basketNo"));
       int productNo = Integer.parseInt(request.getParameter("productNo"));
       
       
       int result = new BasketService().deleteBasket(basketNo, productNo);
       if(result>0){
    	   List<Basket> list =new BasketService().basketView(basketNo);
           request.setAttribute("list", list);
           request.getRequestDispatcher("/view/basket/ajaxBasketDelete.jsp").forward(request, response);
       }else{
    	   String msg="상품 삭제에 실패하였습니다.";
    	   request.getRequestDispatcher("view/common/msg.jsp");
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