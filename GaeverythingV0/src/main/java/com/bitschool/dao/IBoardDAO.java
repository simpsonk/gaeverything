package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;

public interface IBoardDAO {
	

	
	public boolean addNewPost(BoardDTO dto) throws SQLException;
	public List<BoardDTO> readAll() throws SQLException;
	public BoardDTO readOnePost(int boardNo) throws SQLException;
	public boolean updateReadCount(int boardNo)throws SQLException;
	public boolean update(BoardDTO dto) throws SQLException;
	public boolean removePost(int boardNo) throws SQLException;
	public int getTotalNumber() throws SQLException;
	public List<BoardDTO> readPerPage(PageDTO page) throws SQLException;
	public List<BoardDTO> searchData(SearchDTO sDTO)throws SQLException;
	public int getSearchTotal(SearchDTO sDTO) throws SQLException;
	public boolean insertComment(CommentDTO cDTO) throws SQLException;
	public List<CommentDTO> readAllCmt(int boardNo) throws SQLException;
	
	
	//public CommentDTO oneCmt(int commentNo)throws SQLException;
	public boolean getOneCmt(CommentDTO cDTO) throws SQLException;
	public boolean updateCmt(CommentDTO cDTO) throws SQLException;
	public boolean removeCmt(int commentNo) throws SQLException;
	public int countCmt(int boardNo) throws SQLException ;
	public int countAllCmt(int boardNo) throws SQLException ;
	public boolean updateLike(int boardNo) throws SQLException;
	public int getTotalLike(int boardNo) throws SQLException;
	public boolean updateDislike(int boardNo)  throws SQLException;
	public BoardDTO getPrev(int boardNo) throws SQLException;
	public BoardDTO getNext(int boardNo) throws SQLException;


}
