package com.sc.mytown.dao;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.HitVo;

public class HitsDAO {

	public static HitVo selectHitOne(int no){
		HitVo users = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			users = session.selectOne("hits.selectHitOne",no);
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
