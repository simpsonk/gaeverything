package com.bitschool.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
			dto.setFrom("care");
			dto.setAvgRating(list.get(i).getAverageRatings());
			dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getImageUrl());
			
			hList.add(dto);
			}
		return hList;
	}

	public List<HomeListDTO> makeList2(List<HomeListDTO> hList, List<EventDTO> list, String by) {
		HomeListDTO dto = null;
		List<HomeListDTO> newHomeList = null;
		for(int i=0; i<list.size(); i++){
			dto = new HomeListDTO();
			dto.setNo(list.get(i).getEventNo());
			dto.setTitle(list.get(i).getEventName());
			dto.setAddress(list.get(i).getAddress());
			dto.setCategory(list.get(i).getCategoryCode());
			dto.setFrom("event");
			dto.setAvgRating(list.get(i).getAverageRatings());
			dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getThumbnail());
			hList.add(dto);
		}
	//	System.out.println("makeList2 hList "+hList);
		
		if(by == "review"){
			Collections.sort(hList, new Comparator<HomeListDTO>() {
				@Override
				public int compare(HomeListDTO o1, HomeListDTO o2) {
					return o2.getTotalReview() - o1.getTotalReview();
				}
			});
			List<HomeListDTO> newHomeList1 = new ArrayList<HomeListDTO>();
			for(int i=0; i<20; i++){
				newHomeList1.add(hList.get(i));
			}
			return newHomeList1;
			
			
		}else if(by == "rate"){
			Collections.sort(hList, new Comparator<HomeListDTO>() {
				@Override
				public int compare(HomeListDTO o1, HomeListDTO o2) {
					double a = Double.parseDouble(o2.getAvgRating());
					double b = Double.parseDouble(o1.getAvgRating());
					return Double.compare(a, b);
				}
			});	
			List<HomeListDTO> newHomeList2 = new ArrayList<HomeListDTO>();
			for(int i=0; i<20; i++){
				newHomeList2.add(hList.get(i));
			}
			return newHomeList2;
			
		}else if(by == "bookmark"){
			Collections.sort(hList, new Comparator<HomeListDTO>() {
				@Override
				public int compare(HomeListDTO o1, HomeListDTO o2) {
					return o2.getCountLike() - o1.getCountLike();
				}
			});

			List<HomeListDTO> newHomeList3 = new ArrayList<HomeListDTO>();
			for(int i=0; i<20; i++){
				newHomeList3.add(hList.get(i));
			}
			return newHomeList3;
			
		}
		
	/*	List<HomeListDTO> newHomeList1 = new ArrayList<HomeListDTO>();
		List<HomeListDTO> newHomeList2 = new ArrayList<HomeListDTO>();
		List<HomeListDTO> newHomeList3 = new ArrayList<HomeListDTO>();
		
		for(int i=0; i<20; i++){
			newHomeList1.add(hList.get(i));
		}*/
		return newHomeList;
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
		
		Collections.sort(hList, new Comparator<HomeListDTO>() {
			@Override
			public int compare(HomeListDTO o1, HomeListDTO o2) {
				return o2.getCountLike() - o1.getCountLike();
			}
		});
		
		List<HomeListDTO> newHomeList = new ArrayList<HomeListDTO>();
		for(int i=0; i<20; i++){
			newHomeList.add(hList.get(i));
		}
		return newHomeList;
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
		
		for(int i=0; i<list.size(); i++){
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
