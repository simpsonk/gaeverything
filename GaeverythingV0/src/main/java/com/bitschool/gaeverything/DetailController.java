package com.bitschool.gaeverything;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.LocationDTO;
import com.bitschool.service.LocationService;
@RequestMapping(value = "map/detail")
@Controller
public class DetailController {
	
	@Inject
	LocationService service;

	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request, @RequestParam(value="locationSeq") int locationSeq,
			Model model){
		String url = "map/map_detailpage";
		LocationDTO dto = new LocationDTO();
		dto = service.selectOne(locationSeq);
		model.addAttribute("detail", dto);		
		return url;
	}
	
	
}
