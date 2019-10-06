package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.PageVo;
import com.sc.mytown.vo.UserVo;

public class UsersDAO {
	
	public static List<UserVo> getSpots(PageVo pagevo){
	      
	      List<UserVo> list = null;
	      
	      SqlSession session =null;
	      
	      try{
	         session = SqlSessionUtil.getSqlSession();
	         list  = session.selectList("users.selectList",pagevo);
	      }catch(Exception e){
	         e.printStackTrace();
	      }finally {
	         if(session!=null){
	            session.close();
	         }//if end
	      }//try~catch~finally end
	      return list;
	   }
	   
	   public static int selectTotal(){
	      int total = 0;
	      
	      SqlSession session = null;
	      
	      try {
	         session = SqlSessionUtil.getSqlSession();
	         total = session.selectOne("users.selectTotal");
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if(session!=null){
	            session.close();
	         }//if end
	      }//try~catch~finally end
	      
	      return total;      
	   }
	
	
	
	public static UserVo selectLogin(UserVo user){
		UserVo users = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			users = session.selectOne("users.loginUserCheck",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		
		return users;		
	}
	
	public static UserVo selectUserOne(int no){
		UserVo users = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			users = session.selectOne("users.selectUserOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return users;		
	}
	
	public static UserVo selectByFounderNo(int founderNo){
		UserVo users = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			users = session.selectOne("users.selectByFounderNo",founderNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return users;		
	}
	
	public static int selectCheckId(String nickname){
		int num = 0;
		
		SqlSession session = null;
		
		try {
			session= SqlSessionUtil.getSqlSession();
			num = session.selectOne("users.selectCheckNickname",nickname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		
		return num;
	}
	
	
	
	public static int updateUser(UserVo user){
		int result = 0;
		
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSqlSession();
			result= session.update("users.updateUser",user);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null){
				session.close();
			}//if end
		}//try~catch~finally end
		return result;
	}
	

}
