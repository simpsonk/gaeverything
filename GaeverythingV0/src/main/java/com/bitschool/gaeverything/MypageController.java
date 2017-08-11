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
import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PetPageDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.BoardService;
import com.bitschool.service.ICommentService;
import com.bitschool.service.LocationDetailService;
import com.bitschool.service.MyPageService;
import com.bitschool.service.PetPageService;
import com.bitschool.service.SignUpService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;



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
	   
	@Inject
	private ICommentService cservice;
	

	   

	
	/*마이페이지 열기*/
	@RequestMapping(value = "/viewMypageProfile", method = RequestMethod.GET)
	public String viewMypageProfile(HttpSession session, Model model){
		String url = "mypage/mypage_profile";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			MyPageDTO mypage = service.readData(member);
			model.addAttribute("member", member);
			model.addAttribute("mypage", mypage);
		}
		return url;
	}
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(@RequestParam("email") String email,@RequestParam("phone") String phone, 
			@RequestParam("name") String name, @RequestParam("notes") String notes, @RequestParam("photo") MultipartFile photo,
			Model model,HttpServletRequest req){		
		
		String photos=photo.getOriginalFilename();	
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
		
		String photos=photo.getOriginalFilename();	
		String url = null;	
		PetPageDTO pet = new PetPageDTO();
		String root_path = req.getSession().getServletContext().getRealPath("/");  
	    String attach_path = "resources\\upload\\";

		//String url = "mypage/mypage_pet_profile";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("member");
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
		if(flag){
			url = "redirect:viewPetList";
		}
		return url;
	}

	//펫 등록하는 페이지 보기
	@RequestMapping(value = "/viewMypagePetProfile", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewMypagePetProfile(HttpSession session, Model model){
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
		String photos=photo.getOriginalFilename();	
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
		
		
		boolean flag = false;
		if(photos.equals("")){//새로운 사진 선택 안할 경우
			flag = pservice.updatePetData2(pet);
			model.addAttribute("petpage",pet);
		}else{//새로 입력한 포토로 셋팅
			flag = pservice.updatePetData(pet);
			model.addAttribute("petpage",pet);
		}
		model.addAttribute("member",member);		
		if(flag){
			url = "redirect:viewPetList";
		}
		return url;
	}
	
	//펫 수정하는 페이지 보기(♥)
	@RequestMapping(value = "/viewModifyPetProfile", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewModifyPetProfile(HttpSession session, Model model,@RequestParam("petno") int petno){
		String url = "mypage/mypage_pet_profile2";	//수정하는 페이지로 이동
		MemberDTO member = (MemberDTO)session.getAttribute("member");		
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			PetPageDTO pet = new PetPageDTO();
			pet.setPetno(petno);
			pet.setEmail(member.getEmail());
			pet = pservice.readPetData(pet); //pet하나정보읽기
			model.addAttribute("petpage",pet);
		}
		return url;
	}
	
	
	@RequestMapping(value = "/viewMypageList", method = RequestMethod.GET)
	public String viewMypageList(HttpSession session, Model model,
			@RequestParam(value="category", defaultValue="0") int category){
		String url = "mypage/mypage_list";
		if(category==1){
			url = "mypage/mypage_list_reviews";
		}else if(category==2){
			url = "mypage/mypage_list_comments";
		}
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		List<BoardDTO> reviewList = service.selectMyReviews(member.getNickname());
		member.setMyReviewSize(reviewList.size());
		List<DetailCommentDTO> commentList = service.selectMyDetailComments(member.getNickname());
		List<CommentDTO> bCommentList = service.selectMyBoardComments(member.getNickname());
		member.setMyCommentSize(commentList.size()+bCommentList.size());
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("commentList",commentList);	
			model.addAttribute("bCommentList",bCommentList);
		}
		return url;
	}
	
	//대시보드
	@RequestMapping(value = "/viewMypageDashboard", method = RequestMethod.GET)
	public String viewDashBoard(HttpSession session, Model model){
		String url = "mypage/mypage_dashboard";
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean isLogin = member!=null?true:false;
		
		//마이페이지 눌렀을때 네비게이터에 개수 뜨도록//////////////////////////////////////
		List<DetailCommentDTO> cl = service.selectMyDetailComments(member.getNickname());
		List<CommentDTO> bcl = service.selectMyBoardComments(member.getNickname());
		member.setMyCommentSize(cl.size()+bcl.size());
		List<BoardDTO> reviewList = service.selectMyReviews(member.getNickname());
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.REVIEW);
		reviewList= new ActUserManager(aservice).checkListReLikeStatus(aDTO, reviewList);
		member.setMyReviewSize(reviewList.size());
		List<BoardDTO> rl = aservice.selectReviewBookmark(member.getEmail());	
		List<LocationDTO> ml = aservice.selectShopBookmark(member.getEmail());
		member.setBookmarkMapSize(ml.size());
		member.setBookmarkReviewSize(rl.size());		
		List<EventDTO> el = aservice.selectEventBookmark(member.getEmail());
		member.setBookmarkEventSize(el.size());
		///////////////////////////////////////////////////////////////////////
		int countReviewBookmark = 0; //리뷰북마크수,댓글수,조회수
		int countReviewCmt = 0;
		int countRead = 0;	
		for(int i=0;i<reviewList.size();i++){
			int temp = reviewList.get(i).getCountLike();
			countReviewBookmark = countReviewBookmark + temp;
			int temp2 = cservice.countCmt(reviewList.get(i).getGroupNo());
			countReviewCmt = countReviewCmt + temp2;
			int temp3 = reviewList.get(i).getReadCount();
			countRead = countRead + temp3;
		}
		int countLocReviews = service.countLocReviews(member.getNickname());
		List<LocationDTO> mapList = aservice.selectShopBookmark(member.getEmail());
		List<DetailCommentDTO> commentList = new ArrayList<DetailCommentDTO>();
		List<DetailCommentDTO> commentList2 = new ArrayList<DetailCommentDTO>();
		for(int i=0;i<mapList.size();i++){
			commentList = lservice.commentList(mapList.get(i).getLocationSeq());
			for(int j=0;j<commentList.size();j++){
				commentList.get(j).setAddress(service.selectShopName(mapList.get(i).getLocationSeq()));	
				commentList2.add(commentList.get(j));
			}

		}
	
	
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("countReviewBookmark",countReviewBookmark);
			model.addAttribute("countReviewCmt",countReviewCmt);
			model.addAttribute("countRead",countRead);
			model.addAttribute("countLocReviews",countLocReviews);
			model.addAttribute("commentList",commentList2);
		}
		return url;
	}
	
	//북마크한 이벤트 제거
		@RequestMapping(value = "/deleteEventBookmarks", method = RequestMethod.GET)
		public String deleteEventBookmarks(HttpSession session, Model model,
				@RequestParam(value="contentno") int contentno,
				@RequestParam(value="category",defaultValue="0") int category){
			String url = null;
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"20",contentno);
			aservice.deleteDetailPageLikeStatus(aDTO);
			url = "redirect:viewMypageBookmarks?category="+category;	
			return url;
		}	
	
	//북마크한 병원 제거
	@RequestMapping(value = "/deleteShopBookmarks", method = RequestMethod.GET)
	public String deleteShopBookmarks(HttpSession session, Model model,
			@RequestParam(value="contentno") int contentno,
			@RequestParam(value="category",defaultValue="0") int category){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"10",contentno);
		aservice.deleteDetailPageLikeStatus(aDTO);
		url = "redirect:viewMypageBookmarks?category="+category;	
		return url;
	}	
	
	//북마크한 리뷰 제거
	@RequestMapping(value = "/deleteBookmarks", method = RequestMethod.GET)
	public String deleteBookmarks(HttpSession session, Model model,
			@RequestParam(value="contentno") int contentno,
			@RequestParam(value="category",defaultValue="0") int category){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO aDTO = new ActUserDTO(member.getEmail(),"00",contentno);
		aservice.deleteDetailPageLikeStatus(aDTO);
		url = "redirect:viewMypageBookmarks?category="+category;		
		return url;
	}	
	
	//마이페이지-북마크탭 보기
	@RequestMapping(value = "/viewMypageBookmarks", method = RequestMethod.GET)
	public String viewMypageBookmarks(HttpSession session, Model model,
			@RequestParam(value="category",defaultValue="0") int category){
		String url = "mypage/mypage_bookmarks";
		if(category==1){
			url = "mypage/mypage_bookmarks_reviews";
		}else if(category==2){
			url = "mypage/mypage_bookmarks_map";
		}else if(category==3){
			url = "mypage/mypage_bookmarks_events";
		}
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		List<BoardDTO> reviewList = aservice.selectReviewBookmark(member.getEmail());	
		List<LocationDTO> mapList = aservice.selectShopBookmark(member.getEmail());
		List<LocationDTO> mapList2 = new ArrayList<LocationDTO>();		
		member.setBookmarkMapSize(mapList.size());
		member.setBookmarkReviewSize(reviewList.size());
		LocationDTO dto = null;
		ActUserManager manager = new ActUserManager(aservice);
		List<EventDTO> eventList = aservice.selectEventBookmark(member.getEmail());
		member.setBookmarkEventSize(eventList.size());
		for(int i=0;i<reviewList.size();i++){
			int boardNo = reviewList.get(i).getBoardNo();
			reviewList.get(i).setNumOfCmt(bservice.getNumOfCmts(boardNo));
		}
		for(int i=0;i<mapList.size();i++){
			dto = lservice.getLocActUserResult(manager, mapList.get(i));
			mapList2.add(dto);
		}
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
	
	//MyActivity에서  내가작성한 댓글(리뷰게시판) 수정하기
	@RequestMapping(value="/modifyCmt", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyCmt(BoardDTO dto, CommentDTO cDTO,  
							@RequestParam("groupNo") int groupNo,
							@RequestParam("commentNo") int commentNo,
							@RequestParam(value="page", defaultValue="1") int page,
							Model model, 
							HttpSession session){
		dto = bservice.selectToRead(groupNo);
		int numOfCmt = cservice.countCmt(groupNo);
		List<CommentDTO> commentList = cservice.getAllComment(groupNo);		
		boolean isLogin = new LoginFilter().isLogin(session, model);		
		model.addAttribute("commentList", commentList);
		model.addAttribute("numOfCmt", numOfCmt);
		model.addAttribute("dto", dto);
		model.addAttribute("modifyNo", commentNo);		
		String url = "mypage/mypage_list_comments_modify";		
		return url;
	}
	
	//MyActivity에서  내가쓴 리뷰댓글 삭제하기
	@RequestMapping(value="/removeMyBoardCmt" ,method = {RequestMethod.POST,RequestMethod.GET})
	public String removeMyBoardCmt(HttpSession session, Model model,
								   @RequestParam("commentNo") int commentNo,
								   @RequestParam(value="category", defaultValue="0") int category){
		String url = null;
		boolean flag = cservice.removeCmt(commentNo);
		if(flag){
			url = "redirect:viewMypageList?category="+category;
		}
		return url;
	}
	
	//MyActivity에서 내가쓴 병원댓글 수정하기
	@RequestMapping(value="/modifyMapCmt",method=RequestMethod.POST)
	public String modifyMapCmt(HttpSession session,Model model,
			DetailCommentDTO list,
			@RequestParam(value="commentSeq") int commentSeq,
			@RequestParam(value="locationSeq") int locationSeq,
			@RequestParam(value="index") int index){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		list.setNickname(member.getNickname());
		list.setPhoto(member.getPhoto());	
		boolean flag = lservice.commentEdit(list);
		if(flag){
			url = "redirect:viewMypageList?category=2";
		}
		return url;
	}
	
	//MyActivity에서 내가쓴 병원댓글 수정하는 뷰
	@RequestMapping(value="/viewModifyMapCmt", method={RequestMethod.GET, RequestMethod.POST})
	public String viewModifyMapCmt(HttpSession session, Model model,
			@RequestParam(value="commentSeq") int commentSeq){
		String url = "mypage/mypage_list_comments_modifymap";
	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		List<BoardDTO> reviewList = service.selectMyReviews(member.getNickname());
		member.setMyReviewSize(reviewList.size());
		List<DetailCommentDTO> commentList = service.selectMyDetailComments(member.getNickname());
		List<CommentDTO> bCommentList = service.selectMyBoardComments(member.getNickname());
		member.setMyCommentSize(commentList.size()+bCommentList.size());
		
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			url = "login_page";
		}else{
			model.addAttribute("member", member);
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("commentList",commentList);	
			model.addAttribute("bCommentList",bCommentList);
			model.addAttribute("commentSeq",commentSeq);
		}
		return url;
	}
	
	//MyActivity에서 내가쓴 병원댓글 삭제하기
	@RequestMapping(value="/removeMyMapCmt",method=RequestMethod.GET)
	public String removeMyMapCmt(HttpSession session,Model model,
			@RequestParam(value="commentSeq") int commentSeq,
			 @RequestParam(value="category", defaultValue="0") int category){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		DetailCommentDTO dto = new DetailCommentDTO();
		dto.setNickname(member.getNickname());
		dto.setCommentSeq(commentSeq);
		boolean flag = lservice.commentDelete(dto);
		if(flag){
			url = "redirect:viewMypageList?category="+category;
		}
		return url;
	}

}
