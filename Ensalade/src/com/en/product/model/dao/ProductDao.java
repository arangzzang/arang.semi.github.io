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
import com.en.product.model.vo.ProductComment;
import com.en.product.model.vo.ProductReview;

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
               p.setProductImg6(rs.getString("product_img6"));
               p.setSalePer(rs.getInt("sale_per"));
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
	              p.setSalePer(rs.getInt("SALE_PER"));
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
      public List<Product> relateProduct(Connection conn, String type,int productNo){
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  List<Product> list = new ArrayList();
    	  try {
    		  pstmt = conn.prepareStatement(prop.getProperty("relateProduct"));
    		  pstmt.setString(1, type);
    		  pstmt.setInt(2, productNo);
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


         
         public List<ProductReview> ProductReview(int productNo, Connection conn, int cPage, int numPerPage) {
     		PreparedStatement pstmt = null;
     		ResultSet rs = null;
     		List<ProductReview> list = new ArrayList();

     		try {
     			pstmt = conn.prepareStatement(prop.getProperty("puoductComment"));

     			pstmt.setInt(1, productNo);
     			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
     			pstmt.setInt(3, cPage * numPerPage);
     			rs = pstmt.executeQuery();

     			while (rs.next()) {
     				ProductReview pr = new ProductReview();
     				pr.setPageRef(rs.getInt("PRODUCT_REVIEW_CODE"));
     				pr.setReviewtNo(rs.getInt("PRODUCT_REVIEW_NO"));
     				pr.setReviewTitle(rs.getString("PRODUCT_REVIEW_TITLE"));
     				pr.setReviewWriter(rs.getString("PRODUCT_REVIEW_WRITER"));
     				pr.setReviewContent(rs.getString("PRODUCT_REVIEW_CONTENT"));
     				pr.setFilepath(rs.getString("FILEPATH"));
     				pr.setReviewWriteDate(rs.getDate("PRODUCT_REVIEW_WRITE_DATE"));
     				pr.setReviewViews(rs.getInt("PRODUCT_REVIEW_LIEK_CONUT"));
     				list.add(pr);

     			}

     		} catch (SQLException e) {
     			e.printStackTrace();
     		} finally {
     			close(pstmt);
     			close(rs);
     		}

     		return list;

     	}

     	public int puoductCount(Connection conn, int productNo) {
     		PreparedStatement pstmt = null;
     		ResultSet rs = null;
     		int result = 0;
     		try {
     			pstmt = conn.prepareStatement(prop.getProperty("puoductCount"));
     			pstmt.setInt(1, productNo);
     			rs = pstmt.executeQuery();
     			if (rs.next()) {
     				result = rs.getInt("CNTS");
     			}

     		} catch (SQLException e) {
     			e.printStackTrace();
     		} finally {
     			close(rs);
     			close(pstmt);
     		}
     		return result;
     	}

     	public int insertComment(Connection conn, ProductComment pc) {
     		PreparedStatement pstmt = null;
     		int result = 0;
     		try {
     			pstmt = conn.prepareStatement(prop.getProperty("insertComment"));
     		
     			pstmt.setInt(1, pc.getProductCommentLevel());
     			pstmt.setNString(2, pc.getProductCommentWriter());
     			pstmt.setNString(3, pc.getProductCommentContent());
     			pstmt.setInt(4, pc.getProductRef());
     			pstmt.setString(5, pc.getProductCommentRef() == 0 ? null : String.valueOf(pc.getProductCommentRef()));// 문제발생
     			
     			result = pstmt.executeUpdate();
     		} catch (SQLException e) {
     			e.printStackTrace();
     		} finally {
     			close(pstmt);
     		}
     		return result;
     	}
     	public List<ProductComment>searchComment(Connection conn){
      	  PreparedStatement pstmt=null;
        		ResultSet rs=null;
        	List<ProductComment> list=new ArrayList();
        	
        	try {
        		pstmt=conn.prepareStatement(prop.getProperty("searchComment"));
        		rs=pstmt.executeQuery();
        		while(rs.next()) {
        		ProductComment pc=new ProductComment();
        		pc.setProductCommentNo(rs.getInt("PRODUCT_COMMENT_NO"));
        		pc.setProductCommentLevel(rs.getInt("PRODUCT_COMMENT_LEVEL"));
        		pc.setProductCommentWriter(rs.getNString("PRODUCT_COMMENT_WRITER"));
        		pc.setProductCommentContent(rs.getString("PRODUCT_COMMENT_CONTENT"));
        		pc.setProductRef(rs.getInt("PRODUCT_REF"));
        		pc.setProductCommentRef(rs.getInt("PRODUCT_COMMENT_REF"));
        		pc.setProductCommentDate(rs.getDate("PRODUCT_COMMENT_DATE"));
        		list.add(pc);
        		}
        		}catch(SQLException e) {
        			e.printStackTrace();
        		}finally {
        			close(pstmt);
        			close(rs);
        		}return list;
        }
  	public int insertReview(Connection conn, ProductReview pr) {
  		PreparedStatement pstmt = null;
  		int result = 0;
  		try {
  			pstmt = conn.prepareStatement(prop.getProperty("insertReview"));
  		
  			
  			
  			pstmt.setInt(1, pr.getPageRef());
  			pstmt.setNString(2, pr.getReviewTitle());
  			pstmt.setString(3, pr.getReviewWriter());
  			pstmt.setNString(4, pr.getReviewContent());
  			pstmt.setNString(5, pr.getFilepath());
  			result = pstmt.executeUpdate();
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			close(pstmt);
  		}
  		return result;
  	}
  	 public int likeCount(Connection conn, int cIdx) {
		   PreparedStatement pstmt=null;
		   int result=0;
		   try {
			   pstmt=conn.prepareStatement(prop.getProperty("likeCount"));
			   pstmt.setInt(1, cIdx);
			   result=pstmt.executeUpdate();
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }return result;
	   }
	   
	   public int likeCount2(Connection conn, int cIdx) {
		   PreparedStatement pstmt=null;
		   int result=0;
		   try {
			   pstmt=conn.prepareStatement(prop.getProperty("likeCount2"));
			   pstmt.setInt(1, cIdx);
			   
			   result=pstmt.executeUpdate();
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }return result;
	   }
    	
  	public int searchCount(Connection conn,int cIdx) {
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   int lc=0;
		   try {
			   pstmt=conn.prepareStatement(prop.getProperty("searchCount"));
			   pstmt.setInt(1, cIdx);
			   rs=pstmt.executeQuery();
			   if(rs.next()) {
				   lc=rs.getInt(1);
			   }
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(rs);
			   close(pstmt);
		   }return lc;
	   }
  	
  	

   }









