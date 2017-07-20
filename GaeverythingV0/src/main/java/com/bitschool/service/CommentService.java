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
		System.out.println("댓글추가 service");
		boolean flag = false;
		try {
			flag = dao.insertComment(cDTO);
			System.out.println("댓글추가결과: " + flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<CommentDTO> getAllComment(int boardNo) {
		List<CommentDTO> cList= null;
		
		System.out.println("모든 댓글읽기 service");
		System.out.println("모두읽기 그룹넘버:" + boardNo);
		try {
			cList = dao.readAllCmt(boardNo);
			System.out.println("리스트받음ㅇㅇ");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}

	@Override
	public boolean updateCmt(CommentDTO cDTO) {
		System.out.println("업뎃서비스");
		
		
		boolean flag = false;
		
		try {
			flag = dao.updateCmt(cDTO); 
			System.out.println("댓글수정성공");
			//인덱스번호 가져와서 해당 댓글 찾음 
			//그 댓글 업뎃함. 
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
