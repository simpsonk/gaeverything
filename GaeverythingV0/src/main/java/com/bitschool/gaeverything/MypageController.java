package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PetPageDTO;
import com.bitschool.service.MyPageService;
import com.bitschool.service.PetPageService;
import com.bitschool.service.SignUpService;
import com.bitschool.utils.Email;
import com.bitschool.utils.EmailSender;


@RequestMapping(value = "mypage")
@Controller
public class MypageController {
	
	@Inject
	private SignUpService sservice;
	
	@Inject
	private MyPageService service;
	
	@Inject
	private PetPageService pservice;
	
	@Autowired
	private EmailSender emailSender;
	 
	@Autowired
	private Email email;
	   
	   
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
	        String pw = sservice.findPW(member);	        
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
			boolean chkPoint = sservice.findPW(member)==null;	
			System.out.println("chkPoint :"+chkPoint);
			return chkPoint;
		}
	
	/*마이페이지 열기*/
	@RequestMapping(value = "/viewMypageProfile", method = RequestMethod.GET)
	public String viewMypageProfile(HttpSession session, Model model){
		String url = "mypage/mypage_profile";
		System.out.println("viewMypageProfile에 들어왔다");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			MyPageDTO mypage = service.readData(member);
			System.out.println("mypage : "+mypage);
			model.addAttribute("member", member);
			model.addAttribute("mypage", mypage);
		}
		return url;
	}
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(@RequestParam("email") String email,@RequestParam("phone") String phone, 
			@RequestParam("name") String name, @RequestParam("notes") String notes, @RequestParam("photo") MultipartFile photo,
			Model model,HttpServletRequest req){		
		
		System.out.println("MypageController-updateMember로 들어왔다");
		String photos=photo.getOriginalFilename();	
		System.out.println("photos : "+photos);
		String url = null;	
		MyPageDTO dto=new MyPageDTO();
        String root_path = req.getSession().getServletContext().getRealPath("/");  
        String attach_path = "resources\\upload\\";

		try { 
			dto.setEmail(email);
			dto.setNotes(notes);
			dto.setName(name);
			dto.setPhone(phone);
			if(photos.equals("")){ //새로운 사진 선택 안할 경우

			}else{
				dto.setPhoto(photos); //새로 입력한 포토로 셋팅
			}
			photo.transferTo(new File(root_path+attach_path+photos));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean flag = false;
		boolean flag2 = false;
		if(photos.equals("")){//새로운 사진 선택 안할 경우
			flag = service.updateData2(dto);
		}else{//새로 입력한 포토로 셋팅
			flag = service.updateData(dto);
			flag2 = service.updateMemData(dto); //memberDTO도 photo셋팅 해주기
		}
		System.out.println("flag : "+flag);
		System.out.println("flag2 : "+flag2);
		System.out.println("MyPageDTO : "+dto);
		MemberDTO member = sservice.getMemberInfo(email);
		req.getSession().setAttribute("member", member);
		System.out.println("MemberDTO : "+member);
		if(flag){
			url = "redirect:viewMypageProfile";	
			model.addAttribute("member", member);
			model.addAttribute("mypage", dto);

		}
		
		return url;
	}
	//펫 리스트 보기(♥)
	@RequestMapping(value = "/viewPetList", method = RequestMethod.GET)
	public String viewPetList(HttpSession session, Model model){
		System.out.println("viewPetList에 들어왔다");
		String url = "mypage/mypage_pet_list";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
			List<PetPageDTO> petList = pservice.readPetsData(member); 
			int count = pservice.countPetData(member);
			if(count>0){
				url = "mypage/mypage_pet_list2";
			}
			model.addAttribute("list",petList);	
		}				
		return url;
	}
	//펫 등록하기(♥)
	@RequestMapping(value = "/registNewPet", method = RequestMethod.POST)
	public String registNewPet(@RequestParam("email") String email,@RequestParam("petname") String petname, 
			@RequestParam("species") String species, @RequestParam("gender") String gender,
			@RequestParam("age") int age, @RequestParam("photo") MultipartFile photo,
			@RequestParam("notes") String notes,HttpServletRequest req, Model model){
		
		System.out.println("MypageController-registNewPet에 들어왔다");
		String photos=photo.getOriginalFilename();	
		System.out.println("photos : "+photos);
		String url = null;	
		PetPageDTO pet = new PetPageDTO();
		String root_path = req.getSession().getServletContext().getRealPath("/");  
	    String attach_path = "resources\\upload\\";

		//String url = "mypage/mypage_pet_profile";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		System.out.println("member의 email : "+member.getEmail());
		try { 
			pet.setEmail(email);
			pet.setPetname(petname);
			pet.setSpecies(species);
			pet.setGender(gender);
			pet.setAge(age);
			pet.setNotes(notes);
			
			if(photos.equals("")){ //새로운 사진 선택 안할 경우

			}else{
				pet.setPhoto(photos); //새로 입력한 포토로 셋팅
			}
			photo.transferTo(new File(root_path+attach_path+photos));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		boolean flag = false;
		if(photos.equals("")){//새로운 사진 선택 안할 경우
			flag = pservice.insertPetData2(pet);
		}else{//새로 입력한 포토로 셋팅
			flag = pservice.insertPetData(pet);	
			model.addAttribute("petpage",pet);
		}
		
		model.addAttribute("member",member);		
		System.out.println("flag : "+flag);
		if(flag){
			url = "redirect:viewPetList";
		}
		return url;
	}

	//펫 등록하는 페이지 보기
	@RequestMapping(value = "/viewMypagePetProfile", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewMypagePetProfile(HttpSession session, Model model){
		System.out.println("viewMypagePetProfile에 들어왔다");
		String url = "mypage/mypage_pet_profile";	//등록하는 페이지로 이동
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
		}
		return url;
	}
	
	//펫 삭제하기(♥)
	@RequestMapping(value = "/removePet", method = {RequestMethod.POST,RequestMethod.GET})
	public String removePet(HttpSession session, Model model,
			@RequestParam("petno") int petno){
		System.out.println("removePet에 들어왔다");
		System.out.println("petno : "+petno);
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			PetPageDTO pet = new PetPageDTO();
			pet.setPetno(petno);
			pet.setEmail(member.getEmail());			
			boolean flag = pservice.deletePetData(pet);
			if(flag){
				url = "redirect:viewPetList";
			}
		}
		return url;
	}
	
	//펫 수정하기(♥)
	//modifyPet
	@RequestMapping(value = "/modifyPet", method = {RequestMethod.POST,RequestMethod.GET})
	public String modifyPet(@RequestParam("petname") String petname,@RequestParam("petno") int petno,
			@RequestParam("species") String species, @RequestParam("gender") String gender,
			@RequestParam("age") int age, @RequestParam("photo") MultipartFile photo,
			@RequestParam("notes") String notes,HttpServletRequest req, Model model){
		System.out.println("MypageController-modifyPet에 들어왔다");
		String photos=photo.getOriginalFilename();	
		System.out.println("photos : "+photos);
		String url = null;	
		PetPageDTO pet = new PetPageDTO();
		String root_path = req.getSession().getServletContext().getRealPath("/");  
	    String attach_path = "resources\\upload\\";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
		try { 
			pet.setPetno(petno);
			pet.setEmail(member.getEmail());
			pet.setPetname(petname);
			pet.setSpecies(species);
			pet.setGender(gender);
			pet.setAge(age);
			pet.setNotes(notes);
			
			if(photos.equals("")){ //새로운 사진 선택 안할 경우
				
			}else{
				pet.setPhoto(photos); //새로 입력한 포토로 셋팅
			}
			photo.transferTo(new File(root_path+attach_path+photos));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println("pet : "+pet);
		
		boolean flag = false;
		if(photos.equals("")){//새로운 사진 선택 안할 경우
			flag = pservice.updatePetData2(pet);
			model.addAttribute("petpage",pet);
		}else{//새로 입력한 포토로 셋팅
			flag = pservice.updatePetData(pet);
			model.addAttribute("petpage",pet);
		}
		model.addAttribute("member",member);		
		System.out.println("flag : "+flag);
		if(flag){
			url = "redirect:viewPetList";
		}
		return url;
	}
	
	//펫 수정하는 페이지 보기(♥)
	@RequestMapping(value = "/viewModifyPetProfile", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewModifyPetProfile(HttpSession session, Model model,@RequestParam("petno") int petno){
		System.out.println("viewModifyPetProfile에 들어왔다");
		String url = "mypage/mypage_pet_profile2";	//수정하는 페이지로 이동
		MemberDTO member = (MemberDTO)session.getAttribute("member");		
		System.out.println("petno : "+petno); //petno..
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			PetPageDTO pet = new PetPageDTO();
			pet.setPetno(petno);
			pet.setEmail(member.getEmail());
			System.out.println("pet : "+pet);
			pet = pservice.readPetData(pet); //pet하나정보읽기
			System.out.println("pet : "+pet);			
			model.addAttribute("petpage",pet);
		}
		return url;
	}
	
	
	@RequestMapping(value = "/viewMypageList", method = RequestMethod.GET)
	public String viewMypageList(HttpSession session, Model model){
		String url = "mypage/mypage_list";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value = "/viewMypageDashboard", method = RequestMethod.GET)
	public String viewDashBoard(HttpSession session, Model model){
		String url = "mypage/mypage_dashboard";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value = "/viewMypageReviews", method = RequestMethod.GET)
	public String viewMypageReviews(HttpSession session, Model model){
		String url = "mypage/mypage_reviews";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
		}
		return url;
	}
	
	@RequestMapping(value = "/viewMypageBookmarks", method = RequestMethod.GET)
	public String viewMypageBookmarks(HttpSession session, Model model){
		String url = "mypage/mypage_bookmarks";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
		}
		return url;
	}	

}
