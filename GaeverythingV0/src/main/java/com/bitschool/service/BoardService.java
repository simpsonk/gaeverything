package com.bitschool.service;

import java.sql.SQLException;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dto.ActUserDTO;
import java.util.List;
import com.bitschool.dao.IBoardDAO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;

@Service
public class BoardService implements IBoardService {

	@Inject
	private IBoardDAO dao;

	@Override
	public boolean insertPost(BoardDTO dto) {
		System.out.println("insert service");
		boolean flag = false;
		try {
			flag = dao.addNewPost(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BoardDTO> getAllList() {
		List<BoardDTO> list = null;
		try {
			list = dao.readAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BoardDTO selectToRead(int boardNo) {
		BoardDTO dto = null;
		try {
			boolean flag = dao.updateReadCount(boardNo);
			if (flag) {
				dto = dao.readOnePost(boardNo);
			}
			System.out.println("boardno:" + boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public boolean updatePost(BoardDTO dto) {
		boolean flag = false;
		try {
			flag = dao.update(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("service:" + flag);
		return flag;
	}

	@Override
	public boolean remove(int boardNo) {
		boolean flag = false;
		try {
			flag = dao.removePost(boardNo);
			System.out.println("remove service:" + flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BoardDTO> getPagedList(PageDTO dto) {
		List<BoardDTO> list = null;
		try {
			list = dao.readPerPage(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardDTO> search(SearchDTO sDTO) {
		List<BoardDTO> list = null;
		try {
			list = dao.searchData(sDTO);
			System.out.println("list:" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getNumOfCmts(int boardNo) {
		int countCmt = 0;
		try {
			countCmt = dao.countAllCmt(boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countCmt;
	}

	@Override
	public int updateLike(int boardNo) {
		int numOfLike = 0;
		boolean flag = false;
		try {
			flag = dao.updateLike(boardNo);
			if (flag) {
				numOfLike = dao.getTotalLike(boardNo);// �넗�깉 �씪�씠�겕 �닔 媛��졇�삤湲�
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numOfLike;
	}

	@Override
	public int dislike(int boardNo) {
		int numOfLike = 0;
		boolean flag = false;
		try {
			flag = dao.updateDislike(boardNo);
			if (flag) {
				numOfLike = dao.getTotalLike(boardNo);// �넗�깉 �씪�씠�겕 �닔 媛��졇�삤湲�
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numOfLike;
	}
}
