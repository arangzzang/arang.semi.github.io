package com.en.basket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.basket.model.service.BasketService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class basketView
 */
@WebServlet("/basket/inBasket")
public class InBasketServle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InBasketServle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo=0;
		int su=0;
		
		productNo = Integer.parseInt(request.getParameter("productNo"));//장바구니로 담을 상품번호 가져옴
		String loc="/product/detailProduct?productNo="+productNo;
		su=Integer.parseInt(request.getParameter("su"));
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		String memberId=null;
		if(m!=null){//로그인 상태면 회원아이디를 얻는다
			 memberId=m.getMemberId();
		}else{//로그인 상태가 아닐떄
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			return;
		}
		
		//장바구니 번호부여및 테이블생성
		//담은상품 가져오기
		int bNo=0;
		String msg="상품을 담지못하였습니다";
		bNo=new BasketService().selectBasketNo(memberId);//장바구니가 있는지 없는지 찾아오는거 있으면 회원의 장바구니번호가 들어오고 없으면 0
		if(bNo==0) {//장바구니가 없으면
			int result = new BasketService().insertBasket(productNo, memberId, su);//장바구니 생성 및 상품삽입
			bNo=new BasketService().selectBasketNo(memberId);//장바구니 번호가져옴
			if(result>0) {//장바구니 등록되고 상품추가 성공했을때
				response.sendRedirect(request.getContextPath()+"/basket/basketView?basketNumber="+bNo);
			}else {//안됐을때
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			}
		}else {//장바구니가 존재하면
			if(productNo==new BasketService().searchProduct(bNo, productNo)){
				msg = "이미 담긴 상품이 존재합니다";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			}else{
				int result =new BasketService().insertBasket(productNo,memberId,su,bNo);//회원의 기존장바구니번호로 상품을 추가
				if(result>0) {//존재하는 장바구니에 상품추가가 됐을때
					response.sendRedirect(request.getContextPath()+"/basket/basketView?basketNumber="+bNo);
				}else {//안됐을때
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
					request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
				}
			}
				
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
