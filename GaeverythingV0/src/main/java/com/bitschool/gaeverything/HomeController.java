	package com.bitschool.gaeverything;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MapInfomation;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.LogService;
import com.bitschool.service.SignUpService;
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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", "connect");
/*		boolean islogin = new LoginFilter().isLogin(session, model);
*/		
		MemberDTO member = (MemberDTO)session.getAttribute("member"); 
		boolean isLogin = member!=null?true:false;
		System.out.println(isLogin);
		if(isLogin){
			model.addAttribute("member", member);
		}
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
			MapInfomation info = (MapInfomation)map.get("info");
			model.addAttribute("list", list);
			model.addAttribute("searchWord", info.getSearchWord());
			model.addAttribute("searchCategory",info.getCategories());
			session.removeAttribute("map");
		}
		return url;
	}
	
	
}
