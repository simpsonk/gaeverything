package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.ReactionDAO;
import com.bitschool.dto.ReactionDTO;


@Service
public class ReactionService {
	
	@Inject
	private ReactionDAO dao;
	
	public boolean insertReaction(ReactionDTO dto){
		boolean flag = false;
		try {
			flag = dao.insertReaction(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<ReactionDTO> selectReaction(String nickname){
		List<ReactionDTO> list = null;
		try {
			list = dao.selectReaction(nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
