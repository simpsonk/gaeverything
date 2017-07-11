package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.LogDAO;
import com.bitschool.dto.MemberDTO;

@Service
public class LogService {

	@Inject
	private LogDAO dao;
	
	public boolean loginCheckService(String email, String pw) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.loginCheck(email, pw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
