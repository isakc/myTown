package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.PageVo;
import com.sc.mytown.vo.TownstalkVo;

public class TownstalksDAO {
		
		public static List<TownstalkVo> talkList(PageVo pageVo) {
			List<TownstalkVo> talkList = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				talkList = session.selectList("townstalks.talkList",pageVo);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			
			return talkList;
		}
		public static List<TownstalkVo> talkListByCategory(PageVo pageVo) {
			List<TownstalkVo> talkList = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				talkList = session.selectList("townstalks.talkListByCategory",pageVo);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			
			return talkList;
		}
		
		public static int selectTotal(int addressNo) {
			int total = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				total = session.selectOne("townstalks.selectTotalsim",addressNo);
			}catch(Exception e) {
				System.out.println("에러");
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			} // try~catch~finally end
			
			return total;
		} // selectTotal() end
		
		// by category //
		public static int selectTotal(PageVo pageVo) {
			int total = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				total = session.selectOne("townstalks.selectTotalByCategory",pageVo);
			}catch(Exception e) {
				System.out.println("에러");
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			} // try~catch~finally end
			
			return total;
		} // selectTotal() end
		
		
		/* Best Talk List */
		public static List<TownstalkVo> bestTalkList(PageVo pageVo) {
			List<TownstalkVo> talkList = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				talkList = session.selectList("townstalks.bestTalkList",pageVo);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			
			return talkList;
		}
		
		public static List<TownstalkVo> bestTalkListByCategory(PageVo pageVo) {
			List<TownstalkVo> talkList = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				talkList = session.selectList("townstalks.bestTalkListByCategory",pageVo);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			
			return talkList;
		}
		
		public static int bestTalkSelectTotal(int addressNo) {
			int total = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				total = session.selectOne("townstalks.bestTalkSelectTotal",addressNo);
			}catch(Exception e) {
				System.out.println("에러");
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			} // try~catch~finally end
			
			return total;
		} // selectTotal() end
		
		// by category //
		public static int bestTalkSelectTotal(PageVo pageVo) {
			int total = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				total = session.selectOne("townstalks.bestTalkSelectTotal",pageVo);
			}catch(Exception e) {
				System.out.println("에러");
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			} // try~catch~finally end
			
			return total;
		} // selectTotal() end
		
		/* Townstalk Select One */
		public static TownstalkVo talkSelectOne(int talkNo) {
			TownstalkVo talk = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				talk = session.selectOne("townstalks.selectOne", talkNo);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			
			return talk;
		}
	
	public static List<TownstalkVo> getTownstalks(PageVo pagevo){
		
		List<TownstalkVo> townstalk = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			townstalk  = session.selectList("townstalks.selectList",pagevo);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return townstalk;
	}
	
	public static int selectTotal(){
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("townstalks.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return total;		
	}
	
	public static List<TownstalkVo> selectTownstalkUser(int no){
		List<TownstalkVo>  townstalk = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			townstalk = session.selectList("townstalks.selectTownstalkUser",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return townstalk;		
	}
	
	public static TownstalkVo selectTownstalk(int no){
		TownstalkVo townstalk = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			townstalk = session.selectOne("townstalks.selectTownstalk",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return townstalk;		
	}

}