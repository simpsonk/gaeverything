package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.DataDAO;
import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.Location2DTO;
import com.bitschool.dto.LocationDTO;

@Service
public class DataService {
	
	@Inject
	private DataDAO dao;
	
	public List<LocationDTO> selectLocation(){
		List<LocationDTO> list = null;
		try {
			list = dao.selectLocation();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
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
