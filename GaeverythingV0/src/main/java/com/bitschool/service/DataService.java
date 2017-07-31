package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.DataDAO;
import com.bitschool.dto.Location2DTO;
import com.bitschool.dto.LocationDTO;

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
}
