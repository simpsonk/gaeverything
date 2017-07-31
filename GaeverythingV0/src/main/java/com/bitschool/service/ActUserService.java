package com.bitschool.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.ActUserDAO;
import com.bitschool.dto.ActUserDTO;

@Service
public class ActUserService {
	
	@Inject
	private ActUserDAO dao;
	
	public boolean isCheckedLikeStatus(ActUserDTO dto) {
		boolean flag = false;
		try {
			flag = dao.searchStatus(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean setLikeStatus(ActUserDTO dto) {
		boolean flag = false;
		try {
			flag = dao.insertLikeStatus(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) {
		boolean flag = false;
		try {
			flag = dao.deleteLikeStatus(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean getDetailPageLikeStatus(ActUserDTO aDTO) {
		boolean flag = false;
		try {
			flag = dao.insertDetailPageLikeStatus(aDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteDetailPageLikeStatus(ActUserDTO aDTO) {
		boolean flag = false;
		try {
			flag = dao.deleteDetailPageLikeStatus(aDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int getLikeCount(ActUserDTO dto) {
		int count = 0;
		try {
			count = dao.getLikeCount(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	
}
