package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

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
	
	public List<ReactionDTO> selectReaction(String nickname) throws SQLException{
		List<ReactionDTO> list = null;
		list = session.selectList(namespace+".selectReaction", nickname);
		return list;
	}
	
	public String selectNickname(String email) throws SQLException{
		String nickname = null;
		nickname = session.selectOne(namespace+".selectNickname", email);
		return nickname;
	}
	
	public boolean deleteReaction(ReactionDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.delete(namespace+".deleteReaction", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}


}
