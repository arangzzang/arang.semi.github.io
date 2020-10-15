package com.en.basket.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.commit;
import static com.en.common.Template.rollback;

import java.sql.Connection;
import java.util.List;

import com.en.basket.model.dao.BasketDao;
import com.en.basket.model.vo.Basket;

public class BasketService {
	
	BasketDao dao = new BasketDao();
	
	//주문 상세 페이지에서 장바구니담기 버튼 클릭시 장바구니 생성
	public int insertBasket(int productNo, String memberId, int su) {
		Connection conn = getConnection();
		int result = dao.insertBasket(conn, memberId);
		if (result > 0) {
			result = dao.insertInBasket(conn, productNo, su);
		}
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	//장바구니 존재할때 상품담기
	public int insertBasket(int productNo, int su,int bNo) {
		Connection conn = getConnection();
		int result = dao.insertInBasket(conn, productNo, su,bNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Basket> basketView(int bNo){
		Connection conn = getConnection();
		List<Basket> list = dao.basketView(conn,bNo);
		close(conn);
		return list;
	}
	public int selectBasketNo(String memberId) {
		Connection conn = getConnection();
		int b_No= dao.selectBasketNo(conn,memberId);
		close(conn);
		return b_No;
	}
	//장바구니 상품 삭제
	   public int deleteBasket(int basketNo, int productNo) {
	      Connection conn = getConnection();
	      int result = dao.deleteBasket(conn, basketNo, productNo);
	      if(result>0) commit(conn);
	      else rollback(conn);
	      close(conn);
	      return result;
	   }
	   public int searchProduct(int basketNo, int productNo) {
		      Connection conn = getConnection();
		      int pNo = dao.searchProduct(conn, basketNo, productNo);
		      close(conn);
		      return pNo;
		   }
	   public int dropBasket(int basketNo) {
		      Connection conn = getConnection();
		      int result = dao.dropBasket(conn, basketNo);
		      if(result>0) commit(conn);
		      else rollback(conn);
		      close(conn);
		      return result;
		   }
}
