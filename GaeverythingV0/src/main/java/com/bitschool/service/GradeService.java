package com.bitschool.service;





import java.sql.SQLException;
import java.util.List;

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
			this.updateTotal(dto.getNickname());
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
			this.updateTotal(dto.getNickname());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	//point 합계설정(total)
	public boolean updateTotal(String nickname){
		boolean flag = false;
		try {
			flag = dao.updateTotal(nickname);
			this.updateGrade();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag; 
	}
	
	//gradename 계산
	public boolean updateGrade(){
		boolean flag = false;
		try {
			flag = dao.updateGrade1();
			dao.updateGrade2();
			dao.updateGrade3();
			dao.updateGrade4();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	// 회원 grade 기록 가져오기
	public List<GradeDTO> selectGradeInfo(String nickname){
		List<GradeDTO> list = null;
		try {
			list = dao.selectGradeInfo(nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
