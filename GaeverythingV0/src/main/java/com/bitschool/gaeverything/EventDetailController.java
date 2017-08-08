package com.bitschool.gaeverything;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.EventCommentDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventPhotoDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.EventDetailService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;

@RequestMapping(value="/event/detail")
@Controller
public class EventDetailController {
	
	@Inject
	private EventDetailService service;
	
	@Inject
	private ActUserService aService;
	
	
	@RequestMapping(value = "addComment", method=RequestMethod.POST)
	public String addComment(HttpSession session,Model model,EventCommentDTO dto){
		
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		
		boolean flag = service.commentAdd(dto);
		if(flag){
			url = "redirect:view?no="+dto.getEventNo();
		}
		return url;
	}
	
	@RequestMapping(value="/view", method= {RequestMethod.POST,RequestMethod.GET})
	public String eventDetail(HttpServletRequest request, @RequestParam(value="no") int eventNo, 
							  HttpSession session, Model model){
		String url = "event/event_detail";
		boolean isLogin = new LoginFilter().isLogin(session, model);
		ActUserManager manager = new ActUserManager(aService);
		
		EventDTO dto = service.selectOne(eventNo);		
		List<EventCommentDTO> list = service.commentList(eventNo);
		//dto = service.getEventActUserResult(manager, dto);
		
		List<EventPhotoDTO> photoList = service.selectPhoto(eventNo);
		//List<BlogDTO> blogList = service.getBlogReviews(eventNo);
		//좋아요 상태 유지
		if(isLogin){
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.EVENT, eventNo);
			dto= manager.checkLikeStatus(aDTO, dto);
		}
		model.addAttribute("commentlist",list);
		model.addAttribute("dto", dto);
		//model.addAttribute("reviewList",reviewList);
		model.addAttribute("detailphoto",photoList);
		//model.addAttribute("blogList",blogList);
		
		return url;
	}


}
