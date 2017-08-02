package com.bitschool.gaeverything;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventSearchDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.EventService;
import com.bitschool.service.PageService;
import com.bitschool.utils.ActUserManager;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@RequestMapping(value = "event")
@Controller
public class EventController {
	
	@Inject
	private EventService service;

	@Inject
	private PageService pService;
	
	@Inject
	private ActUserService aService;
	
	@RequestMapping(value = "/viewEventList", method = RequestMethod.GET)
	public String viewEventList(){
		String url = "event/event_list";
		return url;
	}
	
	@RequestMapping(value="/getAllEvents", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody HashMap<String, Object> getAllEvents(HttpSession session){
		List<EventDTO> list = service.getAllLists();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member!=null){
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.EVENT);
			list= new ActUserManager(aService).checkLikeStatusEvent(aDTO, list);
		}
		//이벤트 데이터를 페이징한 
		HashMap<String, Object> map = pService.makeEventSerachList(0, 6, list);
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("events", list); //
		data.put("pList", map.get("pList"));
		data.put("infoList", map.get("infoList"));
		return data;	
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail (){
		String url = "event/event_detail";
		return url;
	}
	
	@RequestMapping(value="/getPagingData", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody HashMap<String, Object> getPagingData(HttpSession session,
															   @RequestParam("data") String eventData,
															   @RequestParam("page") int page){
		HashMap<String, Object> data = new HashMap<String, Object>();
		List<EventDTO> list = null; //페이지당 리스트담을 것. -> 페이지 서비스에서 받아옴 
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = null; //페이지리스트(스트링), 페이지당 데이터리스트 담을 것 
		try {
			list = mapper.readValue(eventData, new TypeReference<List<EventDTO>>(){});
			map = pService.makeEventSerachList(page, 6, list);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//클릭했을때 받아온 eventData는 json(스트링)형태임 -> 스트링 밸류를 읽어서 타입을 이벤트dto로 한 후 리스트에 저장.
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member!=null){
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.EVENT);
			list= new ActUserManager(aService).checkLikeStatusEvent(aDTO, list);
		}

		data.put("events", list); //
		data.put("pList", map.get("pList"));
		data.put("infoList", map.get("infoList"));
		return data;	
	}

	
	@RequestMapping(value="/searchEvent", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchEvent(@RequestParam("opt") String opt, 
															 @RequestParam("str") String str){
		HashMap<String, Object> data = null; //페이징 리스트, 페이지당 리스트 담을 데이터 
		List<EventDTO> list = null; //검색결과 담을 리스트
		
		list = service.searchEvent(new EventSearchDTO(opt, str));
		data.put("searchList", list);
		return data;
	}
}
