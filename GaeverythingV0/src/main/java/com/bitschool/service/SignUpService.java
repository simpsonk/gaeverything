package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.SignUpDAO;
import com.bitschool.dto.MemberDTO;

@Service
public class SignUpService {

	@Inject
	private SignUpDAO dao;
	
	public boolean registUserData(MemberDTO data) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.insertUserData(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
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
