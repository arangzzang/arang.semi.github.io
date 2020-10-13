package com.en.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.event.model.service.EventService;
import com.en.event.model.vo.Event;
import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;

/**
 * Servlet implementation class EventListServlet
 */
@WebServlet("/event/eventList")
public class EventListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		List<Event> eList = new EventService().secherEvent();

		// 상품 전체화면
		List<Event> selectList = new ArrayList<Event>();
		// 좌측 상품종류별 선택 메뉴바
		if (type == null) {
			request.setAttribute("list", eList);
		} else {
			for (Event p : eList) {
				if (p.getProductType().equals(type)) {
					selectList.add(p);
				}
			}
			request.setAttribute("list", selectList);
		}

		request.getRequestDispatcher("/view/event/eventList.jsp").forward(request, response);

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
