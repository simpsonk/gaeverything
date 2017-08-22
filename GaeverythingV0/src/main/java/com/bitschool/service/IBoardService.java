package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;

public interface IBoardService {
	
	public boolean insertPost(BoardDTO dto);
	public List<BoardDTO> getAllList();
	public List<BoardDTO> getPagedList(PageDTO dto);
	public BoardDTO selectToRead(int boardNo);
	public boolean updatePost(BoardDTO dto);
	public boolean remove(int boardNo);
	public List<BoardDTO> search(SearchDTO sDTO);
	public int getNumOfCmts(int boardNo);
	public int updateLike(int boardNo);
	public int dislike(int boardNo);
	public BoardDTO searchPrev(int boardNo);
	public BoardDTO searchNext(int boardNo);
	public MyPageDTO getWriter(String email);
	public List<BoardDTO> highReadcountReviews(BoardDTO board);
	public String selectNickname(int boardNo);

}
