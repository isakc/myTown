package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.MenuVo;

public class MenuDAO {
	public static int insertMenu(MenuVo menuVo){
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("menu.insertMenu",menuVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return result;		
	}
	
	public static int selectMenuPrice(int no){
		int price = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			price = session.selectOne("menu.selectMenuPrice",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return price;		
	}
	
	public static List<MenuVo> selectMenu(int no) {
		
		List<MenuVo> menu = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			menu = session.selectList("menu.selectMenu",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return menu;
	}	
}
