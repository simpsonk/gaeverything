package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BoardDAO;
import com.bitschool.dto.ActUserDTO;

@Service
public class BoardService {
	
	@Inject
	private BoardDAO dao;
	
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
	
}
