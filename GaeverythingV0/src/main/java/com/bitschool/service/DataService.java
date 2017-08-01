package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.DataDAO;
import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.Location2DTO;

@Service
public class DataService {
	
	@Inject
	private DataDAO dao;
	
	public boolean insertData(Location2DTO dto){
		boolean flag = false;
		try {
			flag = dao.insertData(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean insertBlogData(BlogDTO dto) {
		boolean flag = false;
		try {
			flag = dao.insertBlogData(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
