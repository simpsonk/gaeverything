package com.bitschool.gaeverything;

import java.io.File;
import java.io.IOException;
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
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.service.IBoardService;
import com.bitschool.service.ICommentService;
import com.bitschool.service.IPagerService;
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
	
	
	@RequestMapping(value = "/viewReviewList", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewReviewList(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page){
		
		//페이지 리스트
		int amount = 5;
		PageDTO pDTO = new PageDTO(page, amount);
		String pList = pService.pageList(pDTO);
		model.addAttribute("pList", pList);
		
		//게시물 리스트
		System.out.println("page "+ page);
		List<BoardDTO> list = service.getPagedList(pDTO); 
	
		model.addAttribute("page", page);
		
		//int numOfCmt = cService.countCmt(boardNo);
		//model.addAttribute("numOfCmt", numOfCmt);
		
		
		//로그인 유지
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", member);
		
		
		//댓글수 받기
		int countCmts = 0;
		//수정한부분...
		//BoardDTO dto = null;
		for(int i=0; i<list.size(); i++){
			BoardDTO dto = list.get(i);
			countCmts = service.getNumOfCmts(dto.getBoardNo());
			list.get(i).setNumOfCmt(countCmts);
			//dto.setNumOfCmt(countCmts);
//			list.add(dto);
		}
		model.addAttribute("list", list);
		//model.addAttribute("encode", dto);
	
		String url = "review/review_list";
		return url;
	}
	
	@RequestMapping(value = "/viewReviewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewReviewRegist(HttpSession session, Model model){
		String url = "review/review_regist";
		
		boolean isLogin = new LoginFilter().isLogin(session, model);
		//System.out.println(isLogin);
	
		return url;
	}
	
	@RequestMapping(value = "/newPost", method={RequestMethod.POST,RequestMethod.GET })
	public String newPost(BoardDTO dto, ReviewFileBean filebean, HttpServletRequest request, Model model,
						  @RequestParam("boardCategory") String boardCategory){
		System.out.println("새글입력컨트롤러");
		System.out.println("파일명: " + dto.getUploadImg());
		//System.out.println("별점: " + dto.getRating());
		//System.out.println("카데고리:" + boardCategory);
		
		String url = null;
		System.out.println("글쓴이>>> " + dto.getNickname());
		boolean flag = service.insertPost(dto);
		
		if(flag){
			url = "redirect:/review/viewReviewList";
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
	/*		BoardDTO dto = new BoardDTO();
			dto.setUpload(filename);*/
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
		String url = null;
		System.out.println("read post ");
		
		BoardDTO dto = service.selectToRead(boardNo);
		List<CommentDTO> cList = cService.getAllComment(boardNo);
		int numOfCmt = cService.countCmt(boardNo);

		boolean isLogin = new LoginFilter().isLogin(session, model);

		model.addAttribute("numOfCmt", numOfCmt);
		model.addAttribute("dto", dto);
		
		model.addAttribute("cList", cList);
		//model.addAttribute("boardNo", boardNo);
	
		
		System.out.println(cList);
		System.out.println("댓글목록 받음");
		url = "review/read_review";
		return url;
	}
	
	@RequestMapping(value="/clickModify", method=RequestMethod.POST)
	public String clickModify(@RequestParam("boardNo") int boardNo, Model model){
		BoardDTO dto = service.selectToRead(boardNo);
		model.addAttribute("dto", dto);
		String url = "review/modify_content";
		return url;
	}
	
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modify(BoardDTO dto, Model model, @RequestParam("page") int page){
		System.out.println("modify controller");
		String url = null;
		boolean flag = service.updatePost(dto);
		System.out.println("dao result: "+ flag);
		if(flag){
			model.addAttribute("dto", dto);
			model.addAttribute("boardNo", dto.getBoardNo());
			url = "redirect:/review/readPost?page="+page;
		}
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
							 @RequestParam("boardNo") int boardNo){
		
		int data = 0;
		System.out.println("좋아요: "+ like);
		System.out.println("좋아요글번호: " + boardNo);
		if(like.equals("like-icon")){
			data = service.updateLike(boardNo);
		}else if(like.equals("like-icon liked")){
			data = service.dislike(boardNo);
		}
		return data;
	}

	
	
	
	
	
}
