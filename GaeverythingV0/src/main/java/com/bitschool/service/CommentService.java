package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IBoardDAO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;

@Service
public class CommentService implements ICommentService{

	@Inject
	private IBoardDAO dao;
	
	@Override
	public boolean addComment(CommentDTO cDTO) {
		boolean flag = false;
		try {
			flag = dao.insertComment(cDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<CommentDTO> getAllComment(int boardNo) {
		List<CommentDTO> cList= null;
		
		try {
			cList = dao.readAllCmt(boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}

	@Override
	public boolean updateCmt(CommentDTO cDTO) {
		
		
		boolean flag = false;
		
		try {
			flag = dao.updateCmt(cDTO); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean removeCmt(int commentNo) {
		boolean flag = false;
		try {
			flag = dao.removeCmt(commentNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public int countCmt(int boardNo) {
		int numOfCmt = 0;
		try {
			numOfCmt = dao.countCmt(boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numOfCmt;
	}

	
	
	
	
}
