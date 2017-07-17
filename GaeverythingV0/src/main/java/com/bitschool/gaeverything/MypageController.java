package com.bitschool.gaeverything;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitschool.dto.MemberDTO;


@RequestMapping(value = "mypage")
@Controller
public class MypageController {
	@RequestMapping(value = "/viewMypageList", method = RequestMethod.GET)
	public String viewMypageList(HttpSession session, Model model){
		String url = "mypage/mypage_list";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value = "/viewMypageDashboard", method = RequestMethod.GET)
	public String viewDashBoard(HttpSession session, Model model){
		String url = "mypage/mypage_dashboard";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value = "/viewMypageReviews", method = RequestMethod.GET)
	public String viewMypageReviews(HttpSession session, Model model){
		String url = "mypage/mypage_reviews";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value = "/viewMypageBookmarks", method = RequestMethod.GET)
	public String viewMypageBookmarks(HttpSession session, Model model){
		String url = "mypage/mypage_bookmarks";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value = "/viewMypageProfile", method = RequestMethod.GET)
	public String viewMypageProfile(HttpSession session, Model model){
		String url = "mypage/mypage_profile";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value = "/viewMypagePetProfile", method = RequestMethod.GET)
	public String viewMypagePetProfile(HttpSession session, Model model){
		String url = "mypage/mypage_pet_profile";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		return url;
	}
}
