package com.en.product.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.getConnection;

import java.sql.Connection;
import java.util.List;

import com.en.product.model.dao.ProductDao;
import com.en.product.model.vo.Product;

public class ProductService {

   private ProductDao dao = new ProductDao();
   
   //상품 전체 리스트조회
   public List<Product> selectProductAll(){
      Connection conn=getConnection();
      List<Product> list = dao.selectProductAll(conn);
      close(conn);
      return list;
      
   }
   //상품 상세페이지
   public Product detailProduct(int productNo) {
	   Connection conn = getConnection();
	   Product p = dao.detailProduct(conn ,productNo);
	   close(conn);
	   return p;
   }
   //관련상품
   public List<Product> relateProduct(String type){
      Connection conn = getConnection();
      List<Product> types = dao.relateProduct(conn, type);
      close(conn);
      return types;
   }

   
}