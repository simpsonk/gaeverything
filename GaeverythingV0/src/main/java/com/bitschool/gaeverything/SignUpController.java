package com.bitschool.gaeverything;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.MemberDTO;
import com.bitschool.service.SignUpService;

@RequestMapping("signUp")
@Controller
public class SignUpController {
	
	@Inject
	private SignUpService service;
		
	@RequestMapping(value="registMember", method = {RequestMethod.POST, RequestMethod.GET})
	public String registUser(MemberDTO member, HttpSession session){
		String url = null;
		boolean flag = service.registUserData(member);
		System.out.println(flag);
		if(flag){
			url = "redirect:/";
			session.setAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value="listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public String listAll(Model model){
		String url = null;
		List<MemberDTO> list = service.getMemberList();
		if(list!=null){
			model.addAttribute("list", list);
			url = "member/member_list";
		}
		return url;
	}
	
	
	@RequestMapping(value = "viewMemberInfo", method = RequestMethod.GET)
	public String viewMemberInfo(Model model, @RequestParam("email") String email){
		String url = null;
		MemberDTO member = service.getMemberInfo(email);
		if(member!=null){
			url= "member/modify_member";
			model.addAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value = "memberInfoModify", method = RequestMethod.POST)
	public String memberInfoModify(MemberDTO member){
		String url = null;
		boolean flag = service.modifyInfo(member);
		if(flag){
			url = "redirect:listAll";
		}
		return url;
	}
	
	@RequestMapping(value = "memberInfoDelete", method = RequestMethod.POST)
	public String memberInfoDelete(MemberDTO member){
		String url = null;
		boolean flag = service.deleteInfo(member.getEmail());
		if(flag){
			url = "redirect:listAll";
		}
		return url;
	}
	
}
