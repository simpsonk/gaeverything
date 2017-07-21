package com.bitschool.gaeverything;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@RequestMapping(value = "map/detail")
@Controller
public class DetailController {

	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request, @RequestParam(value="locationSeq") int locationSeq){
		String url = "map/map_detailpage";
		
		return url;
	}
	
	
}
