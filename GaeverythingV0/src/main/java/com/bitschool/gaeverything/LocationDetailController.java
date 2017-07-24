package com.bitschool.gaeverything;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.LocationDetailService;

@RequestMapping(value = "map/detail")
@Controller
public class LocationDetailController {
	
	@Inject
	LocationDetailService service;

	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request, @RequestParam(value="locationSeq") int locationSeq,
			Model model){
		String url = "map/map_detailpage";
		LocationDTO dto = new LocationDTO();
		dto = service.selectOne(locationSeq);
		model.addAttribute("detail", dto);		
		System.out.println("detail : "+dto);
		return url;
	}
	
	//´ñ±Û µî·Ï
	@RequestMapping(value="/addComment",method=RequestMethod.POST)
	public String addComment(HttpSession session,Model model,
			DetailCommentDTO dto){
		String url = null;
		System.out.println("addComment·Î µé¾î¿È");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		System.out.println("dto : "+dto);
		boolean flag = service.commentAdd(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+dto.getLocationSeq();
			System.out.println("addComment ¼º°ø");
			System.out.println("´ñ±Ûdto : "+dto);
		}
		return url;
	}
	
	
}
