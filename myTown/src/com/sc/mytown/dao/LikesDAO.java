package com.sc.mytown.dao;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.LikeVo;

public class LikesDAO {
	
	public static int selectReviewLike(int no){
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("likes.selectReviewLike",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return total;		
		}
		
		public static int selectLike(LikeVo likeVo){
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.selectOne("likes.selectLike",likeVo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null){
					session.close();
				}//if end
			}//try~catch~finally end
			
			return result;		
		}
			
		public static int deleteLike(LikeVo likeVo){
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.delete("likes.deleteLike",likeVo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null){
					session.close();
				}//if end
			}//try~catch~finally end
			
			return result;		
		}
		
		public static int insertLike(LikeVo likeVo){
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.insert("likes.insertLike",likeVo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null){
					session.close();
				}//if end
			}//try~catch~finally end
			
			return result;	
		}

		public static int selectLikeOne(int no){
		
			int count = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			count = session.selectOne("likes.selectLikeOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return count;		
	}
	
}
