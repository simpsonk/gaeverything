package com.bitschool.dao;

import java.sql.SQLException;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.bootstrap.SignUpMapper";	
	
	public boolean loginCheck(String email, String pw) throws SQLException{
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);
		
		int result = session.selectOne(namespace+".idCheck", map);
		if(result==1){
			flag = true;
		}
		
		return flag;
	}

}
