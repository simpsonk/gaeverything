package com.bitschool.utils;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;

public class ActUserManager {
	
	private ActUserService service;
	
	public ActUserManager(ActUserService service){
		 this.service = service;
	}
	
	public BoardDTO checkLikeStatus(HttpSession session, BoardDTO dto){
		String userLikeStatus = "like-icon";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(), "00", dto.getBoardNo(), 0);
		System.out.println(aDTO);
		boolean flag = service.getLikeStatus(aDTO);
		if(flag){
			userLikeStatus = "like-icon liked";
		}
		dto.setUserLikeStatus(userLikeStatus);
		return dto;
	}
	
	public List<BoardDTO> checkLikeStatus(HttpSession session, List<BoardDTO> list) {
		// TODO Auto-generated method stub
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		for(int i=0;i<list.size();i++){
			String userLikeStatus = "like-icon";
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), "00", list.get(i).getBoardNo(), 0);
			boolean flag = service.getLikeStatus(aDTO);
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

	public boolean dropLikeStatus(ActUserDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = service.deleteLikeStatus(dto);
		return flag;
	}

	


	public boolean registDetailPageLikeStatus(HttpSession session, int locationSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(), "10", 0, locationSeq);
		flag = service.getDetailPageLikeStatus(aDTO);
		return flag;
	}

	public boolean dropDetailPageLikeStatus(HttpSession session, int locationSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(), "10", 0, locationSeq);
		flag = service.deleteDetailPageLikeStatus(aDTO);
		return flag;
		
	}

	public int LikeStatusCount(String type) {
		// TODO Auto-generated method stub
		int count = 0;
		count = service.getLikeCount(type);
		return count;
	}
}
