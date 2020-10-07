package com.en.basket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.basket.model.service.BasketService;
import com.en.basket.model.vo.Basket;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class BasketViewServlet
 */
@WebServlet("/basket/basketView")
public class BasketViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo=0;
		
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		if(m==null){//장바구니 조회를 누를때 로그인되지 않은상태일때
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			return;
		}else if(m!=null && request.getParameter("basketNumber")==null){//장바구니 조회를 누를때 로그인 된 상태일때
			String memberId=m.getMemberId();
			bNo=new BasketService().selectBasketNo(memberId);//회원의 장바구니번호를 가져옴
		}else{//장바구니 담기로 왔을때
			bNo = Integer.parseInt(request.getParameter("basketNumber"));//장바구니담기로 넘어왔을때
		}
		List<Basket> list = new BasketService().basketView(bNo);
		
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("/view/basket/basketView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
