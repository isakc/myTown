package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.AddHashTagVo;
import com.sc.mytown.vo.HashTagVo;

public class HashTagsDAO {
	
public static List<HashTagVo> selectHashtags(int no) {
		
		List<HashTagVo> hashtags = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			hashtags = session.selectList("hashtags.selectHashtags",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return hashtags;
		}	
		
		public static List<HashTagVo> selectReviewHashtags(AddHashTagVo addHashtagVo) {
			
			List<HashTagVo> reviewHashtags = null;
			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSqlSession();
				reviewHashtags = session.selectList("hashtags.selectReviewHashtags",addHashtagVo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null) {
					session.close();
				}
			}
			return reviewHashtags;
		}	
		
			public static Integer selectBytag(String tag) {
	
			Integer result = 0;
			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.selectOne("hashtags.selectBytag",tag);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null) {
					session.close();
				}
			}
			return result;
			}	
			
			public static int insertTag(String tag) {
				
				int result = 0;
				SqlSession session = null;

				try {
					session = SqlSessionUtil.getSqlSession();
					result = session.insert("hashtags.insertTag",tag);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (session != null) {
						session.close();
					}
				}
				return result;
			}	
	
	public static List<HashTagVo> selectPostsHashTags(int contentNo){
		List<HashTagVo> list = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			list = session.selectList("hashtags.selectPostsHashTags",contentNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return list;
	}//selectPostsHashTags() end
	
	public static List<HashTagVo> selectSecondCategory(){
		List<HashTagVo> list = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			list = session.selectList("hashtags.selectSecondCategory");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return list;
	}//selectFoodCategory() end
	
	public static boolean selectByTag(String tag){
		HashTagVo hashTag = null;
		boolean flag = false;
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			hashTag = session.selectOne("hashtags.selectByTag", tag);
			if(hashTag!=null){
				flag= true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return flag;
	}//selectByTag() end
	
	public static int selectByStringTag(String tag){
		int hashTagNum = 0;
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			hashTagNum = session.selectOne("hashtags.selectByStringTag", tag);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return hashTagNum;
	}//selectByStringTag() end
	
	public static int insertHashTag(String hashTag){
		int result = 0;
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("hashtags.insertHashTag", hashTag);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return result;
	}//insertHashTag() end

	
}
