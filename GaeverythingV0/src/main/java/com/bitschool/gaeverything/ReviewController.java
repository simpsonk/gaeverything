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

import com.bitschool.dao.ReviewFileBean;
import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.IBoardService;
import com.bitschool.service.ICommentService;
import com.bitschool.service.IPagerService;
import com.bitschool.service.LocationDetailService;
import com.bitschool.service.LocationService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;


@RequestMapping(value = "review")
@Controller
public class ReviewController {
	
	@Inject
	private IBoardService service;
	
	@Inject
	private IPagerService pService;
	
	@Inject
	private ICommentService cService;
	
	@Inject
	private LocationService locService;
	
	@Inject
	private ActUserService aService;
	
	@Inject
	private LocationDetailService dService; 


	@RequestMapping(value = "/viewDetailReviews", method = RequestMethod.GET)
	public String viewDetailReviews(HttpSession session,  @RequestParam(value="locationSeq") int locationSeq,
			@RequestParam(value="page", defaultValue="1") int page,Model model){
		String url = "review/review_list";
		List<BoardDTO> reviewList = dService.getReviews(locationSeq);
		model.addAttribute("list",reviewList);
		model.addAttribute("page",page);
		return url;
	}
	
	@RequestMapping(value = "/viewReviewList", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewReviewList(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value = "categoryCode", defaultValue = "0") String categoryCode){
		
		boolean isLogin = new LoginFilter().isLogin(session, model);
		
		int amount = 5;
		PageDTO pDTO = null;
		if(categoryCode.equals("0")||categoryCode.equals("null")){
			pDTO = new PageDTO(page, amount, null);
		}else{
			pDTO = new PageDTO(page, amount, categoryCode);
		}
		
		String pList = pService.pageList(pDTO);
		model.addAttribute("pList", pList);
		
		List<BoardDTO> list = service.getPagedList(pDTO); 
		model.addAttribute("page", page);
		
		//user like status like
		if(isLogin){
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.REVIEW);
			list= new ActUserManager(aService).checkListReLikeStatus(aDTO, list);
		}
		
		int countCmts = 0;
		for(int i=0; i<list.size(); i++){
			BoardDTO dto = list.get(i);
			countCmts = service.getNumOfCmts(dto.getBoardNo());
			list.get(i).setNumOfCmt(countCmts);
		}
		model.addAttribute("list", list);
		String url = "review/review_list";

		return url;
	}

	@RequestMapping(value = "/viewReviewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewReviewRegist(HttpSession session, Model model,
			@RequestParam(value="locationSeq", defaultValue = "0") int locationSeq,
			@RequestParam(value="boardCategory",defaultValue="") String boardCategory,
			@RequestParam(value="address", defaultValue = "") String address
			/*@RequestParam(value="eventNo") int eventNo*/){
		System.out.println("check"+locationSeq);
		boolean isLogin = new LoginFilter().isLogin(session, model);
		String url = "review/review_regist";
		model.addAttribute("locationSeq",locationSeq);
		model.addAttribute("boardCategory",boardCategory);
		model.addAttribute("address",address);
		return url;
	}
	
	@RequestMapping(value = "/newPost", method={RequestMethod.POST, RequestMethod.GET})
	public String newPost(BoardDTO dto, HttpSession session, @RequestParam(value = "categoryCode", defaultValue ="0") String categoryCode){
		String url = null;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		boolean flag = service.insertPost(dto);
		if(flag){
			url = "redirect:/review/viewReviewList?categoryCode="+categoryCode;
		}
		return url;
	}
	
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modify(BoardDTO dto, Model model, @RequestParam("page") int page, @RequestParam("boardNo") int boardNo){
		String url = null;
		dto.setBoardNo(boardNo);
		boolean flag = service.updatePost(dto);
		if(flag){
			model.addAttribute("dto", dto);
			model.addAttribute("boardNo", dto.getBoardNo());
			url = "redirect:/review/readPost?page="+page;
		}
		return url;
	}
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	public String fileUpload(ReviewFileBean filebean, HttpServletRequest request, Model model){
		
		String url ="review/upload_result";
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "/resources/upload/";
		MultipartFile upload = filebean.getUpload();
		String filename  = "";
		String CKEditorFuncNum = "";
		if(upload!=null){
			filename = upload.getOriginalFilename();
			filebean.setFilename(filename);
			CKEditorFuncNum = filebean.getCKEditorFuncNum();
			try {
				File file = new File(root_path + attach_path + filename);
				upload.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			String file_path = attach_path + filename;
			model.addAttribute("file_path", file_path);
			model.addAttribute("filename", filename);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		}
		return url;
		
	}
	
	@RequestMapping(value = "/readPost", method={RequestMethod.GET, RequestMethod.POST})
	public String readPost(@RequestParam("boardNo") int boardNo, 
							@RequestParam(value = "categoryCode", defaultValue="0") String categoryCode,
						   @RequestParam(value="page", defaultValue="1") int page,
						   HttpSession session,
						   Model model){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		String url = null;
		BoardDTO dto = service.selectToRead(boardNo);
		MemberDTO member = null;
		//user like status like
		if(isLogin){
			member = (MemberDTO)session.getAttribute("member");
			ActUserDTO aDTO = new ActUserDTO(member.getEmail(), ActUserManager.REVIEW, dto.getBoardNo());
			dto= new ActUserManager(aService).checkReLikeStatus(aDTO, dto);
		}
		List<CommentDTO> cList = cService.getAllComment(boardNo);
		int numOfCmt = cService.countCmt(boardNo);
		
		BoardDTO bDTO1 = service.searchPrev(boardNo);
		String prevTitle= "";
		if(bDTO1!=null){
			prevTitle = bDTO1.getTitle();
		}else{
			prevTitle = "(이전 글이 없습니다.)";
		}
		
		BoardDTO bDTO2 = service.searchNext(boardNo);
		String nextTitle= "";
		if(bDTO2!=null){
			nextTitle = bDTO2.getTitle();
		}else{
			nextTitle = "(다음 글이 없습니다.)";
		}
		
		//글쓴이 닉네임으로 프로필 불러오기
		//글쓴이 닉넴 -> 이메일 찾고(사인업) -> 프로필에서 찾기
		MyPageDTO mDTO = service.getWriter(dto.getNickname());
		
		model.addAttribute("numOfCmt", numOfCmt);
		model.addAttribute("dto", dto);
		model.addAttribute("cList", cList);
		model.addAttribute("page", page);
		model.addAttribute("prevTitle", prevTitle);
		model.addAttribute("nextTitle",nextTitle);
		model.addAttribute("profile",mDTO);
		
		url = "review/read_review";
		return url;
	}
	
	@RequestMapping(value="/clickModify", method={RequestMethod.POST, RequestMethod.GET})
	public String clickModify(@RequestParam("boardNo") int boardNo, Model model, HttpSession session){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		BoardDTO dto = service.selectToRead(boardNo);
		model.addAttribute("dto", dto);
		String url = "review/review_regist";
		return url;
	}
	
	
	@RequestMapping(value="/delete", method={RequestMethod.POST,RequestMethod.GET})
	public String delete(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
			@RequestParam(value="mylisting", defaultValue="0") int mylisting,
			@RequestParam(value="category", defaultValue="0") int category){
		String url = null; 
		boolean flag = service.remove(boardNo);
		if(flag){
			url = "redirect:/review/viewReviewList?page="+page;
			if(mylisting==1){
				url = "redirect:/mypage/viewMypageList";
			}else if(category!=0){
				url = "redirect:/mypage/viewMypageList?category="+category;
			}
		}
		return url;
	}
	

	@RequestMapping(value="/newCmt", method={RequestMethod.GET, RequestMethod.POST})
	public String comment(CommentDTO cDTO,
						  @RequestParam("boardNo") int boardNo, 
						  @RequestParam(value="page", defaultValue="1") int page,
						  Model model){
		String url = null;
		cDTO.setGroupNo(boardNo);
		boolean flag = cService.addComment(cDTO); 

		if(flag){
			model.addAttribute("boardNo", boardNo);
			model.addAttribute("page", page);
			
			url = "redirect:/review/readPost";
		}
		return url;	
	}

	@RequestMapping(value="/modifyCmt", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyCmt(BoardDTO dto, CommentDTO cDTO,  
							@RequestParam("boardNo") int boardNo,
							@RequestParam("commentNo") int commentNo,
							@RequestParam(value="page", defaultValue="1") int page,
							Model model, 
							HttpSession session){
		
		dto = service.selectToRead(boardNo);
		int numOfCmt = cService.countCmt(boardNo);
		List<CommentDTO> cList = cService.getAllComment(boardNo);
		
		boolean isLogin = new LoginFilter().isLogin(session, model);

		model.addAttribute("cList", cList);
		model.addAttribute("numOfCmt", numOfCmt);
		model.addAttribute("dto", dto);
		model.addAttribute("modifyNo", commentNo);
		
		String url = "review/cmt_modify";

		return url;
	}
	
	@RequestMapping(value="/updateCmt", method=RequestMethod.POST)
	public String updateCmt(BoardDTO dto, CommentDTO cDTO,  
			@RequestParam("boardNo") int boardNo,
			@RequestParam("commentNo") int commentNo,
			@RequestParam(value="page", defaultValue="1") int page,
			Model model, 
			HttpSession session){
		boolean flag = cService.updateCmt(cDTO);
		if(flag){
			model.addAttribute("boardNo", boardNo);
			model.addAttribute("page", page);
		}
		String url = "redirect:/review/readPost";
		return url;
	}
	
	@RequestMapping(value="/deleteCmt", method=RequestMethod.POST)
	public String deleteCmt(@RequestParam("commentNo") int commentNo,
							@RequestParam("boardNo") int boardNo,
							@RequestParam(value="page", defaultValue="1") int page,
							Model model){
		String url = "";
		boolean flag = cService.removeCmt(commentNo);
		if(flag){
			model.addAttribute("boardNo", boardNo);
			model.addAttribute("page", page);
			url = "redirect:/review/readPost";
		}
		return url;
	}
	
	@RequestMapping(value="/updateLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateLike(
							 @RequestParam("like") String like,
							 @RequestParam("boardNo") int boardNo,
							 @RequestParam("email") String email){
		int data = 0;
		ActUserManager manager = new ActUserManager(aService);
		ActUserDTO dto = new ActUserDTO(email, ActUserManager.REVIEW, boardNo);
		boolean flag = false;
		if(like.equals("like-icon")){
			flag = manager.registLikeStatus(dto);
			if(!flag){
				System.out.println("insert fail: ReviewLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = manager.deleteLikeStatus(dto);
			if(!flag){
				System.out.println("delete fail: ReviewLike");
			}
		}
		data = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.REVIEW, boardNo));
		return data;
	}
	
	@RequestMapping(value="/updateDetailPageLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateDetailPageLike(
							 @RequestParam("like") String like,
							 @RequestParam("locationSeq") int locationSeq,
							 @RequestParam("email") String email){
		boolean flag = false;
		int data = 0;
		ActUserManager manager = new ActUserManager(aService);
		ActUserDTO dto = new ActUserDTO(email, ActUserManager.SHOP, locationSeq);
		if(like.equals("like-icon")){
			flag = manager.registLikeStatus(dto);
			if(!flag){
				System.out.println("insert fail: DetailPageLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = manager.deleteLikeStatus(dto);
			if(!flag){
				System.out.println("delete fail: DetailPageLike");
			}
		}
		data = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.SHOP, locationSeq));
		return data;
	}
	
	@RequestMapping(value="/updateEventLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateEventLike(
							 @RequestParam("like") String like,
							 @RequestParam("eventNo") int eventNo,
							 @RequestParam("email") String email){
		int data = 0;
		ActUserManager manager = new ActUserManager(aService);
		ActUserDTO dto = new ActUserDTO(email, ActUserManager.EVENT, eventNo);
		boolean flag = false;
		if(like.equals("like-icon")){
			flag = manager.registLikeStatus(dto);
			if(!flag){
				System.out.println("insert fail: ReviewLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = manager.deleteLikeStatus(dto);
			if(!flag){
				System.out.println("delete fail: ReviewLike");
			}
		}
		data = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, eventNo));
		System.out.println("좋아요개수: " + data);
		return data;
	}
	
	@RequestMapping(value="/updateEventDetailLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateEventDetailLike(
							 @RequestParam("like") String like,
							 @RequestParam("eventNo") int eventNo,
							 @RequestParam("email") String email){
		boolean flag = false;
		int data = 0;
		ActUserManager manager = new ActUserManager(aService);
		ActUserDTO dto = new ActUserDTO(email, ActUserManager.EVENT, eventNo);
		if(like.equals("like-icon")){
			flag = manager.registLikeStatus(dto);
			if(!flag){
				System.out.println("insert fail: DetailPageLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = manager.deleteLikeStatus(dto);
			if(!flag){
				System.out.println("delete fail: DetailPageLike");
			}
		}
		data = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, eventNo));
		return data;
	}
	
	
	@RequestMapping(value = "viewSearchShop", method = RequestMethod.GET)
	public String viewSearchShop(HttpSession session, Model model){
		String url = "review/search_shop";
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("map");
		if(map!=null){
			List<LocationDTO> list = (List<LocationDTO>)map.get("list");
			List<EventDTO> eList = (List<EventDTO>)map.get("eList");
			String categories = (String)map.get("categories");
			String searchWord = (String)map.get("searchWord");
			
			if(list!=null){
				model.addAttribute("list", list);
			}
			if(eList!=null){
				model.addAttribute("eList", eList);
			}
			model.addAttribute("categories", categories);
			model.addAttribute("searchWord", searchWord);
			session.removeAttribute("map");
		}
		return url;
	}
	
	@RequestMapping(value = "getSearhShopname", method = RequestMethod.POST)
	public String getSearhShopname(@RequestParam(value = "searchWord") String searchWord, @RequestParam(value = "categories") String categories, 
			Model model,  HttpSession session){
		String url = "redirect:/review/viewSearchShop";
		HashMap<String, Object> map = new HashMap<String, Object>();

		if(categories.equals("CARE")){
			List<LocationDTO> list = locService.getMapSearchData(searchWord);
			map.put("list", list);
		}else if(categories.equals("EVENT")){
			List<EventDTO> list = locService.getEventSearchData(searchWord);
			map.put("eList", list);
		}
		map.put("categories", categories);
		map.put("searchWord", searchWord);
		session.setAttribute("map", map);
		return url;
	}
	
	@RequestMapping(value="/prev", method=RequestMethod.GET)
	public String prev(@RequestParam("boardNo") int boardNo, @RequestParam(value="page", defaultValue="1") int page, Model model){
		String url = "redirect:/review/readPost";
		BoardDTO bDTO = service.searchPrev(boardNo);
		if(bDTO!=null){
			model.addAttribute("boardNo", bDTO.getBoardNo());
		}else{
			model.addAttribute("boardNo", boardNo);
		}
		model.addAttribute("page", page);
		return url;
	}
	
	@RequestMapping(value="/next", method=RequestMethod.GET)
	public String next(@RequestParam("boardNo") int boardNo, @RequestParam(value="page", defaultValue="1") int page, Model model){
		String url = "redirect:/review/readPost";
		BoardDTO bDTO= service.searchNext(boardNo);
		if(bDTO!=null){
			model.addAttribute("boardNo", bDTO.getBoardNo());
		}else{
			model.addAttribute("boardNo", boardNo);
		}
		model.addAttribute("page", page);
		
		return url;
	}
}
