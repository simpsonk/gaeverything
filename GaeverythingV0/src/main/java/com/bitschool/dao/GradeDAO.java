package com.bitschool.dao;


import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.GradeDTO;

@Repository
public class GradeDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.gaverything.GradeMapper";

	// 회원가입할 때 호출한다
	public boolean insertNew(GradeDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertNew",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	//grade 테이블에 데이터 입력
	public boolean insertInfo(GradeDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertInfo",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	//grade 테이블에 데이터 한개 삭제
	public boolean deleteInfo(GradeDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.delete(namespace+".deleteInfo", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	
}
