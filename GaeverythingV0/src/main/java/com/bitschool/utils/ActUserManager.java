package com.bitschool.utils;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.service.IBoardService;

public class ActUserManager {
	public String checkLikeStatus(ActUserDTO dto, IBoardService service){
		String status = "like-icon";
		boolean flag = service.getLikeStatus(dto);
		if(flag){
			status = "like-icon liked";
		}
		return status;
	}
}
