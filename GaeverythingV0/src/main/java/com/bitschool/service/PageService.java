package com.bitschool.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;

@Service
public class PageService {
	public HashMap<String, Object> makeSerachList(int page, int amount, List<LocationDTO> list){
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(amount+"--->"+list.size()+"page-->"+page);
		//page:0, amount 5;
		int pageCount = (int)Math.ceil(list.size()/(double)amount);
		int pageUnit = page/amount;
		
		int startPage = pageUnit*amount;
		int endPage = startPage+amount;
		
		endPage = endPage<=pageCount?endPage:pageCount;
		
		StringBuffer plist = new StringBuffer();
		List<LocationDTO> infoList = new ArrayList<LocationDTO>();
		
		int infoEndPage = page*amount+amount;
		infoEndPage = infoEndPage<=list.size()?infoEndPage:list.size();
		
		for(int i= (page*amount);i<infoEndPage;i++){
			infoList.add(list.get(i));
		}
		
		if(pageUnit!=0){
			plist.append("<li><a onclick='pageClickEvent("+(startPage-1)+")'><i class='sl sl-icon-arrow-left'></i></a></li>");
		}
		for(int i=startPage;i<endPage;i++){
			plist.append("<li><a onclick='pageClickEvent("+i+")'>"+(i+1)+"</a></li>");
		}
		//next
		if(endPage<pageCount){
			plist.append("<li><a onclick='pageClickEvent("+endPage+")'><i class='sl sl-icon-arrow-right'></i></a></li>");
		}
		
		map.put("pList", plist.toString());
		map.put("infoList", infoList);
		System.out.println("infoList size: "+infoList.size());
		
		return map;
	}

	
	public HashMap<String, Object> makeEventSerachList(int page, int amount, List<EventDTO> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	//	System.out.println(amount+"--->"+list.size());
		
		int pageCount = (int)Math.ceil(list.size()/(double)amount);
		int pageUnit = page/amount;
		
		int startPage = pageUnit*amount;
		int endPage = startPage+amount;
		
		endPage = endPage<=pageCount?endPage:pageCount;
		
		StringBuffer plist = new StringBuffer();
		List<EventDTO> infoList = new ArrayList<EventDTO>();
		
		int infoEndPage = page*amount+amount;
		infoEndPage = infoEndPage<=list.size()?infoEndPage:list.size();
		
		for(int i= (page*amount);i<infoEndPage;i++){
			infoList.add(list.get(i));
		}
		
		if(pageUnit!=0){
			plist.append("<li><a onclick='pageClickEvent("+(startPage-1)+")'><i class='sl sl-icon-arrow-left'></i></a></li>");
		}
		for(int i=startPage;i<endPage;i++){
			plist.append("<li><a onclick='pageClickEvent("+i+")'>"+(i+1)+"</a></li>");
		}
		//next
		if(endPage<pageCount){
			plist.append("<li><a onclick='pageClickEvent("+endPage+")'><i class='sl sl-icon-arrow-right'></i></a></li>");
		}
		
		map.put("pList", plist.toString());
		map.put("infoList", infoList);
		System.out.println("infoList size: "+infoList.size());
		
		return map;
	}

	
}




