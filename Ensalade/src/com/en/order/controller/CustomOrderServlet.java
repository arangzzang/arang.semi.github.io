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

import com.en.custom.model.service.CustomService;
import com.en.member.model.vo.Member;
import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;

/**
 * Servlet implementation class CustomOrderServlet
 */
@WebServlet("/order/customOrder")
public class CustomOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//커스텀하기에서 주문하기 눌렀을때 실행 서블릿
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
		if(cNo==-1){//커스텀 생성 안됐을때 , 생성됬다면 -1이 아닌 cNo에 커스텀번호가 들어옴
			String msg="커스텀 주문을 실패하였습니다";
			String loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
			return;
		}
		List<Product> list=new ArrayList();//상품리스트
		List<String> aList=new ArrayList();
		Product p = new ProductService().detailProduct(cNo);
		list.add(p);
		aList.add("1");//ProductOrder.jsp에서 숫자형으로 바꿔줌
		request.setAttribute("list", list);
		request.setAttribute("amount", aList);
		request.getRequestDispatcher("/view/order/productOrder.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
