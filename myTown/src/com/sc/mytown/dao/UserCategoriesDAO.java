package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.UserCategoryVo;

public class UserCategoriesDAO {
	
	
	
	public static int insertUser(UserCategoryVo user){
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("usercategories.insertUser",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}
		}
		return result;
	}
	
	public static int deleteUserHash(int no){
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.delete("usercategories.deleteUserHash",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}
		}
		return result ;
	}
	
	public static List<UserCategoryVo> selectUserHashList(int no){
		List<UserCategoryVo> users = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			users = session.selectList("usercategories.selectUserHashList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return users;		
	}
}
