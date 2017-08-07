package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PetPageDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.BoardService;
import com.bitschool.service.LocationDetailService;
import com.bitschool.service.MyPageService;
import com.bitschool.service.PetPageService;
import com.bitschool.service.SignUpService;
import com.bitschool.utils.ActUserManager;



@RequestMapping(value = "mypage")
@Controller
public class MypageController {
	
	@Inject
	private SignUpService sservice;
	
	@Inject
	private MyPageService service;
	
	@Inject
	private PetPageService pservice;
	
	@Inject
	private LocationDetailService lservice;
	
	@Inject
	private ActUserService aservice;
	
	@Inject
	private BoardService bservice;
	   
	   

	
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
		boolean flag3 = false;		
		MemberDTO member = sservice.getMemberInfo(email);
		if(photos.equals("")){//새로운 사진 선택 안할 경우
			flag = service.updateData2(dto);
		}else{//새로 입력한 포토로 셋팅
			flag = service.updateData(dto);
			flag2 = service.updateMemData(dto); //memberDTO도 photo셋팅 해주기
			flag3 = lservice.updatePhoto(member); //맵 디테일페이지에 photo 업데이트
		}
		member = sservice.getMemberInfo(email);
		System.out.println("flag : "+flag+"flag2 : "+flag2+"flag3 : "+flag3);
		System.out.println("MyPageDTO : "+dto);		
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
	
	//북마크한 이벤트 제거
		@RequestMapping(value = "/deleteEventBookmarks", method = RequestMethod.GET)
		public String deleteEventBookmarks(HttpSession session, Model model,
				@RequestParam(value="contentno") int contentno){
			String url = null;
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"20",contentno);
			aservice.deleteDetailPageLikeStatus(aDTO);
			System.out.println("deleteBookmarks : "+aDTO);
			url = "redirect:viewMypageBookmarks";
			return url;
		}	
	
	//북마크한 병원 제거
	@RequestMapping(value = "/deleteShopBookmarks", method = RequestMethod.GET)
	public String deleteShopBookmarks(HttpSession session, Model model,
			@RequestParam(value="contentno") int contentno){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"10",contentno);
		aservice.deleteDetailPageLikeStatus(aDTO);
		System.out.println("deleteBookmarks : "+aDTO);
		url = "redirect:viewMypageBookmarks";
		return url;
	}	
	
	//북마크한 리뷰 제거
	@RequestMapping(value = "/deleteBookmarks", method = RequestMethod.GET)
	public String deleteBookmarks(HttpSession session, Model model,
			@RequestParam(value="contentno") int contentno){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"00",contentno);
		aservice.deleteDetailPageLikeStatus(aDTO);
		System.out.println("deleteBookmarks : "+aDTO);
		url = "redirect:viewMypageBookmarks";
		return url;
	}	
	
	//마이페이지-북마크탭 보기
	@RequestMapping(value = "/viewMypageBookmarks", method = RequestMethod.GET)
	public String viewMypageBookmarks(HttpSession session, Model model){
		String url = "mypage/mypage_bookmarks";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		List<BoardDTO> reviewList = aservice.selectReviewBookmark(member.getEmail());	
		List<LocationDTO> mapList = aservice.selectShopBookmark(member.getEmail());
		List<LocationDTO> mapList2 = new ArrayList<LocationDTO>();
		LocationDTO dto = null;
		ActUserManager manager = new ActUserManager(aservice);
		List<EventDTO> eventList = aservice.selectEventBookmark(member.getEmail());
		for(int i=0;i<reviewList.size();i++){
			int boardNo = reviewList.get(i).getBoardNo();
			reviewList.get(i).setNumOfCmt(bservice.getNumOfCmts(boardNo));
		}
		for(int i=0;i<mapList.size();i++){
			dto = lservice.getLocActUserResult(manager, mapList.get(i));
			mapList2.add(dto);
		}
		System.out.println("mapList2 :" +mapList2);
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("mapList",mapList2);
			model.addAttribute("eventList",eventList);
		}
		return url;
	}	

}
