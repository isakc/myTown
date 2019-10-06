package com.sc.mytown.dao;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;

public class GradesDAO {
	
	public static int selectGradeCount(int no){
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			total = session.selectOne("grades.selectGradeCount",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return total;		
	}

	public static int selectGrade(int no){
	      int grade = 0;
	      
	      SqlSession session = null;
	      
	      try {
	         session = SqlSessionUtil.getSqlSession();
	         grade = session.selectOne("grades.selectGrade",no);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if(session!=null){
	            session.close();
	         }//if end
	      }//try~catch~finally end
	      
	      return grade;      
	   }
	
	public static double selectGradeSpot(int spotNo){
		
		double grade = 0;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			grade = session.selectOne("grades.selectGradeSpot", spotNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return grade;
	}//selectGrade() end
}
