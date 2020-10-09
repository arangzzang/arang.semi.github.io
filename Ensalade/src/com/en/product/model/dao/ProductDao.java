package com.en.product.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.product.model.vo.Product;

   public class ProductDao {
   
      private Properties prop = new Properties();
      public ProductDao() {
         String path = ProductDao.class.getResource("/sql/product/product_sql.properties").getPath();
         try{
            prop.load(new FileReader(path));
         }catch(IOException e){
            e.printStackTrace();
         }
         
      }
      //상품 전체 리스트조회
      public List<Product> selectProductAll(Connection conn){
         PreparedStatement pstmt=null;
         ResultSet rs = null;
         List<Product> list=new ArrayList();
         try{
            pstmt=conn.prepareStatement(prop.getProperty("productList"));
            rs = pstmt.executeQuery();
            while(rs.next()){
               Product p = new Product();
               p.setProductNo(rs.getInt("product_no"));
               p.setProductName(rs.getString("product_name"));
               p.setProductPrice(rs.getInt("product_price"));
               p.setProductContent(rs.getString("product_content"));
               p.setProductType(rs.getString("product_type"));
               p.setEventCode(rs.getString("event_code"));
               p.setProductThumbnail(rs.getString("product_thumbnail"));
               p.setProductSubimg(rs.getString("product_subimg"));
               p.setProductImg1(rs.getString("product_img1"));
               p.setProductImg2(rs.getString("product_img2"));
               p.setProductImg3(rs.getString("product_img3"));
               p.setProductImg4(rs.getString("product_img4"));
               p.setProductImg5(rs.getString("product_img5"));
               p.setProductImg5(rs.getString("product_img6"));
               list.add(p);
            }
         }catch(SQLException e){
            e.printStackTrace();
         }finally{
            close(rs);
            close(pstmt);
         }
         return list;
      }
      //상품 상세 조회
      public Product detailProduct(Connection conn , int productNo) {
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  Product p = null;
    	  try {
	           pstmt = conn.prepareStatement(prop.getProperty("selectProduct"));
	           pstmt.setInt(1, productNo);
	           rs=pstmt.executeQuery();
	           while(rs.next()) {
	              p=new Product();
	              p.setProductNo(rs.getInt("product_no"));
	              p.setProductName(rs.getString("product_name"));
	              p.setProductPrice(rs.getInt("product_price"));
	              p.setProductContent(rs.getString("product_content"));
	              p.setProductType(rs.getString("product_type"));
	              p.setEventCode(rs.getString("event_code"));
	              p.setProductThumbnail(rs.getString("product_thumbnail"));
	              p.setProductSubimg(rs.getString("product_subimg"));
	              p.setProductImg1(rs.getString("product_img1"));
	              p.setProductImg2(rs.getString("product_img2"));
	              p.setProductImg3(rs.getString("product_img3"));
	              p.setProductImg4(rs.getString("product_img4"));
	              p.setProductImg5(rs.getString("product_img5"));
	              p.setProductImg5(rs.getString("product_img6"));
	           }
    	  }catch(SQLException e) {
    		  e.printStackTrace();
    	  }finally {
	           close(rs);
	           close(pstmt);
    	  }
    	  return p;
	     }
      //관련상품
      public List<Product> relateProduct(Connection conn, String type){
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  List<Product> list = new ArrayList();
    	  try {
    		  pstmt = conn.prepareStatement(prop.getProperty("relateProduct"));
    		  pstmt.setString(1, type);
    		  rs = pstmt.executeQuery();
	           while(rs.next()) {
	              Product p = new Product();
	              p.setProductName(rs.getString("product_name"));
	              p.setProductPrice(rs.getInt("product_price"));
	              p.setProductThumbnail(rs.getString("product_thumbnail"));
	              list.add(p);
	           }
	        }catch(SQLException e) {
	           e.printStackTrace();
	        }finally {
	           close(rs);
	           close(pstmt);
	        }return list;
	        
	        
	     }
   }









