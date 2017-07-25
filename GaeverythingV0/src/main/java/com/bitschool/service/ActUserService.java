package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.ActUserDAO;
import com.bitschool.dto.ActUserDTO;

@Service
public class ActUserService {
	@Inject
	private ActUserDAO dao;
	
	public boolean getLikeStatus(ActUserDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.searchStatus(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean setLikeStatus(ActUserDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.insertLikeStatus(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.deleteLikeStatus(dto);
		return flag;
	}

	
}
