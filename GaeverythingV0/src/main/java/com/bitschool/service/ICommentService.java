package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.CommentDTO;

public interface ICommentService {

	public boolean addComment(CommentDTO cDTO);
	public List<CommentDTO> getAllComment(int boardNo);
	
	
	//public CommentDTO selectOneCmt();
	
	public boolean updateCmt(CommentDTO cDTO);
	public boolean removeCmt(int commentNo);
	public int countCmt(int boardNo);
	public CommentDTO getFullCmt(int commentNo);

}
