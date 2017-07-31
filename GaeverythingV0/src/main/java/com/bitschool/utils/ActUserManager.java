package com.bitschool.utils;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;

public class ActUserManager {
	
	private ActUserService service;
	
	public static final String REVIEW = "00";
	public static final String SHOP = "10";
	
	public ActUserManager(ActUserService service){
		 this.service = service;
	}
	
	public BoardDTO checkLikeStatus(ActUserDTO aDTO, BoardDTO dto){
		String userLikeStatus = "like-icon";
		boolean flag = service.isCheckedLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		return dto;
	}
	

	public LocationDTO checkLikeStatus(ActUserDTO aDTO, LocationDTO dto) {
		String userLikeStatus = "like-icon";
		boolean flag = service.isCheckedLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		return dto;
	}
	
	public List<BoardDTO> checkLikeStatus(ActUserDTO aDTO, List<BoardDTO> list) {
		for(int i=0;i<list.size();i++){
			String userLikeStatus = "like-icon";
			aDTO.setContentNo(list.get(i).getBoardNo());
			boolean flag = service.isCheckedLikeStatus(aDTO);
			if(flag){
				userLikeStatus = "like-icon liked";
			}
			list.get(i).setUserLikeStatus(userLikeStatus);
		}
		return list;
	}
	
	public List<LocationDTO> checkLikeStatus(List<LocationDTO> list, ActUserDTO aDTO) {
		System.out.println(list.size());
		for(int i=0;i<list.size();i++){
			String userLikeStatus = "like-icon";
			aDTO.setContentNo(list.get(i).getLocationSeq());
			boolean flag = service.isCheckedLikeStatus(aDTO);
			if(flag){
				userLikeStatus = "like-icon liked";
			}
			list.get(i).setUserLikeStatus(userLikeStatus);
		}
		return list;
	}
	
	public boolean registLikeStatus(ActUserDTO dto){
		boolean flag = false;
		flag = service.setLikeStatus(dto);
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) {
		boolean flag = false;
		flag = service.deleteLikeStatus(dto);
		return flag;
	}

	public int getLikeStatusCount(ActUserDTO dto) {
		int count = 0;
		count = service.getLikeCount(dto);
		return count;
	}

}
