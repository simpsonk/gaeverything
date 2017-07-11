package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.MemberDTO;

@Repository
public class SignUpDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.bootstrap.SignUpMapper";
	
	public boolean insertUserData(MemberDTO data)throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert", data);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public List<MemberDTO> selectAllMember() throws SQLException{
		// TODO Auto-generated method stub
		List<MemberDTO> list = session.selectList(namespace+".listAll");
		return list;
	}

	public MemberDTO selectOneMember(String email) throws SQLException {
		// TODO Auto-generated method stub
		MemberDTO member = session.selectOne(namespace+".listOne", email);
		return member;
	}

	public boolean updataMemberInfo(MemberDTO member) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.update(namespace+".updateInfo", member);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean deleteMemberInfo(String email) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.update(namespace+".deleteInfo", email);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

}
