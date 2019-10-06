package com.sc.mytown.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	
	//이 메서드를 호출하면 SqlSession객체를
	//넘겨줍니다.
	public static SqlSession getSqlSession(){
		//제일 윗줄에 리턴자료형 지역변수 선언
		//및 초기화
		SqlSession session = null;
		
		try {
			
			Reader reader = 
					Resources.getResourceAsReader("com/sc/mytown/config/mybatis-config.xml");
			
			SqlSessionFactory factory = 
					new SqlSessionFactoryBuilder().build(reader);
			
			session = factory.openSession(true);
			
		} catch (Exception e) {
			//디버깅 처리(에러났는지 확인용)
			e.printStackTrace();
		}//try~catch end
		
		return session;
	}//getSqlSession() end

}//SqlSessionUtil end
