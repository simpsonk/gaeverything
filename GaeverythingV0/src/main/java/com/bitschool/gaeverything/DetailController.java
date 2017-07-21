package com.bitschool.gaeverything;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@RequestMapping(value = "map/detail")
@Controller
public class DetailController {

	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request){
		String url = "map/map_detailpage";
		return url;
	}
	
	
}
