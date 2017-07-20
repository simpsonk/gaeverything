package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;

@Repository
public class MyPageDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.bootstrap.MyPageMapper";
	
	
	public boolean modifyMemData(MyPageDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.update(namespace+".updateMem",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}	
	
	//회원가입 때 입력한 email을 mypage 테이블에 추가(SignUpService에서 호출)
	public boolean insertData(MemberDTO data) throws SQLException{
		boolean flag= false;
		int aCnt = session.insert(namespace+".insert", data);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	//수정(photo는 수정X)
	public boolean modifyData2(MyPageDTO member) throws SQLException{
		// TODO Auto-generated method stub
		System.out.println("MyPageDAO-modifyData2에 들어왔다");
		boolean flag = false;
		int aCnt = session.update(namespace+".update2",member);
		if(aCnt>0){
			flag = true;
		}
		System.out.println(flag);
		return flag;
	}
	
	//수정 
	public boolean modifyData(MyPageDTO member) throws SQLException{
		// TODO Auto-generated method stub
		System.out.println("MyPageDAO-modifyData에 들어왔다");
		boolean flag = false;
		int aCnt = session.update(namespace+".update",member);
		if(aCnt>0){
			flag = true;
		}
		System.out.println(flag);
		return flag;
	}
	
	//한명 불러오기
	public MyPageDTO selectData(MemberDTO member) throws SQLException{
		MyPageDTO mypage = null;
		mypage = session.selectOne(namespace+".selectOne", member);
		return mypage;
	}




}
