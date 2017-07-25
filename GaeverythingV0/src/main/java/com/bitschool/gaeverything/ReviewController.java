package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.test.util.JsonExpectationsHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitschool.dao.ReviewFileBean;
import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.service.ActUserService;
import com.bitschool.service.IBoardService;
import com.bitschool.service.ICommentService;
import com.bitschool.service.IPagerService;
import com.bitschool.service.LocationService;
import com.bitschool.utils.ActUserManager;
import com.bitschool.utils.LoginFilter;
import com.fasterxml.jackson.core.JsonFactory;


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

	
	
	@RequestMapping(value = "/viewReviewList", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewReviewList(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page){
		
		//로그인 유지
		boolean isLogin = new LoginFilter().isLogin(session, model);
		
		//페이지 리스트
		int amount = 5;
		PageDTO pDTO = new PageDTO(page, amount);
		
		String pList = pService.pageList(pDTO);
		model.addAttribute("pList", pList);
		
		//게시물 리스트
		List<BoardDTO> list = service.getPagedList(pDTO); 
		model.addAttribute("page", page);
		
		//user like status like
		if(isLogin){
			list= new ActUserManager(aService).checkLikeStatus(session, list);
		}
		
		//댓글수 받기
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
	public String viewReviewRegist(HttpSession session, Model model){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		String url = "review/review_regist";
		return url;
	}
	
	@RequestMapping(value = "/newPost", method={RequestMethod.POST, RequestMethod.GET})
	public String newPost(BoardDTO dto, HttpSession session){
		String url = null;
		System.out.println(dto);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto.setNickname(member.getNickname());
		boolean flag = service.insertPost(dto);
		if(flag){
			url = "redirect:/review/viewReviewList";
		}
		return url;
	}
	
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modify(BoardDTO dto, Model model, @RequestParam("page") int page, @RequestParam("boardNo") int boardNo){
		System.out.println("modify controller");
		System.out.println("check:"+dto);
		String url = null;
		dto.setBoardNo(boardNo);
		boolean flag = service.updatePost(dto);
		System.out.println("dao result: "+ flag);
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
		System.out.println(upload);
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
			System.out.println("파일명:" + filename);
			model.addAttribute("file_path", file_path);
			model.addAttribute("filename", filename);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		}
		return url;
		
	}
	
	@RequestMapping(value = "/readPost", method={RequestMethod.GET, RequestMethod.POST})
	public String readPost(@RequestParam("boardNo") int boardNo, 
						   HttpSession session,
						   Model model){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		String url = null;
		
		System.out.println("read post ");
		BoardDTO dto = service.selectToRead(boardNo);

		//user like status like
		if(isLogin){
			dto= new ActUserManager(aService).checkLikeStatus(session, dto);
		}
		

		List<CommentDTO> cList = cService.getAllComment(boardNo);
		int numOfCmt = cService.countCmt(boardNo);


		model.addAttribute("numOfCmt", numOfCmt);
		model.addAttribute("dto", dto);
		model.addAttribute("cList", cList);

		System.out.println(cList);
		System.out.println("댓글목록 받음");
		url = "review/read_review";
		return url;
	}
	
	@RequestMapping(value="/clickModify", method={RequestMethod.POST, RequestMethod.GET})
	public String clickModify(@RequestParam("boardNo") int boardNo, Model model, HttpSession session){
		boolean isLogin = new LoginFilter().isLogin(session, model);
		BoardDTO dto = service.selectToRead(boardNo);
		model.addAttribute("dto", dto);
		System.out.println(dto);
		String url = "review/review_regist";
		return url;
	}
	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page){
		String url = null; 
		System.out.println("delete controller");
		boolean flag = service.remove(boardNo);
		if(flag){
			url = "redirect:/review/viewReviewList?page="+page;
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
		System.out.println(cDTO.toString());

		if(flag){
			System.out.println("댓글추가결과 컨트롤러: " + flag);
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
		
		System.out.println("수정댓글넘버:" + commentNo);
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
							 HttpSession session){
		int data = 0;
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		ActUserDTO dto = new ActUserDTO(member.getEmail(), "00", boardNo, 0);
		if(like.equals("like-icon")){
			new ActUserManager(aService).registLikeStatus(dto);
			data = service.updateLike(boardNo);
		}else if(like.equals("like-icon liked")){
			new ActUserManager(aService).dropLikeStatus(dto);
			data = service.dislike(boardNo);
		}
		return data;
	}
	
	@RequestMapping(value="/updateDetailPageLike", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int updateDetailPageLike(
							 @RequestParam("like") String like,
							 @RequestParam("locationSeq") int locationSeq,
							 HttpSession session){
		boolean flag = false;
		int data = 0;
		if(like.equals("like-icon")){
			flag = new ActUserManager(aService).registDetailPageLikeStatus(session, locationSeq);
			if(!flag){
				System.out.println("insert fail: DetailPageLike");
			}
		}else if(like.equals("like-icon liked")){
			flag = new ActUserManager(aService).dropDetailPageLikeStatus(session, locationSeq);
			if(!flag){
				System.out.println("delete fail: DetailPageLike");
			}
		}
		data = new ActUserManager(aService).LikeStatusCount("10");
		return data;
	}
	
	@RequestMapping(value = "viewSearchShop", method = RequestMethod.GET)
	public String viewSearchShop(HttpSession session, Model model){
		String url = "review/search_shop";
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("map");
		if(map!=null){
			List<LocationDTO> list = (List<LocationDTO>)map.get("list");
			HashMap<String, Object> searchData = (HashMap<String, Object>)map.get("searchData");
			model.addAttribute("list", list);
			model.addAttribute("searchData", searchData);
			session.removeAttribute("map");
		}
		return url;
	}
	
	@RequestMapping(value = "getSearhShopname", method = RequestMethod.POST)
	public String getSearhShopname(@RequestParam(value = "searchWord") String searchWord, @RequestParam(value = "selectOp1") String selectOp1, 
			@RequestParam(value = "selectOp2") String selectOp2, Model model,  HttpSession session){
		String url = "redirect:/review/viewSearchShop";
		HashMap<String, Object> searchData = new HashMap<String, Object>();
		
		searchData.put("searchWord", searchWord);
		searchData.put("selectOp1", selectOp1);
		searchData.put("selectOp2", selectOp2);
		
		List<LocationDTO> list = locService.getSearchData(searchData);
		System.out.println(list);
		System.out.println(searchData);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchData", searchData);
		session.setAttribute("map", map);
		return url;
	}
}
