package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.ActUserDTO;

@Repository
public class BoardDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.gaeverything.BoardMapper";

	public boolean searchStatus(ActUserDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int count = session.selectOne(namespace+".selectStatus", dto);
		if(count!=0){
			flag = true;
		}
		return flag;
	}

}
