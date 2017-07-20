	package com.bitschool.gaeverything;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.IBoardService;
import com.bitschool.service.LocationService;
import com.bitschool.service.LogService;
import com.bitschool.service.SignUpService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private LogService logService;
	
	@Inject
	private SignUpService sigService;
	
	@Inject
	private LocationService service;
	
	@Inject
	private IBoardService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", "connect");
		boolean islogin = new LoginFilter().isLogin(session, model);
		
		String likeStatus = new ActUserManager().checkLikeStatus(new ActUserDTO("admin@naver.com", 10, "01"), bService);
		System.out.println(islogin);
		System.out.println(likeStatus);
		model.addAttribute("likeStatus", likeStatus);
		return "home";
	}
	@RequestMapping(value = "login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(@RequestParam("email") String email, @RequestParam("pw") String pw, 
			HttpSession session, @RequestParam(value="uri", defaultValue="/") String uri){
		String url = null;
		boolean flag = logService.loginCheckService(email, pw);
		if(flag){
			MemberDTO member = sigService.getMemberInfo(email);
			url = "redirect:"+uri;
			session.setAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		String url = "redirect:/";
		session.invalidate();
		return url;
	}
	@RequestMapping(value = "viewLogin", method = RequestMethod.GET)
	public String viewLogin(){
		String url = "login_page";
		return url;
	}
	
	@RequestMapping(value = "viewSearchShop", method = RequestMethod.GET)
	public String viewSearchShop(HttpSession session, Model model){
		String url = "search_shop";
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("map");
		if(map!=null){
			List<LocationDTO> list = (List<LocationDTO>)map.get("list");
			HashMap<String, Object> searchData = (HashMap<String, Object>)map.get("searchData");
			model.addAttribute("list", list);
			model.addAttribute("searchData", searchData);
			session.removeAttribute("map");
		}
		return url;
	}
	
	@RequestMapping(value = "getSearhShopname", method = RequestMethod.POST)
	public String getSearhShopname(@RequestParam(value = "searchWord") String searchWord, @RequestParam(value = "selectOp1") String selectOp1, 
			@RequestParam(value = "selectOp2") String selectOp2, Model model,  HttpSession session){
		String url = "redirect:/viewSearchShop";
		HashMap<String, Object> searchData = new HashMap<String, Object>();
		
		searchData.put("searchWord", searchWord);
		searchData.put("selectOp1", selectOp1);
		searchData.put("selectOp2", selectOp2);
		
		List<LocationDTO> list = service.getSearchData(searchData);
		System.out.println(list);
		System.out.println(searchData);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchData", searchData);
		session.setAttribute("map", map);
		return url;
	}
}
