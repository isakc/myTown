package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.AddHashTagVo;
import com.sc.mytown.vo.HashTagVo;
import com.sc.mytown.vo.SpotVo;

public class AddHashTagsDAO {
	
		
		public static int insertAddHashTag(AddHashTagVo addHashtagVo) {
			
			int result = 0;
			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.insert("addHashTags.insertAddHashTag",addHashtagVo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null) {
					session.close();
				}
			}
			return result;
		}	
	
	public static List<HashTagVo> selectGuAddHashTagVo(SpotVo spot){
		List<HashTagVo> list = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			list = session.selectList("addHashTags.selectGuHashTags",spot);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return list;
	}//selectGuAddHashTagVo() end
	
	public static int insertAddHashTags(AddHashTagVo addHashTagvo){
		int result = 0;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("addHashTags.insertAddHashTag",addHashTagvo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return result;
	}//insertAddHashTags() end
	
	public static List<AddHashTagVo> talkTagList(int talkNo) {
		List<AddHashTagVo> addTags = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			addTags = session.selectList("addHashTags.talkTagList", talkNo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return addTags;
	}
	
}
