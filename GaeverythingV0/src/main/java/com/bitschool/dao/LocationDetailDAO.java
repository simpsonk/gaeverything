package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.LocationDTO;
@Repository
public class LocationDetailDAO {
	
	@Inject
	private SqlSession session;
	
	private final static String namespace = "com.bitschool.bootstrap.LocationDetailMapper";
	
	
	//locationSeq로 한 장소의 DTO 받아오기 
	public LocationDTO selectOne(int seq) throws SQLException{
		// TODO Auto-generated method stub
		LocationDTO dto = null;
		dto = session.selectOne(namespace+".selectOne",seq);
		return dto;
	}
	
	// 디테일페이지 댓글 작성 
	public boolean commentAdd(DetailCommentDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".commentAdd",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}	

}
