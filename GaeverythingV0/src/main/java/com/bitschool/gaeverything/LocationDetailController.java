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
import com.bitschool.dto.BookCalendarDTO;
import com.bitschool.dto.BookEventCalendarDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.GradeDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.GradeService;
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

	@Inject
	private GradeService gService;
	
	//디테일 리뷰데이터
	@RequestMapping(value = "/getReviewData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<DetailCommentDTO> getReviewData(@RequestParam(value="locationSeq") int locationSeq){
		List<DetailCommentDTO> commentlist = service.commentList(locationSeq);	
		return commentlist;
	}
	
	@RequestMapping(value = "/viewDetailPage", method = RequestMethod.GET)
	public String viewDetailPage(HttpServletRequest request, 
			@RequestParam(value="locationSeq") int locationSeq, 
			HttpSession session,
			Model model){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		ActUserManager manager = new ActUserManager(aService);
		String url = "map/map_detailpage";
		
		LocationDTO dto	 = service.selectOne(locationSeq);		
		List<BoardDTO> reviewList = service.getReviews(locationSeq);
		List<DetailCommentDTO> list = service.commentList(locationSeq);
		
		dto = service.getLocActUserResult(manager, dto);
		List<DetailPhotoDTO> photoList = service.selectPhoto(locationSeq);
		List<BlogDTO> blogList = service.getBlogReviews(locationSeq);
		//좋아요 상태 유지
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
		
		return url;
	}
	
	
	@RequestMapping(value="/addComment",method=RequestMethod.POST)
	public String addComment(HttpSession session,Model model,
			DetailCommentDTO dto){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		boolean flag = service.commentAdd(dto);
		// 댓글쓴이의 point -> +8, myComment ->"T"
		GradeDTO gDTO = new GradeDTO(dto.getNickname(),"myComment");
		boolean flag2 = gService.insertInfo(gDTO);
		
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+dto.getLocationSeq();
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
		//int PCnt = 0;
		//PCnt = service.photoCnt(LSeq);
		//System.out.println("PCnt"+PCnt);
		model.addAttribute("detailphoto",list);
		//model.addAttribute("detailphotocnt",PCnt);
		
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+LSeq;
		}
		return url;
	}
	
	@RequestMapping(value = "/getPhotoData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<DetailPhotoDTO> getPhotoData(@RequestParam(value="locationSeq") int locationSeq){
		List<DetailPhotoDTO> photoList = service.photoList(locationSeq);	
		return photoList;
	}
	
	@RequestMapping(value = "/viewPhoto", method = {RequestMethod.POST,RequestMethod.GET})
	public String getReviewData(){
		String url = "map/test2";
		return url;
	}
	
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
	
	
	@RequestMapping(value="/editComment",method=RequestMethod.POST)
	public String editComment(HttpSession session,Model model,
			DetailCommentDTO dto){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		dto.setPhoto(member.getPhoto());
		boolean flag = service.commentEdit(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+dto.getLocationSeq();
		}
		return url;
	}
	
	@RequestMapping(value="/deleteComment",method=RequestMethod.POST)
	public String deleteComment(HttpSession session,Model model,
			@RequestParam(value="commentSeq") int commentSeq,@RequestParam(value="locationSeq") int locationSeq){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		DetailCommentDTO dto = new DetailCommentDTO();
		dto.setNickname(member.getNickname());
		dto.setCommentSeq(commentSeq);
		//delete 댓글쓴이의 myComment, point-> -8 
		GradeDTO gDTO = new GradeDTO(member.getNickname(),"myComment");
		boolean flag2 = gService.deleteInfo(gDTO);
		
		boolean flag = service.commentDelete(dto);
		if(flag){
			url = "redirect:viewDetailPage?locationSeq="+locationSeq;
		}
		return url;
	}
}
