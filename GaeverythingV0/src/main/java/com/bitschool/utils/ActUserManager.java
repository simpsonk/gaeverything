package com.bitschool.utils;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;

public class ActUserManager {
	public BoardDTO checkLikeStatus(HttpSession session, ActUserService aService, BoardDTO dto){
		String userLikeStatus = "like-icon";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(), dto.getBoardNo(), "00");
		boolean flag = aService.getLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		return dto;
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

	public List<BoardDTO> checkLikeStatus(HttpSession session, ActUserService aService, List<BoardDTO> list) {
		// TODO Auto-generated method stub
		String userLikeStatus = "like-icon";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		for(int i=0;i<list.size();i++){
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), list.get(i).getBoardNo(), "00");
			boolean flag = aService.getLikeStatus(aDTO);
			if(flag){
				userLikeStatus = "like-icon liked";
			}
			list.get(i).setUserLikeStatus(userLikeStatus);
		}
		return list;
	}
}
