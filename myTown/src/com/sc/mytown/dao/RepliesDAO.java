package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.PageVo;
import com.sc.mytown.vo.ReplyVo;
import com.sc.mytown.vo.TownstalkVo;

public class RepliesDAO {
	
public static List<ReplyVo> selectReplyPage(PageVo page) {
		
		List<ReplyVo> replies = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			replies = session.selectList("replies.selectReplyPage",page);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return replies;
		}	
		
		
		
		
		public static int insertReply(ReplyVo reply){
		
			int result = 0;
			SqlSession session = null;

			try {
				session = SqlSessionUtil.getSqlSession();
				result = session.insert("replies.insertReply",reply);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null) {
					session.close();
				}
			}
			return result;
		}	

	public static List<ReplyVo> selectReplyList(int no){
		List<ReplyVo> reply = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			reply = session.selectList("replies.selectReplyListsa",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return reply;		
	}

	public static ReplyVo selectReplyOne(int no){
		ReplyVo reply = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			reply = session.selectOne("replies.selectReplyOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return reply;		
	}
}
