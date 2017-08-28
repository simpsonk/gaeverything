package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.EventCommentDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventPhotoDTO;
import com.bitschool.dto.GradeDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.EventDetailService;
import com.bitschool.service.GradeService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;

@RequestMapping(value="/event/detail")
@Controller
public class EventDetailController {
	
	@Inject
	private EventDetailService service;
	
	@Inject
	private ActUserService aService;
	
	@Inject
	private GradeService gService;
	
	@RequestMapping(value = "addComment", method=RequestMethod.POST)
	public String addComment(HttpSession session,Model model,EventCommentDTO dto){
		
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		
		boolean flag = service.commentAdd(dto);
		
		
/*		// 댓글쓴이의 point -> +8, myComment ->"T"
		GradeDTO gDTO = new GradeDTO(dto.getNickname(),"myComment",8);
		boolean flag2 = gService.insertInfo(gDTO);*/
		
		if(flag){
			url = "redirect:view?no="+dto.getEventNo();
		}
		return url;
	}
	
	@RequestMapping(value="/view", method= {RequestMethod.POST,RequestMethod.GET})
	public String eventDetail(HttpServletRequest request, @RequestParam(value="no") int eventNo, 
							  HttpSession session, Model model){
		String url = "event/event_detail2";
		boolean isLogin = new LoginFilter().isLogin(session, model); 
		ActUserManager manager = new ActUserManager(aService);
		
		EventDTO dto = service.selectOne(eventNo);
		List<EventCommentDTO> list = service.commentList(eventNo);
		/*for(int i=0;i<list.size();i++){
			String gradename = gService.selectGradeInfo(list.get(i).getNickname()).get(0).getGradename();
			list.get(i).setGradename(gradename);
		}*/
		
		dto = service.getEventActUserResult(manager, dto);
		List<EventPhotoDTO> photoList = service.selectPhoto(eventNo);
		List<BoardDTO> reviewList = service.getReviews(eventNo);
		List<LocationDTO> nList = service.getNearby(dto.getLatitude(), dto.getLongitude()); 	
		
		
		if(isLogin){
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.EVENT, eventNo);
			dto= manager.checkLikeStatus(aDTO, dto);
		}
		model.addAttribute("commentlist",list);
		model.addAttribute("dto", dto);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("eventphoto",photoList);
		model.addAttribute("nearbyCount", nList.size());
		return url;
	}
	
	@RequestMapping(value="/editComment",method=RequestMethod.POST)
	public String editComment(HttpSession session,Model model,
			EventCommentDTO dto){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		boolean flag = service.commentEdit(dto);
		if(flag){
			url ="redirect:view?no="+dto.getEventNo();
		}
		return url;
	}
	
	@RequestMapping(value="addPhoto",method=RequestMethod.POST)
	public String addPhoto(HttpServletRequest hsr, @RequestParam("eventNo") int eventNo,
			@RequestParam("photo") MultipartFile photo, Model model){

		String url = null;
		String photoName = photo.getOriginalFilename();
		String root_path = hsr.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources\\upload\\";
		EventPhotoDTO Pdto = new EventPhotoDTO();
		Pdto.setEventNo(eventNo);
		Pdto.setEventPhoto(photoName);
		try {
			photo.transferTo(new File(root_path+attach_path+photoName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		boolean flag = service.photoAdd(Pdto);
		List<EventPhotoDTO> list = service.selectPhoto(eventNo);
		model.addAttribute("eventphoto",list);

		
		if(flag){
			url = "redirect:view?no="+Pdto.getEventNo();
		}
		return url;
	}
	
	//디테일 코멘트데이터
	@RequestMapping(value = "/getCmtData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<EventCommentDTO> getReviewData(@RequestParam(value="eventNo") int eventNo){
		List<EventCommentDTO> commentlist = service.commentList(eventNo);	
		//이벤트댓글에 레벨 셋팅
		//System.out.println("이벤트 코멘트 수1"+commentlist.size());
		for(int i=0;i<commentlist.size();i++){
			String gradename = gService.selectGradeInfo(commentlist.get(i).getNickname()).get(0).getGradename();
			commentlist.get(i).setGradename(gradename);
		}
		//System.out.println("이벤트 코멘트 수2"+commentlist.size());
		return commentlist;
	}
	
	@RequestMapping(value="/deleteComment",method=RequestMethod.POST)
	public String deleteComment(HttpSession session,Model model,
			@RequestParam(value="commentNo") int commentNo,@RequestParam(value="eventNo") int eventNo){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		EventCommentDTO dto = new EventCommentDTO();
		dto.setNickname(member.getNickname());
		dto.setCommentNo(commentNo);
		
		//delete 댓글쓴이의 myComment, point-> -8 
		GradeDTO gDTO = new GradeDTO(member.getNickname(),"myComment",-8);
		boolean flag2 = gService.deleteInfo(gDTO);
		
		boolean flag = service.commentDelete(dto);
		if(flag){
			url ="redirect:view?no="+eventNo;
		}
		return url;
	}
	
	@RequestMapping(value = "/getPhotoData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<EventPhotoDTO> getPhotoData(@RequestParam(value="eventNo") int eventNo){
		List<EventPhotoDTO> photoList = service.photoList(eventNo);	
		return photoList;
	}
	
	@RequestMapping(value = "/getNearby", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody HashMap<String, Object> getNearby(@RequestParam(value="eventNo") int eventNo, HttpSession session, Model model){
		EventDTO dto = service.selectOne(eventNo);
		
		List<LocationDTO> nearby = service.getNearby(dto.getLatitude(), dto.getLongitude()); 
		boolean isLogin = new LoginFilter().isLogin(session, model); //로그인유지
		ActUserManager manager = new ActUserManager(aService);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member!=null){
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.EVENT);
			nearby =manager.checkAddStatus(aDTO, nearby);
		}
		HashMap<String, Object> list = new HashMap<String, Object>();
		list.put("nearby", nearby);
		list.put("dto", dto);

		return list;
	}
	


}
