package com.bitschool.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.HomeListDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.utils.ActUserManager;

@Service
public class HomeService {

	public List<HomeListDTO> makeList1(List<LocationDTO> list) {
		List<HomeListDTO> hList = new ArrayList<HomeListDTO>();
		HomeListDTO dto = null;
		for(int i=0; i<list.size(); i++){
			dto = new HomeListDTO();
			dto.setNo(list.get(i).getLocationSeq());
			dto.setTitle(list.get(i).getTitle());
			dto.setAddress(list.get(i).getAddress());
			dto.setCategory(list.get(i).getCategoryCode());
			if(list.get(i).getCategoryCode() == "HP8"){
				dto.setFrom("care");
			}else{
				dto.setFrom("event");
			}
			dto.setAvgRating(list.get(i).getAverageRatings());
			dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getImageUrl());
			
			hList.add(dto);
			}
		return hList;
	}

	public List<HomeListDTO> makeList2(List<HomeListDTO> hList, List<EventDTO> list) {
		System.out.println("이벤트개수: " + list.size());
		HomeListDTO dto = null;
		for(int i=0; i<list.size(); i++){
			dto = new HomeListDTO();
			dto.setNo(list.get(i).getEventNo());
			dto.setTitle(list.get(i).getEventName());
			dto.setAddress(list.get(i).getAddress());
			dto.setCategory(list.get(i).getCategoryCode());
			dto.setAvgRating(list.get(i).getAverageRatings());
			dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getThumbnail());
			dto.setFrom("event");
			hList.add(dto);
			
		}
		System.out.println("총 개수" + hList.size());
		return hList;
	}
	
	public List<HomeListDTO> makeList3(List<HomeListDTO> hList, List<BoardDTO> list) {
		HomeListDTO dto = null;
		for(int i=0; i<list.size(); i++){
			dto = new HomeListDTO();
			dto.setNo(list.get(i).getBoardNo());
			dto.setTitle(list.get(i).getTitle());
			dto.setAddress(list.get(i).getAddress());
			dto.setCategory("review");
			String rate = Double.toString(list.get(i).getRating());
			dto.setAvgRating(rate);
			//dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getUploadImg());
			hList.add(dto);
		}
		return hList;
	}
	
	public HomeListDTO getEventActUserResult(ActUserManager manager, List<LocationDTO> list1,List<EventDTO> list2, List<BoardDTO> list3, LocationDTO Ldto, EventDTO eDTO, HomeListDTO dto ) {
		//홈에서 좋아요 눌린 것들 각 테이블에 좋아요 카운팅 올림 
		//int countLike = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, dto.getEventNo()));		
		//dto.setActUserResult(countReview, temp, countRatings, countReplies, countLike);
		//int totalReview = countReplies + countReview;
		//dto.setTotalReview(totalReview);
		return dto;
	}

	public List<HomeListDTO> checkLikeStatus(ActUserManager manager, String email, List<HomeListDTO> list) {
		
		for(int i=0; i<4; i++){
			if(list.get(i).getFrom() == "care"){
				ActUserDTO aDTO = new ActUserDTO(email, ActUserManager.SHOP);
				list = manager.checkHomeLikeStatus(aDTO, list);
			}else if(list.get(i).getFrom() == "event"){
				ActUserDTO aDTO = new ActUserDTO(email, ActUserManager.EVENT);
				list = manager.checkHomeLikeStatus(aDTO, list);
			}
		}
		return list;
	}
	
}
