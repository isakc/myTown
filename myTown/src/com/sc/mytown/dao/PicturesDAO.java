package com.sc.mytown.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sc.mytown.util.SqlSessionUtil;
import com.sc.mytown.vo.PictureVo;

public class PicturesDAO {
public static List<PictureVo> selectPictures(int no) {
		
		List<PictureVo> pictures = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			pictures = session.selectList("pictures.selectPictures",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return pictures;
	}	
	
	public static List<PictureVo> selectReplyPictures(PictureVo pictureVo) {
		
		List<PictureVo> pictures = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			pictures = session.selectList("pictures.selectReplyPictures",pictureVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return pictures;
	}	
	public static int insertRePicture(PictureVo pictureVo){

		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("pictures.insertRePicture",pictureVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
}
