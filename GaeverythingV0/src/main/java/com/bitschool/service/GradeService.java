package com.bitschool.service;





import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.GradeDAO;
import com.bitschool.dto.GradeDTO;



@Service
public class GradeService {
	
	@Inject
	private GradeDAO dao;
	
	// 회원가입할 때 호출한다
	public boolean insertNew(GradeDTO dto){
		boolean flag = false;
		try {
			flag = dao.insertNew(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	//grade 테이블에 데이터 insert
	public boolean insertInfo(GradeDTO dto){
		boolean flag = false;
		try {
			flag = dao.insertInfo(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	//grade 테이블에 데이터 한개 삭제
	public boolean deleteInfo(GradeDTO dto){
		boolean flag = false;
		try {
			flag = dao.deleteInfo(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
