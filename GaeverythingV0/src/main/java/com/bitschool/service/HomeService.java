package com.bitschool.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bitschool.dto.EventDTO;
import com.bitschool.dto.HomeListDTO;
import com.bitschool.dto.LocationDTO;

@Service
public class HomeService {

	public List<HomeListDTO> makeList1(List<LocationDTO> list) {
		List<HomeListDTO> hList = new ArrayList<HomeListDTO>();
		HomeListDTO dto = null;
		System.out.println("강남25시 5.00점" + list.get(1).getAverageRatings());
		for(int i=0; i<list.size(); i++){
			dto = new HomeListDTO();
			dto.setNo(list.get(i).getLocationSeq());
			dto.setTitle(list.get(i).getTitle());
			dto.setAddress(list.get(i).getAddress());
			dto.setCategory(list.get(i).getCategoryCode());
			dto.setAvgRating(list.get(i).getAverageRatings());
			dto.setTotalReview(list.get(i).getTotalReview());
			dto.setCountLike(list.get(i).getCountLike());
			dto.setImage(list.get(i).getImageUrl());
			
			hList.add(dto);
			}
		return hList;
	}

	public List<HomeListDTO> makeList2(List<HomeListDTO> hList, List<EventDTO> list) {
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
			hList.add(dto);
			
		}
		return hList;
	}

}
