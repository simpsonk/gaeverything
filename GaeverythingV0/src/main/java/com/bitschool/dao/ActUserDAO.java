package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.ActUserDTO;

@Repository
public class ActUserDAO {
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.bitschool.gaeverything.ActUserMapper";

	public boolean searchStatus(ActUserDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int count = session.selectOne(nameSpace+".selectStatus", dto);
		if(count!=0){
			flag = true;
		}
		return flag;
	}

	public boolean insertLikeStatus(ActUserDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(nameSpace+".insertLikeStatus", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.delete(nameSpace+".deleteLikeStatus", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
}
