package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.AddressVo;

public class AddressDAO {
	
	public static AddressVo selectAddressOne(int no){
		//그 스팟의 번호를 가져왓!!
		AddressVo address = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			address = session.selectOne("address.selectAddressOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null){
				session.close();
			}//if end
		}//try~catch~finally end
		
		return address;
	}

	public static List<AddressVo> selectGu(){
		List<AddressVo> list = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			list = session.selectList("address.selectGu");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return list;
	}//selectGu() end
	
	public static AddressVo selectByName(String name){
		AddressVo address = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			address = session.selectOne("address.selectByName", name);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return address;
	}//selectAddressNo() end
	
	public static List<AddressVo> selectByGu(int parentsNo){
		List<AddressVo> list = null;
		
		SqlSession session = null;
		try{
			session = SqlSessionUtil.getSqlSession();
			list = session.selectList("address.selectByGu", parentsNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null){session.close();}
		}//try~ catch finally end
		return list;
	}//selectByGu() end
	
	public static List<AddressVo> guSelectList() {
		List<AddressVo> guList = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			guList = session.selectList("address.guSelectList");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return guList;
	}
	
	public static List<AddressVo> dongSelectList(int guNo) {
		List<AddressVo> dongList = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSqlSession();
			dongList = session.selectList("address.dongSelectList",guNo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return dongList;
	}
}
