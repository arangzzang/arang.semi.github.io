package com.en.basket.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.en.common.Template.close;

import com.en.basket.model.vo.Basket;

public class BasketDao {

	private Properties prop = new Properties();
	
	public BasketDao() {
		String path = BasketDao.class.getResource("/sql/basket/basket_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
//주문 상세 페이지에서 장바구니담기 버튼 클릭시 장바구니 생성
	public int insertBasket(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBasket"));
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertInBasket(Connection conn, int productNo, int su) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertInBasket"));
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, su);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	//장바구니 존재할떄 상품담기
	public int insertInBasket(Connection conn, int productNo, int su,int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("existInBasket"));
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, productNo);
			pstmt.setInt(3, su);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<Basket> basketView(Connection conn,int bNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Basket> list = new ArrayList();
		
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("SELECTBASKET"));
			pstmt.setInt(1, bNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Basket b = new Basket();
				b.setBasketNo(rs.getInt("basket_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setProductNo(rs.getInt("product_no"));
				b.setProductThumbnail(rs.getString("product_thumbnail"));
				b.setProductName(rs.getString("product_name"));
				b.setProductContent(rs.getString("product_content"));
				b.setMount(rs.getInt("mount"));
				b.setPrice(rs.getInt("product_price"));
				b.setSalePrice(rs.getInt("SALE_PER"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	public int selectBasketNo(Connection conn,String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int b_No=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("SEARCHBASKET"));
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				b_No=rs.getInt("basket_no");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b_No;
	}
	//장바구니 상품삭제
	   public int deleteBasket(Connection conn, int basketNo, int productNo) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      try {
	         pstmt=conn.prepareStatement(prop.getProperty("deleteBasket"));
	         pstmt.setInt(1, basketNo);
	         pstmt.setInt(2, productNo);
	         result = pstmt.executeUpdate();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return result;
	   }
	   //장바구니에 같은 상품찾기
	   public int searchProduct(Connection conn,int basketNo,int productNo){
		   PreparedStatement pstmt = null;
			ResultSet rs = null;
			int pNo=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("searchProduct"));
				pstmt.setInt(1, basketNo);
				pstmt.setInt(2, productNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					pNo=rs.getInt("product_no");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return pNo;
	   }
	   //장바구니로 주문했을때 장바구니 삭제
	   public int dropBasket(Connection conn, int basketNo) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      try {
		         pstmt=conn.prepareStatement(prop.getProperty("DROPBASKET"));
		         pstmt.setInt(1, basketNo);
		         result = pstmt.executeUpdate();
		      }catch(SQLException e) {
		         e.printStackTrace();
		      }finally {
		         close(pstmt);
		      }return result;
		   }
}
