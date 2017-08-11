package com.bitschool.dao;

import java.sql.SQLException;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.ReactionDTO;



@Repository
public class ReactionDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.bootstrap.ReactionMapper";

	public boolean insertReaction(ReactionDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertReaction", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	

}
