package com.bitschool.gaeverything;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.EventService;
import com.bitschool.utils.ActUserManager;


@RequestMapping(value = "event")
@Controller
public class EventController {
	
	@Inject
	private EventService service;

	@Inject
	private ActUserService aService;
	
	@RequestMapping(value = "/viewEventList", method = RequestMethod.GET)
	public String viewEventList(){
		String url = "event/event_list";
		return url;
	}
	
	@RequestMapping(value="/getAllEvents", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<EventDTO> getAllEvents(HttpSession session){
		List<EventDTO> data = service.getAllLists();
		/*//좋아요
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member!=null){
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.SHOP);
			list= new ActUserManager(aService).checkLikeStatus(list, aDTO);
		}
		*/
		System.out.println("리스트개수:" + data.size());
		return data;
		
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail (){
		String url = "event/event_detail";
		return url;
	}
	
	
}
