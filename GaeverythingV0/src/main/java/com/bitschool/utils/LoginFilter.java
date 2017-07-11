package com.bitschool.utils;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bitschool.dto.MemberDTO;

public class LoginFilter {
	public boolean isLogin(HttpSession session, Model model){
		boolean check = false;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		check = member!=null?true:false;
		System.out.println(check);
		if(check){
			model.addAttribute("member", member);
		}
		return check; 
	}
}	
