package com.bitschool.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class SearchDTO {
	
	private String search;
	private String by;
	private PageDTO pDTO;
	private String encodeUTF;
	
	
	public SearchDTO(){	
	}
	
	public SearchDTO(String search, String by, PageDTO pDTO){
		this.search = search;
		this.by = by;
		this.pDTO = pDTO;
	}
	
	public String getEncodeUTF() {
	      try {
	         this.encodeUTF = URLEncoder.encode(search, "UTF-8");
	      } catch (UnsupportedEncodingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return encodeUTF;
	   }
	
	
	public void setEncodeUTF(String encodeUTF) {
		this.encodeUTF = encodeUTF;
	}

	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getBy() {
		return by;
	}
	public void setBy(String by) {
		this.by = by;
	}

	public PageDTO getpDTO() {
		return pDTO;
	}

	public void setpDTO(PageDTO pDTO) {
		this.pDTO = pDTO;
	}
	
	
	
	

}
