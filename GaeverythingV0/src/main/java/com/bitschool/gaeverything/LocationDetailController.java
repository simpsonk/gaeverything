package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
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
import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.LocationDetailService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;

@RequestMapping(value = "map/detail")
@Controller
public class LocationDetailController {
	
	@Inject
	private LocationDetailService service;
	
	@Inject
	private ActUserService aService;
<<<<<<< HEAD
		
	//µðÅ×ÀÏ ¸®ºäµ¥ÀÌÅÍ
=======
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½äµ¥ï¿½ï¿½ï¿½ï¿½
>>>>>>> 6fdad2737a969940b342c7181d607b4fba1d4317
	@RequestMapping(value = "/getReviewData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<DetailCommentDTO> getReviewData(@RequestParam(value="locationSeq") int locationSeq){
		List<DetailCommentDTO> commentlist = service.commentList(locationSeq);	
		return commentlist;
	}
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request, 
			@RequestParam(value="locationSeq") int locationSeq, 
			HttpSession session,
			Model model){
<<<<<<< HEAD
		//·Î±×ÀÎ À¯Áö
=======
		
		//ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
>>>>>>> 6fdad2737a969940b342c7181d607b4fba1d4317
		boolean isLogin = new LoginFilter().isLogin(session, model);
		ActUserManager manager = new ActUserManager(aService);
		String url = "map/map_detailpage";
		
		LocationDTO dto	 = service.selectOne(locationSeq);		
		List<BoardDTO> reviewList = service.getReviews(locationSeq);
		List<DetailCommentDTO> list = service.commentList(locationSeq);
		
		dto = service.getLocActUserResult(manager, dto);
		List<DetailPhotoDTO> photoList = service.selectPhoto(locationSeq);
<<<<<<< HEAD
		List<BlogDTO> blogList = service.getBlogReviews(locationSeq);
		//ÁÁ¾Æ¿ä »óÅÂ À¯Áö
=======
		
		//ï¿½ï¿½ï¿½Æ¿ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
>>>>>>> 6fdad2737a969940b342c7181d607b4fba1d4317
		if(isLogin){
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.SHOP, locationSeq);
			dto= manager.checkLocLikeStatus(aDTO, dto);
		}
		
		
		model.addAttribute("commentlist",list);
		model.addAttribute("detail", dto);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("detailphoto",photoList);
		model.addAttribute("blogList",blogList);
		
		System.out.println("ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ® : "+list);
		System.out.println("detail : "+dto);
		return url;
	}
	
	
	//ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½
	@RequestMapping(value="/addComment",method=RequestMethod.POST)
	public String addComment(HttpSession session,Model model,
			DetailCommentDTO dto){
		String url = null;
		System.out.println("addCommentï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		System.out.println("dto : "+dto);
		boolean flag = service.commentAdd(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+dto.getLocationSeq();
			System.out.println("addComment ï¿½ï¿½ï¿½ï¿½");
			System.out.println("ï¿½ï¿½ï¿½dto : "+dto);
		}
		return url;
	}
	@RequestMapping(value="addPhoto",method=RequestMethod.POST)
	public String addPhoto(HttpServletRequest hsr, @RequestParam("locationSeq") int LSeq,
			@RequestParam("photo") MultipartFile photo, Model model){
		String url = null;
		String photoName = photo.getOriginalFilename();
		String root_path = hsr.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources\\upload\\";
		DetailPhotoDTO Pdto = new DetailPhotoDTO();
		Pdto.setLocationSeq(LSeq);
		Pdto.setLocationPhoto(photoName);
		System.out.println(Pdto);
		try {
			photo.transferTo(new File(root_path+attach_path+photoName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean flag = service.photoAdd(Pdto);
		List<DetailPhotoDTO> list = service.selectPhoto(LSeq);
		model.addAttribute("detailphoto",list);
		
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+LSeq;
		}
		return url;
	}
	
	@RequestMapping(value = "/viewPhoto", method = {RequestMethod.POST,RequestMethod.GET})
	public String getReviewData(){
		String url = "map/test2";
		return url;
	}
	
	//ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value="/viewEditComment",method={RequestMethod.GET,RequestMethod.POST})
	public String viewEditComment(HttpSession session,Model model,@RequestParam(value="locationSeq2") int locationSeq){
		String url = null;
		url = "map/map_detailpage2";
		LocationDTO dto = new LocationDTO();	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto = service.selectOne(locationSeq);		
		List<DetailCommentDTO> list = service.commentList(locationSeq);		
		model.addAttribute("commentlist",list);
		model.addAttribute("detail", dto);	
		model.addAttribute("member",member);
		return url;
	}
	
	
	//ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½	
	@RequestMapping(value="/editComment",method=RequestMethod.POST)
	public String editComment(HttpSession session,Model model,
			DetailCommentDTO dto){
		String url = null;
		System.out.println("editCommentï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ dto : "+dto);
		boolean flag = service.commentEdit(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+dto.getLocationSeq();
			System.out.println("editComment ï¿½ï¿½ï¿½ï¿½");
			System.out.println("ï¿½ï¿½ï¿½dto : "+dto);
		}
		return url;
	}
	
	//ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value="/deleteComment",method=RequestMethod.POST)
	public String deleteComment(HttpSession session,Model model,
			@RequestParam(value="commentSeq") int commentSeq,@RequestParam(value="locationSeq") int locationSeq){
		String url = null;
		System.out.println("deleteCommentï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		DetailCommentDTO dto = new DetailCommentDTO();
		dto.setNickname(member.getNickname());
		dto.setCommentSeq(commentSeq);
		boolean flag = service.commentDelete(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+locationSeq;
			System.out.println("deleteComment ï¿½ï¿½ï¿½ï¿½");
		}
		return url;
	}
	

	

}
