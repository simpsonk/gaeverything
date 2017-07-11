package com.bitschool.gaeverything;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value = "event")
@Controller
public class EventController {
	@RequestMapping(value = "/viewEventList", method = RequestMethod.GET)
	public String viewEventList(){
		String url = "event/event_list";
		return url;
	}
}
