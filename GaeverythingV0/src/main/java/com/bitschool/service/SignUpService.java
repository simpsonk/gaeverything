package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.MyPageDAO;
import com.bitschool.dao.SignUpDAO;
import com.bitschool.dto.MemberDTO;

@Service
public class SignUpService {

	@Inject
	private SignUpDAO dao;
	
	@Inject
	private MyPageDAO mdao;
	
	//패스워드 찾기
	public String findPW(MemberDTO member){
		String pw = null;
		try {
			pw = dao.findPW(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return pw;
	}
	
	//패스워드 체크
	public int checkPW(MemberDTO member){
		int cnt = 0;
		try {
			cnt = dao.checkPW(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return cnt;
	}
	
	//닉네임 중복체크 
	public int checkNickname(String nick){
		int cnt = 0;
		try {
			cnt = dao.checkNick(nick);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	//이메일 중복체크 
	public int checkEmail(String email){
		int cnt = 0;
		try {
			cnt = dao.checkEmail(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public boolean registUserData(MemberDTO data) {
		// TODO Auto-generated method stub
		boolean flag = false;
		boolean flag2= false;
		try {
			flag = dao.insertUserData(data);
			if(flag){
				flag2 = mdao.insertData(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return flag2;
	}

	public List<MemberDTO> getMemberList() {
		// TODO Auto-generated method stub
		List<MemberDTO> list = null;
		try {
			list = dao.selectAllMember();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public MemberDTO getMemberInfo(String email) {
		// TODO Auto-generated method stub
		MemberDTO member = null;
		try {
			member = dao.selectOneMember(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public boolean modifyInfo(MemberDTO member) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.updataMemberInfo(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteInfo(String email) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.deleteMemberInfo(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
