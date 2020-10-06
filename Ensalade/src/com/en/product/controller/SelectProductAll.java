package com.en.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;

/**
 * Servlet implementation class SelectProductAll
 */
@WebServlet("/product/productAll")
public class SelectProductAll extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductAll() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
	  String type=request.getParameter("type");
	 
		
	  List<Product> list=new ProductService().selectProductAll();
	  List<Product> selectList = new ArrayList();
	  if(type==null){
	      request.setAttribute("list", list);
	  }else{
		  for(Product p : list){
			  if(p.getProductType().equals(type)){
				 selectList.add(p);
			  }
		  }
		  request.setAttribute("list", selectList);
	  }
      
      
      request.getRequestDispatcher("/view/product/productAll.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}