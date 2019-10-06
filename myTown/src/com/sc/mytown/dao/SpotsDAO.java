package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.PageVo;
import com.sc.mytown.vo.SpotVo;

public class SpotsDAO {
	
	
	public static List<SpotVo> selectNearSpot(SpotVo spotVo){
		//그 스팟의 번호를 가져왓!!
		List<SpotVo> spots = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			spots = session.selectList("spots.selectNearSpot", spotVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return spots;
	}
	
	public static SpotVo selectSpot(int no){
		//그 스팟의 번호를 가져왓!!
		SpotVo spot = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			spot = session.selectOne("spots.selectSpotOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return spot;
	}
	
	public static int updateSpotPrice(SpotVo spotVo){
		//그 스팟의 번호를 가져왓!!
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.update("spots.updateSpotPrice",spotVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return result;
	}
	
	public static List<SpotVo> spotsSelectList(PageVo pageVo) {
		List<SpotVo> spotList = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			spotList = session.selectList("spots.spotsSelectList", pageVo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return spotList;
	}

	
	
	public static int insertSpot(SpotVo spotVo) {
		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("spots.insertSpot", spotVo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return result;
	}
	
	public static List<SpotVo> selectReplyList(int no){
		List<SpotVo> spot = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			spot = session.selectList("spots.selectReplyList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return spot;		
	}
	
	public static List<SpotVo> selectGradeList(int no){
		List<SpotVo> spot = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			spot = session.selectList("spots.selectGradeList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return spot;		
	}
	
	public static SpotVo selectPicList(int no ){
		
		SpotVo spotList = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			spotList  = session.selectOne("spots.selectPicList",no);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return spotList;
	}
	
	public static List<SpotVo> selectSpotList(PageVo pagevo){
		
		List<SpotVo> spotList = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			spotList  = session.selectList("spots.selectSpotList",pagevo);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return spotList;
	}
	
	public static List<SpotVo> selectList(PageVo pagevo){
		
		List<SpotVo> spotList = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			spotList  = session.selectList("spots.selectList",pagevo);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return spotList;
	}

	public static int selectTotal(){
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("spots.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return total;		
	}
	
	public static int selectTotalsung(PageVo pageVo) {
		int total = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("spots.selectTotalsung",pageVo);
		}catch(Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}finally {
			session.close();
		} // try~catch~finally end

		return total;
	} // selectTotal() end
	
	public static List<SpotVo> spotStamps(PageVo pagevo){
		
		List<SpotVo> spotList = null;
		
		SqlSession session =null;
		
		try{
			session = SqlSessionUtil.getSqlSession();
			spotList  = session.selectList("spots.spotStamps",pagevo);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		return spotList;
	}
	
}
