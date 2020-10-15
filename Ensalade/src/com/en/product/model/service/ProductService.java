package com.en.product.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.commit;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;

import java.sql.Connection;
import java.util.List;

import com.en.product.model.dao.ProductDao;
import com.en.product.model.vo.Product;
import com.en.product.model.vo.ProductComment;
import com.en.product.model.vo.ProductReview;

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
   public List<Product> relateProduct(String type,int productNo){
      Connection conn = getConnection();
      List<Product> types = dao.relateProduct(conn, type,productNo);
      close(conn);
      return types;
   }
   //상품 리뷰 리스트 페이징
   public List<ProductReview> ProductReview(  int productNo, int cPage,int numPerPage) {
	   Connection conn=getConnection();
	   List<ProductReview> list=dao.ProductReview( productNo,conn,cPage,numPerPage);
	   close(conn);
	   return list;
	
   }
   //상품 리뷰 페이징 전체 게시물 수
   public int puoductCount(int productNo) {
		
		Connection conn= getConnection();
		int result=dao.puoductCount(conn,productNo);
		if(result>0)commit(conn); 
		else rollback(conn);
		close(conn);
		return result;
	}
   //상품 리뷰 댓글 등록
   public int insertComment(ProductComment pc) {
	  
		Connection conn=getConnection();
		int result=dao.insertComment(conn,pc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
   //댓글 정렬 레벨 설정
   public List<ProductComment>searchComment(){
	   Connection conn=getConnection();
	   List<ProductComment> list=dao.searchComment(conn);
	   close(conn);
	   return list;
   }
   public int insertReview(ProductReview pr) {
	   Connection conn=getConnection();
	   int result = dao.insertReview(conn,pr);
	   if(result>0)commit(conn);
	   else rollback(conn);
	   close(conn);
	   return result;
	   
   }
   public int likeCount(int cIdx) {
		 Connection conn=getConnection();
		 int result=dao.likeCount(conn,cIdx);
		 if(result>0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 
	 public int likeCount2(int cIdx) {
		 Connection conn=getConnection();
		 int result=dao.likeCount2(conn, cIdx);
		 if(result>0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
   public int searchCount(int cIdx) {
		 Connection conn=getConnection();
		 int likeCount=dao.searchCount(conn,cIdx);
		 close(conn);
		 return likeCount;
	 }
   public List<ProductReview> myPage(String id){
	   Connection conn = getConnection();
	   List<ProductReview> prList=dao.myPage(conn,id);
	   close(conn);
	   return prList;
   }
   
   
   
}