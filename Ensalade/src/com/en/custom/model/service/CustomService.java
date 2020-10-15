package com.en.custom.model.service;

import static com.en.common.Template.close;
import static com.en.common.Template.getConnection;
import static com.en.common.Template.rollback;
import static com.en.common.Template.commit;

import java.sql.Connection;
import java.util.List;

import com.en.custom.model.dao.CustomDao;
import com.en.custom.model.vo.CustomComment;
import com.en.custom.model.vo.CustomOrder;
import com.en.custom.model.vo.CustomPost;

public class CustomService {
	
	private CustomDao cd=new CustomDao();
	
	
	public List<CustomPost> selectCustom(String type,String key){
		Connection conn=getConnection();
		List<CustomPost> list=cd.selectCustom(conn,type,key);
		close(conn);
		return list;
		
	}
	
	public int selectCount() {
		Connection conn=getConnection();
		int total=cd.selectCount(conn);
		close(conn);
		return total;
	}
	
	public int selectCount(String type,String key) {
		Connection conn=getConnection();
		int total=cd.selectCount(conn,type,key);
		close(conn);
		return total;
	}
	
	public List<CustomPost> customList(){
		Connection conn=getConnection();
		List<CustomPost> list=cd.customList(conn);
		close(conn);
		return list;
	}
	
	 public int insertPost(CustomPost cp) {
	      Connection conn=getConnection();
	      int result=cd.insertPost(conn, cp);
	      if(result>0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	      close(conn);
	      return result;
	   }
	 
	 public List<CustomPost> customSort(String sort){
		 Connection conn=getConnection();
		 List<CustomPost> list=cd.customSort(conn,sort);
		 close(conn);
		 return list;
	 }
	 
	 public int likeCount(int cIdx) {
		 Connection conn=getConnection();
		 int result=cd.likeCount(conn,cIdx);
		 if(result>0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 
	 public int likeCount2(int cIdx) {
		 Connection conn=getConnection();
		 int result=cd.likeCount2(conn, cIdx);
		 if(result>0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 
	 public int searchCount(int cIdx) {
		 Connection conn=getConnection();
		 int likeCount=cd.searchCount(conn,cIdx);
		 close(conn);
		 return likeCount;
	 }
	 
	 public List<CustomOrder> memberCustom(String userId){
		 Connection conn=getConnection();
		 List<CustomOrder> list=cd.memberCustom(conn,userId);
		 close(conn);
		 return list;
	 }
	 
	 public CustomOrder memberCustom2(int val){
		 Connection conn=getConnection();
		 CustomOrder list=cd.memberCustom2(conn,val);
		 close(conn);
		 return list;
	 }
	 
	 public CustomPost selectCustomOne(int no,boolean flag) {
		 Connection conn=getConnection();
		 CustomPost cp=cd.selectCustomOne(conn,no);
		 if(cp!=null&&!flag) {
			 int result=cd.viewCount(conn,no);
			 if(result>0) { commit(conn); 
			 cp.setViewCount(cp.getViewCount()+1);
			 }else rollback(conn);
		 }
		 close(conn);
		 return cp;
	 }

	public List<CustomComment> commentList(int no) {
		Connection conn=getConnection();
		List<CustomComment> cc=cd.commentList(conn,no);
		close(conn);
		return cc;
	}

	public int insertComment(CustomComment cc) {
		Connection conn=getConnection();
		int result=cd.insertCommnet(conn,cc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int commentCount(int no) {
		Connection conn=getConnection();
		int cCount=cd.commentCount(conn,no);
		close(conn);
		return cCount;
	}

	public int searchCustomCount(String memberId) {
		Connection conn=getConnection();
		int count=cd.searchCustomCount(conn,memberId);
		close(conn);
		return count;
	}
	public int insertCustom(int price,String pName,String content,String memberId) {
		Connection conn=getConnection();
		int result=cd.insertCustom(conn,price,pName,content,memberId);
		if(result>0){
			result=cd.searchCustomNo(conn);
			commit(conn);
		}else{
			result=-1;
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	
	public String postList(int no){
		Connection conn=getConnection();
		String c=cd.postList(conn,no);
		close(conn);
		return c;
	}
	
	public int updatePost(CustomPost c) {
		Connection conn=getConnection();
		int result=cd.updatePost(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<CustomPost> myPage(String id) {
		Connection conn = getConnection();
		List<CustomPost> list = cd.myPage(conn,id);
		close(conn);
		return list;
	}
	
	public List<CustomPost> customList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<CustomPost> list=cd.customList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	

}
