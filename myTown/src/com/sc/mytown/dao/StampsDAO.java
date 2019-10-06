package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.SpotVo;
import com.sc.mytown.vo.StampVo;

public class StampsDAO {
	

	public static int selectStampCount(int no){
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("stamps.selectStampCount",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return total;		
	}
	
	public static int selectStamp(StampVo stampVo){
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.selectOne("stamps.selectStamp",stampVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return result;		
	}
	
	public static int deleteStamp(StampVo stampVo){
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.delete("stamps.deleteStamp",stampVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return result;		
	}
	
	
	
	public static int insertStamp(StampVo stampVo){
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("stamps.insertStamp",stampVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return result;		
	}

	public static List<StampVo> getFavotiteList(int userNo) {
		List<StampVo> favoriteList = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			favoriteList = session.selectList("stamps.selectListByUserNo", userNo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return favoriteList;
	}
	
public static List<SpotVo> selectStamps(int no){
		
	List<SpotVo> list = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			list  = session.selectList("stamps.selectStamps", no);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return list;
	}



}
