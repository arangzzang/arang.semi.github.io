package com.en.order.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.commit;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;

import java.sql.Connection;
import java.util.List;

import com.en.order.model.dao.OrderDao;
import com.en.order.model.vo.Order;

public class OrderService {

	private OrderDao dao = new OrderDao();
	//주문테이블 삽입
	public int insertOrder(String memo,int total,String address,int delivery,String memberId,int[] productNo,int[] amount) {
		Connection conn = getConnection();
		int result = dao.insertOrder(conn,memo,total,address,delivery, memberId);
		if (result > 0) {//장바구니가 생성됐을때 
			for(int i=0;i<productNo.length;i++){
				result = dao.insertInOrder(conn, productNo[i], amount[i]);
			}
		}
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int searchOrderNo(String memberId){
		Connection conn = getConnection();
		int result =dao.searchOrderNo(conn,memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<Order> orderView(int orderNo){
		Connection conn =getConnection();
		List<Order> list= dao.orderView(conn, orderNo);
		close(conn);
		return list;
	}
}
