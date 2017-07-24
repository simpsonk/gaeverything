package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

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

	// 디테일페이지 댓글 리스팅 
	public List<DetailCommentDTO> commentList(int locseq) throws SQLException{
		// TODO Auto-generated method stub
		List<DetailCommentDTO> dto = null;
		dto = session.selectList(namespace+".commentList",locseq);
		return dto;
	}

/*	// 닉네임으로 포토 불러오기 
	public String getPhoto(String nickname) throws SQLException{
		String photo = null;
		photo = session.selectOne(namespace+".getPhoto",nickname);
		return photo;
	}*/

}
