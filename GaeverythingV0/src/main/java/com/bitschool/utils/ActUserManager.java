package com.bitschool.utils;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.service.ActUserService;

public class ActUserManager {
	public BoardDTO checkLikeStatus(ActUserDTO dto, ActUserService service, BoardDTO dto2){
		String userLikeStatus = "like-icon";
		boolean flag = service.getLikeStatus(dto);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto2.setUserLikeStatus(userLikeStatus);
		return dto2;
	}
	
	public boolean registLikeStatus(ActUserDTO dto, ActUserService service){
		boolean flag = false;
		flag = service.setLikeStatus(dto);
		return flag;
	}

	public boolean dropLikeStatus(ActUserDTO dto, ActUserService service) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = service.deleteLikeStatus(dto);
		return flag;
	}
}
