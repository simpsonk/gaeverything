	package com.bitschool.gaeverything;


import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
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
	
	private List<HomeListDTO> hList1;
	private List<HomeListDTO> hList2;
	private List<HomeListDTO> hList3;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", "connect");
	
		boolean islogin = new LoginFilter().isLogin(session, model);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		//리뷰순 
		String by1 = "review";
		ActUserManager manager = new ActUserManager(aService);
		List<LocationDTO> list1 = lService.getAllHospital(manager);
		hList1 = hService.makeList1(list1);
		List<EventDTO> eList1 = eService.getAllLists();
		eList1 = dService.getEventActUserResults(manager, eList1);
		hList1 = hService.makeList2(hList1, eList1, by1);
		
		if(member!=null){
			hList1 = hService.checkLikeStatus(manager, member.getEmail(), hList1);
		}
		model.addAttribute("list1", hList1);
						
		//별점순
		List<LocationDTO> list2 = lService.getAllHospital(manager);
		hList2 = hService.makeList1(list2);
		String by2 = "rate";
		List<EventDTO> eList2 = eService.getAllLists();

		eList2 = dService.getEventActUserResults(manager, eList2);
		hList2 = hService.makeList2(hList2, eList2, by2);

		if(member!=null){
			hList2 = hService.checkLikeStatus(manager, member.getEmail(), hList2);
		}
		model.addAttribute("list2", hList2);
		
		//북마크순
		String by3 = "bookmark";
		List<LocationDTO> list3 = lService.getAllHospital(manager);
		hList3 = hService.makeList1(list3);
		List<EventDTO> eList3 = eService.getAllLists();
		eList3 = dService.getEventActUserResults(manager, eList3);
		hList3 = hService.makeList2(hList3, eList3, by3);
		List<BoardDTO> bList = bService.getAllList();
		hList3 = hService.makeList3(hList3, bList);
		
		if(member!=null){
			hList3 = hService.checkLikeStatus(manager, member.getEmail(), hList3);
		}
		model.addAttribute("list3", hList3);
		
		//최신리뷰 3개
		List<BoardDTO> list4 = bService.getAllList();
		model.addAttribute("list4", list4);
		
		return "home";
	}
		
	@RequestMapping(value="/viewMore", method=RequestMethod.GET)
	public String viewMore (HttpSession session, Model model, @RequestParam(value= "sort", defaultValue="default") String sort){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		String url = "top_listing";
		model.addAttribute("list1", hList1);
		model.addAttribute("list2", hList2);
		model.addAttribute("list3", hList3);
		model.addAttribute("sort", sort);
		return url;
	}
		
		
	@RequestMapping(value="/updateHomeListLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateHomeListLike(
			 				@RequestParam("from") String from,
							@RequestParam("like") String like,
							@RequestParam("no") int no,
							@RequestParam("email") String email){
//		System.out.println(like);
		String url = "";
		int data = 0;
		ActUserManager manager = new ActUserManager(aService);
		ActUserDTO dto = null;
		if(from.equals("care")){
			dto = new ActUserDTO(email, ActUserManager.SHOP, no);
		}else if(from.equals("event")){
			dto = new ActUserDTO(email, ActUserManager.EVENT, no);
		}
		boolean flag = false;
		if(like.equals("like-icon")){
			flag = manager.registLikeStatus(dto);
			
			/*//(이벤트리스트에서) 이벤트 북마크 눌렀을 때 북마크누른사람 point -> +3, myBookmark -> "T"
			GradeDTO gDTO = new GradeDTO(rService.selectNickname(email),"myBookmark", 3);
			gService.insertInfo(gDTO);*/
			
			if(!flag){
//				System.out.println("insert fail: ReviewLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = manager.deleteLikeStatus(dto);
			
			/*//(이벤트리스트에서) 이벤트 북마크 해제 눌렀을 때 북마크누른사람 point -> -3, delete myBookmark
			GradeDTO gDTO = new GradeDTO(rService.selectNickname(email),"myBookmark", -3);
			gService.deleteInfo(gDTO);*/
			
			if(!flag){
//				System.out.println("delete fail: ReviewLike");
			}
		}
		
		data = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, no));
		return data;
	}
		
	@RequestMapping(value = "login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(HttpSession session,
						@RequestParam("email") String email, 
						@RequestParam("pw") String pw, 
						@RequestParam(value="uri", defaultValue="/") String uri,
						@RequestParam(value = "url") String loginUrl){
		String url = null;
		boolean flag = logService.loginCheckService(email, pw);
		if(flag){
			MemberDTO member = sigService.getMemberInfo(email);
			session.setAttribute("member", member);
			if(uri.equals("/")){
				url = "redirect:"+loginUrl;
				if(loginUrl.equals("/viewLogin")){
					url = "redirect:/";
				}
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
            email.setContent(nickname+"님, 안녕하세요. [gaeverything]입니다. "
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
}
