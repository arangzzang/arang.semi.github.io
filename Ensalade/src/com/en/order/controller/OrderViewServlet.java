package com.en.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.order.model.service.OrderService;
import com.en.order.model.vo.Order;

/**
 * Servlet implementation class OrderViewServlet
 */
@WebServlet("/order/orderView")
public class OrderViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//주문하기 눌러서 바로 넘어왔을때
		int orderNo=Integer.parseInt(request.getParameter("orderNo"));
		
		List<Order> list=new OrderService().orderView(orderNo);//해당주문번호에 대한 리스트 가져옴
		for(int i=0;i<list.size();i++){
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/order/orderDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
