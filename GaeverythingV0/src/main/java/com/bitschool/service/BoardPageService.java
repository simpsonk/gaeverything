package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

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
	public int totalPosts() {
		int total = 0;
		try {
			total = dao.getTotalNumber();
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
		//amount = 20: �븳 �럹�씠吏��떦 20媛� 寃뚯떆臾� 異쒕젰
		
		//珥� 異쒕젰 �럹�씠吏� 媛쒖닔
		int numOfPage = (int)Math.ceil(this.totalPosts()/(double)pDTO.getAmount());
		int pageUnit = (pDTO.getPage()/10)*10;
		int startPage = pageUnit+1;
		int lastPage = pageUnit+10;
		lastPage = (lastPage<=numOfPage)?lastPage:numOfPage;
	
		StringBuffer sb = new StringBuffer();
		sb.append("<nav class='pagination'><ul>");
		
		if((pDTO.getPage()/10)>=1){
			sb.append("<li><a href='/review/viewReviewList?page="+(pageUnit-9)+"'>«</a></li>");
		}
		for(int i=startPage; i<=lastPage; i++){
			sb.append("<li><a href='/review/viewReviewList?page="+i+"'>"+i+"</a></li>");
		}
		if(lastPage<numOfPage){
			sb.append("<li><a href='/review/viewReviewList?page="+(pageUnit+11)+"'>»</a></li>");
		}
		sb.append("</ul></nav>");
		return sb.toString();
	}
	

	@Override
	public String searchedPageList(PageDTO pDTO, SearchDTO sDTO) {
		
		
		int numOfPage = (int)Math.ceil(this.totalSearch(sDTO)/(double)pDTO.getAmount());
		System.out.println("寃��깋寃곌낵: " + this.totalSearch(sDTO)+"媛�");
		System.out.println("�럹�씠吏��닔:" + numOfPage+ "媛�");
		int pageUnit = (pDTO.getPage()/10)*10;
		int startPage = pageUnit+1;
		int lastPage = pageUnit+10;
		lastPage = (lastPage<=numOfPage)?lastPage:numOfPage;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div class='w3-center'>");
		sb.append("<div class='w3-bar'>");
		
		if((pDTO.getPage()/10)>=1){
			sb.append(" <a href='/review/search?page="+(pageUnit-9)+"&by="+sDTO.getSearch()+"&search="+sDTO.getEncodeUTF()+"' class='w3-button'>짬</a>");
		}
		for(int i=startPage; i<=lastPage; i++){
			sb.append("<a href='/review/search?page="+i+"&by="+sDTO.getBy()+"&search="+sDTO.getEncodeUTF()+"' class='w3-button w3-green'>"+i+"</a>  ");
		}
		
		if(lastPage<numOfPage){
			sb.append("<a href='/board/search?page="+(pageUnit+11)+"&by="+sDTO.getBy()+"&seach="+sDTO.getEncodeUTF()+"' class='w3-button'>쨩</a></div></div>");			
		}
		
		return sb.toString();
	}


	
	
	

}
