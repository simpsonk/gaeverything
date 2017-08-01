package com.bitschool.gaeverything;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.EventDTO;
import com.bitschool.service.EventService;


@RequestMapping(value = "event")
@Controller
public class EventController {
	
	@Inject
	private EventService service;

	
	@RequestMapping(value = "/viewEventList", method = RequestMethod.GET)
	public String viewEventList(){
		String url = "event/event_list";
		return url;
	}
	
	@RequestMapping(value="/getAllEvents", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<EventDTO> getAllEvents(){
		List<EventDTO> data = service.getAllLists();
		System.out.println("리스트개수:" + data.size());
		return data;
		
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail (){
		String url = "event/event_detail";
		return url;
	}
}
