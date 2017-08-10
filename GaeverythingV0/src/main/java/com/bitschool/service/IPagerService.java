package com.bitschool.service;


import java.util.List;

import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;


public interface IPagerService {
	
	public int totalPosts(PageDTO pDTO);
	public String pageList(PageDTO pDTO);
	public int totalSearch(SearchDTO sDTO);
	public String searchedPageList(PageDTO pDTO, SearchDTO sDTO);


}
