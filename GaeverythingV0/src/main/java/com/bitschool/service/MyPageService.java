package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.MyPageDAO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;

@Service
public class MyPageService {
	
	@Inject
	private MyPageDAO mdao;
	
	//photo 수정시 memberDTO의 photo도 바뀌도록
	public boolean updateMemData(MyPageDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = mdao.modifyMemData(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	//회원정보 수정(photo는 수정하지 않을 때)
	public boolean updateData2(MyPageDTO member){
		System.out.println("MyPageService-updateData2에 들어왔다");
		boolean flag = false;
		try {
			flag = mdao.modifyData2(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	//회원정보 수정
	public boolean updateData(MyPageDTO member) {
		// TODO Auto-generated method stub
		System.out.println("MyPageService-updateData에 들어왔다");
		boolean flag = false;
		try {
			flag = mdao.modifyData(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	//회원정보 불러오기
	public MyPageDTO readData(MemberDTO member){
		MyPageDTO mypage = null;
		try {
			mypage = mdao.selectData(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mypage;
	}


}
