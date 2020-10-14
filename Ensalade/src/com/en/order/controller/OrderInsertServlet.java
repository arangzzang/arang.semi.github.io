package com.en.order.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.basket.model.service.BasketService;
import com.en.member.model.service.MemberService;
import com.en.member.model.vo.Member;
import com.en.order.model.service.OrderService;
import com.en.product.model.service.ProductService;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/order/orderInsert")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니나 상품하나 클릭해서 주문하기 했을때
		
		HttpSession session=request.getSession();
		
		Member m=(Member)session.getAttribute("loginMember");
		String address=request.getParameterValues("address")[0]+",";	
		String memberId=m.getMemberId();
		address+=request.getParameterValues("address")[1]+",";
		address+=request.getParameterValues("address")[2];
		String memo=request.getParameter("memo");
		int total=Integer.parseInt(request.getParameter("total-pay"));

		int point= Integer.parseInt(request.getParameter("point"));
		int results2=new MemberService().pointDown(memberId,point);
		int totalpay=(total*2)/100;

		
		
		int results=new MemberService().pointUpdate(memberId,totalpay);
		int delivery=Integer.parseInt(request.getParameter("ba"));
		String[] productNos=request.getParameterValues("productNo");
		String[] amounts=request.getParameterValues("amount");
		String[] prices=request.getParameterValues("price");
		int[] productNo = Arrays.stream(productNos).mapToInt(Integer::parseInt).toArray();//스트링 배열을 인트배열로 바꿈
		int[] amount = Arrays.stream(amounts).mapToInt(Integer::parseInt).toArray();
		
		
		int result=new OrderService().insertOrder(memo,total,address,delivery,memberId,productNo,amount);//주문번호 생성 및 주문테이블 삽입
		if(result>0){
			if(request.getParameter("basketNo")!=null){//장바구니로 주문하기 넘어왔을때
				int basketNo=Integer.parseInt(request.getParameter("basketNo"));
				new BasketService().dropBasket(basketNo);//해당 회원 장바구니 삭제
			}
			int orderNo=new OrderService().searchOrderNo(memberId);
			response.sendRedirect(request.getContextPath()+"/order/orderView?orderNo="+orderNo);
		}else{
			String msg="주문의 오류가 생겼습니다.고객센터로 문의주세요";
			String loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp");
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
