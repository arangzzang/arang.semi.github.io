package com.en.basket.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.basket.model.service.BasketService;
import com.en.custom.model.service.CustomService;
import com.en.member.model.vo.Member;

/**
 * Servlet implementation class CustomInBasketServlet
 */
@WebServlet("/basket/customInBasket")
public class CustomInBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomInBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		String memberId=m.getMemberId();
		int count=new CustomService().searchCustomCount(memberId)+1;//해당회원의 커스텀 개수+1
		String pName=memberId+"님의 커스텀"+count;//커스텀이름
		int price=Integer.parseInt(request.getParameter("price"));//커스텀가격
		String content="";
		if(request.getParameter("base")!=null){//베이스를 선택했으면
			content+=request.getParameter("base").substring(0, request.getParameter("base").indexOf("/"))+" ";
		}
		if(request.getParameter("topping")!=null){//토핑을 선택했으면
			for(String t : request.getParameterValues("topping")){
				content+=t.substring(0, t.indexOf("/"))+" ";
			}
		}
		if(request.getParameter("dressing")!=null){//드레싱을 선택했으면
			content+=request.getParameter("dressing").substring(0, request.getParameter("dressing").indexOf("/"))+" ";
		}
		int cNo=new CustomService().insertCustom(price,pName,content,memberId);//커스텀생성 및 커스텀번호 가져옴
		
		int bNo=0;
		String msg="상품을 담지못하였습니다";
		String loc="/";
		if(cNo==-1){//커스텀 생성 안됐을때 , 생성됬다면 -1이 아닌 cNo에 커스텀번호가 들어옴
			msg="커스텀 생성을 실패하였습니다";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		
		bNo=new BasketService().selectBasketNo(memberId);//장바구니가 있는지 없는지 찾아오는거 있으면 회원의 장바구니번호가 들어오고 없으면 0
		
		if(bNo==0) {//장바구니가 없으면
			int result = new BasketService().insertBasket(cNo, memberId, 1);//장바구니 생성 및 커스텀삽입
			bNo=new BasketService().selectBasketNo(memberId);//장바구니 번호가져옴
			if(result>0) {//장바구니 등록되고 상품추가 성공했을때
				response.sendRedirect(request.getContextPath()+"/basket/basketView?basketNumber="+bNo);
			}else {//안됐을때
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			}
		}else {//장바구니가 존재하면

				int result =new BasketService().insertBasket(cNo,1,bNo);//회원의 기존장바구니번호로 상품을 추가
				if(result>0) {//존재하는 장바구니에 상품추가가 됐을때
					response.sendRedirect(request.getContextPath()+"/basket/basketView?basketNumber="+bNo);
				}else {//안됐을때
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
					request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
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
