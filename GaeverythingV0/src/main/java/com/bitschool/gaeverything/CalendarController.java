package com.bitschool.gaeverything;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.BookCalendarDTO;
import com.bitschool.dto.BookEventCalendarDTO;
import com.bitschool.dto.CalendarDTO;
import com.bitschool.dto.CalendarFormat;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.PetPageDTO;
import com.bitschool.service.CalendarService;
import com.bitschool.service.PetPageService;
import com.google.gson.Gson;

@RequestMapping("/mypage/calendar")
@Controller
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	private CalendarService service;
	
	@Inject
	private PetPageService Pservice;
	
	@RequestMapping(value="/viewCalendar", method={RequestMethod.GET,RequestMethod.POST})
	public String viewCalendar(HttpSession session, Model model){
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String url = "mypage/mypage_calendar";
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value="/viewRegistCalendar", method={RequestMethod.GET,RequestMethod.POST})
	public String viewRegistCalendar(HttpSession session, Model model, @RequestParam("startDate") String sd){
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String url = "mypage/calendar/regist_calendar";
		List<PetPageDTO> list = Pservice.readPetsData(member);
		model.addAttribute("list", list);
		model.addAttribute("member", member);
		model.addAttribute("sd",sd);
		return url;
	}
	
	@RequestMapping(value="/viewDetailCalendar", method={RequestMethod.GET,RequestMethod.POST})
	public String viewDetailCalendar(HttpSession session, Model model, @RequestParam("seq") int seq){
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String url = "mypage/calendar/detail_calendar";
		model.addAttribute("member", member);
		CalendarDTO dto = service.readCalendar(seq);
		model.addAttribute("dto",dto);
		return url;
	}
	
	@RequestMapping(value="/viewDetailCalendarLoc", method={RequestMethod.GET,RequestMethod.POST})
	public String viewDetailCalendarLoc(HttpSession session, Model model, @RequestParam("seq") int seq,
			@RequestParam(value="longitude",defaultValue="0") String longitude, @RequestParam(value="latitude",defaultValue="0") String latitude){
		System.out.println(longitude+"       "+latitude);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String url = "mypage/calendar/detail_calendar_location";
		model.addAttribute("member", member);
		CalendarDTO dto = service.readCalendar(seq);
		model.addAttribute("dto",dto);
		model.addAttribute("longitude",longitude);
		model.addAttribute("latitude",latitude);
		return url;
	}
	
	@RequestMapping(value="/listAll",method=RequestMethod.POST)
	public @ResponseBody String calendarList(HttpServletResponse response, HttpSession session){
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		List<CalendarFormat> list = service.jsonAll(member.getEmail());
		String data = new Gson().toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		return data;
	}
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registCalendar(CalendarDTO dto,
			 @RequestParam(value="dogid",defaultValue="1") int dogid,
			 HttpSession session, Model model){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		dto.setId(member.getEmail());
		boolean flag = service.registCalendar(dto);
		System.out.println(dto.getId());
		if(flag){
			url = "redirect:/mypage/calendar/viewCalendar";
		}
		return url;
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyCalendar(CalendarDTO dto){
		String url = null;
		boolean flag = service.modifyCalendar(dto);
		if(flag){
			url = "redirect:/mypage/calendar/viewCalendar";
		}
		return url;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String removeCalendar(@RequestParam("calendarseq") int seq){
		String url = null;
		boolean flag = service.removeCalendar(seq);
		if(flag){
			url = "redirect:/mypage/calendar/viewCalendar";
		}
		return url;
	}
	@RequestMapping(value="/addBooking",method=RequestMethod.POST)
	public String addBooking(HttpSession session,Model model,
			BookCalendarDTO dto){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean flag = service.bookingAdd(dto,member.getEmail());
		System.out.println("controller");
		if(flag){
			url = "redirect:/map/detail/viewDetailPage?locationSeq="+dto.getLocationSeq();
		}
		return url;
	}
	@RequestMapping(value="/addBookingEvent",method=RequestMethod.POST)
	public String addBookingEvent(HttpSession session,Model model,
			BookEventCalendarDTO dto){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean flag = service.bookingAdd2(dto,member.getEmail());
		System.out.println("controller");
		if(flag){
			url = "redirect:/event/detail/view?no="+dto.getEventNo();
		}
		return url;
	}
}
