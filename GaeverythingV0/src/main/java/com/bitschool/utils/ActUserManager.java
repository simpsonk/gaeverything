package com.bitschool.utils;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.service.ActUserService;

public class ActUserManager {
	public String checkLikeStatus(ActUserDTO dto, ActUserService service){
		String userLikeStatus = "like-icon";
		boolean flag = service.getLikeStatus(dto);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		return userLikeStatus;
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
