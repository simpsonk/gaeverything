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
	public static final String LOCATION = "10";

	public ActUserManager(ActUserService service){
		 this.service = service;
	}
	
	public BoardDTO checkReLikeStatus(ActUserDTO aDTO, BoardDTO dto){
		String userLikeStatus = "like-icon";
		boolean flag = service.isCheckedLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		dto.setCountLike(service.getLikeCount(aDTO));
		return dto;
	}

	public LocationDTO checkLocLikeStatus(ActUserDTO aDTO, LocationDTO dto) {
		// TODO Auto-generated method stub
		String userLikeStatus = "like-icon";
		boolean flag = service.isCheckedLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		dto.setCountLike(service.getLikeCount(aDTO));
		return dto;
	}
	
	
	public List<LocationDTO> checkListLocLikeStatus(ActUserDTO aDTO, List<LocationDTO> list) {
		// TODO Auto-generated method stub
		System.out.println(list.size());
		for(int i=0;i<list.size();i++){
			String userLikeStatus = "like-icon";
			aDTO.setContentNo(list.get(i).getLocationSeq());
			boolean flag = service.isCheckedLikeStatus(aDTO);
			if(flag){
				userLikeStatus = "like-icon liked";
			}
			list.get(i).setUserLikeStatus(userLikeStatus);
			list.get(i).setCountLike(service.getLikeCount(aDTO));
		}
		return list;
	}
	
	public List<BoardDTO> checkListReLikeStatus(ActUserDTO aDTO, List<BoardDTO> list) {
		// TODO Auto-generated method stub
		for(int i=0;i<list.size();i++){
			String userLikeStatus = "like-icon";
			aDTO.setContentNo(list.get(i).getBoardNo());
			boolean flag = service.isCheckedLikeStatus(aDTO);
			if(flag){
				userLikeStatus = "like-icon liked";
			}
			list.get(i).setUserLikeStatus(userLikeStatus);
			list.get(i).setCountLike(service.getLikeCount(aDTO));
		}
		return list;
	}
	
	public boolean registLikeStatus(ActUserDTO dto){
		boolean flag = false;
		flag = service.setLikeStatus(dto);
		return flag;
	}

	public boolean deleteLikeStatus(ActUserDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = service.deleteLikeStatus(dto);
		return flag;
	}

	public int getLikeStatusCount(ActUserDTO dto) {
		// TODO Auto-generated method stub
		int count = 0;
		count = service.getLikeCount(dto);
		return count;
	}

}
