package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.LocationDetailDAO;
import com.bitschool.dto.LocationDTO;
@Service
public class LocationDetailService {

	
	@Inject
	private LocationDetailDAO dao;
	
	
	//locationSeq로 한 장소의 DTO 받아오기 
	public LocationDTO selectOne(int seq){
		// TODO Auto-generated method stub
		LocationDTO dto = null;
		try {
			dto = dao.selectOne(seq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}

}
