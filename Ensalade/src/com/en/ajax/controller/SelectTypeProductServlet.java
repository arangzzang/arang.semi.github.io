package com.en.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;

/**
 * Servlet implementation class SelectTypeProductServlet
 */
@WebServlet("/ajax/selectType")
public class SelectTypeProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTypeProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Product> list=new ProductService().selectProductAll();
		
		String type = request.getParameter("type");
	    List<Product> selectList = new ArrayList();
	      if(!type.equals("전체보기")){
	    	  for(int i = 0; i < list.size(); i++) {
		    	  if(list.get(i).getProductType().equals(type)) {
		    		  selectList.add(list.get(i));
		    	  }
		      }
		      request.setAttribute("list", selectList);
	      }else{
	    	  request.setAttribute("list", list);
	      }
	    
	      
	      
	      request.getRequestDispatcher("/view/product/ajaxProductSelect.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
