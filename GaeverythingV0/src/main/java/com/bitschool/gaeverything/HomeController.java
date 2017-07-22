	package com.bitschool.gaeverything;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.IBoardService;
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
		 	System.out.println("findPW 에 옴");
	        ModelAndView mav;
	        MemberDTO member = new MemberDTO();
	        member.setEmail(e_mail);
	        member.setNickname(nickname);
	        String pw = sigService.findPW(member);	        
	        System.out.println(pw);
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
			System.out.println("member :"+member);
			boolean chkPoint = sigService.findPW(member)==null;	
			System.out.println("chkPoint :"+chkPoint);
			return chkPoint;
		}
}
