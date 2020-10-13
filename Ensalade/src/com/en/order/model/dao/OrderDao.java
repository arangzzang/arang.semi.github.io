package com.en.order.model.dao;

import static com.en.common.Template.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.en.basket.model.vo.Basket;
import com.en.order.model.vo.Order;



public class OrderDao {

	private Properties prop = new Properties();

	public OrderDao() {

		try {
			String path = OrderDao.class.getResource("/sql/order/order_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertOrder(Connection conn, String memo,int total,String address,int delivery,String memberId) {//객체
		PreparedStatement pstmt = null;
		int result = 0;;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("INSERTORDER"));
			pstmt.setString(1, memo);
			pstmt.setInt(2, total);
			pstmt.setString(3,address);
			pstmt.setInt(4, delivery);
			pstmt.setString(5, memberId);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertInOrder(Connection conn, int productNo, int amount) {//수량
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("INSERTINORDER"));
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, amount);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int searchOrderNo(Connection conn,String memberId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int orderNo=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("SEARCHORDER"));
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orderNo=rs.getInt("ORDER_NO");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orderNo;
	}
	public List<Order> orderView(Connection conn,int orderNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("SELECTORDER"));
			pstmt.setInt(1, orderNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOrderNo(rs.getInt("ORDER_NO"));
				o.setOrderDate(rs.getDate("ORDER_DATE"));
				o.setOrderMount(rs.getInt("ORDER_MOUNT"));
				o.setOrderStatus(rs.getString("ORDER_STATUS"));
				o.setProductContent(rs.getString("PRODUCT_CONTENT"));
				o.setProductName(rs.getString("PRODUCT_NAME"));
				o.setProductThumbnail(rs.getString("PRODUCT_THUMBNAIL"));
				o.setProductPrice(rs.getInt("PRODUCT_PRICE"));
				o.setDelivery(rs.getInt("DELIVERY"));
				o.setMemo(rs.getString("MEMO"));
				o.setOrderAddress(rs.getString("ORDER_ADDRESS"));
				o.setTotalPrice(rs.getInt("TOTAL_PRICE"));
				list.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<Order> myPage(Connection conn, String id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("mypage"));
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOrderDate(rs.getDate("order_date"));
				o.setProductThumbnail(rs.getString("product_thumbnail"));
				o.setProductName(rs.getString("product_name"));
				o.setProductContent(rs.getString("product_content"));
				o.setOrderMount(rs.getInt("order_mount"));
				o.setProductPrice(rs.getInt("total_price"));
				o.setOrderStatus(rs.getString("order_status"));
				list.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
}
