package com.bitschool.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;

@Repository
public class ActUserDAO {
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.bitschool.gaeverything.ActUserMapper";	
	
	public List<EventDTO> selectEventBookmark(String email) throws SQLException{
		List<EventDTO> list = null;
		list = session.selectList(nameSpace+".selectEventBookmark", email);
		return list;
	}
		
	public List<LocationDTO> selectShopBookmark(String email) throws SQLException{
		List<LocationDTO> list = null;
		list = session.selectList(nameSpace+".selectShopBookmark", email);
		return list;
	}
	
	public List<BoardDTO> selectReviewBookmark(String email) throws SQLException{
		List<BoardDTO> list = null;
		list = session.selectList(nameSpace+".selectReviewBookmark", email);
		return list;
	}
	

	public boolean searchStatus(ActUserDTO dto) throws SQLException{
		boolean flag = false;
		System.out.println(dto);
		int count = session.selectOne(nameSpace+".selectStatus", dto);
		System.out.println(count);
		if(count!=0){
			flag = true;
		}
		return flag;
	}

	public boolean insertLikeStatus(ActUserDTO dto) throws SQLException {
		boolean flag = false;
		int aCnt = session.insert(nameSpace+".insertLikeStatus", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.delete(nameSpace+".deleteLikeStatus", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean insertDetailPageLikeStatus(ActUserDTO aDTO) throws SQLException{
		boolean flag = false;
		int aCnt = session.update(nameSpace+".insertDetailPageLikeStatus", aDTO);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean deleteDetailPageLikeStatus(ActUserDTO aDTO) throws SQLException{
		boolean flag = false;
		int aCnt = session.update(nameSpace+".deleteDetailPageLikeStatus", aDTO);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public int getLikeCount(ActUserDTO dto) throws SQLException{
		int count = 0;
		count = session.selectOne(nameSpace+".selectCount", dto);
		return count;
	}
}
