	package com.bitschool.gaeverything;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.HomeListDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.EventDetailService;
import com.bitschool.service.EventService;
import com.bitschool.service.HomeService;
import com.bitschool.service.IBoardService;
import com.bitschool.service.LocationDetailService;
import com.bitschool.service.LocationService;
import com.bitschool.service.LogService;
import com.bitschool.service.SignUpService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.Email;
import com.bitschool.utils.EmailSender;
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
	private IBoardService bService;
	
	@Inject
	private EmailSender emailSender;
	 
	@Inject
	private Email email;
	
	@Inject
	private LocationDetailService lService;
	
	@Inject
	private EventService eService;
	
	@Inject
	private EventDetailService dService;
	
	@Inject
	private ActUserService aService;
	
	@Inject
	private HomeService hService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", "connect");
		boolean islogin = new LoginFilter().isLogin(session, model);
		return "home";
	}
	@RequestMapping(value = "login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(@RequestParam("email") String email, @RequestParam("pw") String pw, 
			HttpSession session, @RequestParam(value="uri", defaultValue="/") String uri,
			@RequestParam(value = "url") String loginUrl){
		String url = null;
		boolean flag = logService.loginCheckService(email, pw);
		if(flag){
			MemberDTO member = sigService.getMemberInfo(email);
			session.setAttribute("member", member);
			if(uri.equals("/")){
				url = "redirect:"+loginUrl;
			}else{
				url = "redirect:"+uri;
			}
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
	
	/*비밀번호 찾기창 열기*/
	@RequestMapping(value = "/viewFindPW", method = RequestMethod.GET)
	public String viewFindPW(HttpSession session){
		String url = "find_pw";		
		return url;
	}
	
	/*비밀번호 찾기*/
	@RequestMapping(value = "/findPW", method = RequestMethod.POST)
	    public ModelAndView findPW(@RequestParam("email") String e_mail,
	    		@RequestParam("nickname") String nickname,
	    		ModelMap model) throws Exception {
	        ModelAndView mav;
	        MemberDTO member = new MemberDTO();
	        member.setEmail(e_mail);
	        member.setNickname(nickname);
	        String pw = sigService.findPW(member);	        
	        if(pw!=null) {
	            email.setContent(nickname+"님, 안녕하세요. [Gaeverything]입니다. "
	            		+ e_mail+" 계정의 비밀번호는 "+pw+" 입니다.");
	            email.setReceiver(e_mail);
	            email.setSubject("[Gaeverything] "+nickname+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("find_pw_result");
	            return mav;
	        }else {
	            mav=new ModelAndView("find_pw");
	            return mav;
	        }
	    }	 
		//비밀번호 찾기할때 입력한 닉네임과 이메일이 한 계정으로 일치하는지 체크 
		@RequestMapping(value="/checkPW", method=RequestMethod.POST)
		public @ResponseBody boolean checkPW(@RequestParam(value = "email") String email,
				@RequestParam("nickname") String nickname) throws Exception{
			MemberDTO member = new MemberDTO();
			member.setEmail(email);
			member.setNickname(nickname);
			boolean chkPoint = sigService.findPW(member)==null;	
			return chkPoint;
		}
		
		@RequestMapping(value="mostReviewed", method={RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody List<HomeListDTO> mostReviewed(HttpSession session){
			System.out.println("home controller");
		//	HashMap<String, Object> data = null;
			
			//디테일 서비스에서 카운트리뷰, 카운트리플라이 값 나온걸 서로 더해서 토탈 리뷰 변수에 셋팅
			ActUserManager manager = new ActUserManager(aService);
			List<LocationDTO> list = lService.getAllHospital(manager);
			List<HomeListDTO> hList = hService.makeList1(list);
		
			List<EventDTO> eList = eService.getAllLists();
			eList = dService.getEventActUserResults(manager, eList);
			hList = hService.makeList2(hList, eList);

			//totalReview순으로 정렬.
			Collections.sort(hList, new Comparator<HomeListDTO>() {
			});
			
			
			
			return hList;
		}
		
		
}
