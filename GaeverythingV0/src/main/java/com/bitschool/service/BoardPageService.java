package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.stereotype.Service;
import org.springframework.util.SystemPropertyUtils;

import com.bitschool.dao.BoardDAO;
import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;

@Service
public class BoardPageService implements IPagerService{

	@Inject
	private BoardDAO dao;
	
	@Override
	public int totalPosts(PageDTO pDTO) {
		int total = 0;
		try {
			total = dao.getTotalNumber(pDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("total:" + total);
		return total;
	}
	
	@Override
	public int totalSearch(SearchDTO sDTO) {
		int totalSearch = 0;
		try {
			totalSearch = dao.getSearchTotal(sDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalSearch;
	}
	

	@Override
	public String pageList(PageDTO pDTO) {
		//List<String> pList = null;
		System.out.println("check: "+this.totalPosts(pDTO)+"categoryCode: "+pDTO.getCategoryCode());
		int numOfPage = (int)Math.ceil(this.totalPosts(pDTO)/(double)pDTO.getAmount());
		int pageUnit = (pDTO.getPage()/10)*10;
		int startPage = pageUnit+1;
		int lastPage = pageUnit+10;
		lastPage = (lastPage<=numOfPage)?lastPage:numOfPage;
		String categoryCode = pDTO.getCategoryCode();
		if(categoryCode == null){
			categoryCode = "0";
		}
		
		
		StringBuffer sb = new StringBuffer();
		sb.append("<nav class='pagination'><ul>");
		
		if((pDTO.getPage()/10)>=1){
			sb.append("<li><a href='/review/viewReviewList?categoryCode="+categoryCode+"&page="+(pageUnit-9)+"'><i class='sl sl-icon-arrow-left'></i></a></li>");
		}
		for(int i=startPage; i<=lastPage; i++){
			sb.append("<li><a href='/review/viewReviewList?categoryCode="+categoryCode+"&page="+i+"'>"+i+"</a></li>");
		}
		if(lastPage<numOfPage){
			sb.append("<li><a href='/review/viewReviewList?categoryCode="+categoryCode+"&page="+(pageUnit+11)+"'><i class='sl sl-icon-arrow-right'></i></a></li>");
		}
		sb.append("</ul></nav>");
		return sb.toString();
	}
	

	@Override
	public String searchedPageList(PageDTO pDTO, SearchDTO sDTO) {
		
		
		int numOfPage = (int)Math.ceil(this.totalSearch(sDTO)/(double)pDTO.getAmount());
		int pageUnit = (pDTO.getPage()/10)*10;
		int startPage = pageUnit+1;
		int lastPage = pageUnit+10;
		lastPage = (lastPage<=numOfPage)?lastPage:numOfPage;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div class='w3-center'>");
		sb.append("<div class='w3-bar'>");
		
		if((pDTO.getPage()/10)>=1){
			sb.append(" <a href='/review/search?page="+(pageUnit-9)+"&by="+sDTO.getSearch()+"&search="+sDTO.getEncodeUTF()+"' class='w3-button'><i class='sl sl-icon-arrow-right'></i></a>");
		}
		for(int i=startPage; i<=lastPage; i++){
			sb.append("<a href='/review/search?page="+i+"&by="+sDTO.getBy()+"&search="+sDTO.getEncodeUTF()+"' class='w3-button w3-green'>"+i+"</a>  ");
		}
		
		if(lastPage<numOfPage){
			sb.append("<a href='/board/search?page="+(pageUnit+11)+"&by="+sDTO.getBy()+"&seach="+sDTO.getEncodeUTF()+"' class='w3-button'><i class='sl sl-icon-arrow-right'></i></a></div></div>");			
		}
		
		return sb.toString();
	}


	
	
	

}
