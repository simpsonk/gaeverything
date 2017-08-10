package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PageDTO;
import com.bitschool.dto.SearchDTO;

@Repository
public class BoardDAO implements IBoardDAO{

	@Inject
	private SqlSession session;
	
	private static String nameSpace = "com.bitschool.Board.BoardMapper";
	
	@Override
	public boolean addNewPost(BoardDTO dto) throws SQLException {
		System.out.println("dao: insert");
		boolean flag = false;
		int affected = session.insert(nameSpace+".add", dto);
		if(affected > 0){
			flag = true;
			System.out.println("flag:" + flag);
		}
		return flag;
	}

	@Override
	public List<BoardDTO> readAll() throws SQLException {
		List<BoardDTO> list = session.selectList(nameSpace+".readAll");
		return list;
	}
	
	@Override
	public boolean updateReadCount(int boardNo) throws SQLException {
		boolean flag = false;
		int affected = session.update(nameSpace+".readCount", boardNo);
		if(affected > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public BoardDTO readOnePost(int boardNo) throws SQLException {
		System.out.println("dao: read");
		BoardDTO dto = session.selectOne(nameSpace+".readOne", boardNo);
		System.out.println("dao: finished reading");
		return dto;
	}

	@Override
	public boolean update(BoardDTO dto)throws SQLException {
		boolean flag = false;
		int affected = session.update(nameSpace+".modify", dto);
		System.out.println("dao modify:" + affected);
		if(affected>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean removePost(int boardNo) throws SQLException {
		boolean flag = false;
		int affected = session.delete(nameSpace+".remove", boardNo);
		if(affected>0){
			flag = true;
			System.out.println("remove dao:" + flag);
		}
		return flag;
	}

	@Override
	public int getTotalNumber(PageDTO pDTO) throws SQLException {
		int total = session.selectOne(nameSpace+".getTotal", pDTO);
		return total;
	}

	@Override
	public List<BoardDTO> readPerPage(PageDTO pDTO) throws SQLException {
		System.out.println("BoardDAO->pageDTO:"+pDTO);
		List<BoardDTO> list = session.selectList(nameSpace+".perPage", pDTO);
		return list;
	}

	@Override
	public List<BoardDTO> searchData(SearchDTO sDTO) throws SQLException {
		List<BoardDTO> list = session.selectList(nameSpace+".search", sDTO);
		return list;
	}

	@Override
	public int getSearchTotal(SearchDTO sDTO) throws SQLException {
		int totalSearch = session.selectOne(nameSpace+".countSearch", sDTO);
		return totalSearch;
	}

	@Override
	public boolean insertComment(CommentDTO cDTO) throws SQLException{
		boolean flag = false;
		int affected = session.insert(nameSpace+".insertCmt", cDTO);
		if(affected>0){
			flag = true;
			System.out.println("�뙎湲��엯�젰dao:" + flag);
		}
		return flag;
	}

	@Override
	public List<CommentDTO> readAllCmt(int boardNo) throws SQLException {
		List<CommentDTO> cList = session.selectList(nameSpace+".allCmt", boardNo);
		return cList;
	}

	@Override
	public boolean getOneCmt(CommentDTO cDTO) throws SQLException {
		int commentNo = 0;
		//CommentDTO cmt = null;
		boolean flag = false;
		commentNo = session.selectOne(nameSpace+".getOneCmt", cDTO);
		if(commentNo>0){
			flag = this.updateCmt(cDTO);
		}
		return flag;
	}

	@Override
	public boolean updateCmt(CommentDTO cDTO) throws SQLException {
		boolean flag = false;
		//List<CommentDTO> cList = null;
		int affected = session.update(nameSpace+".modifyCmt", cDTO);
		if(affected>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean removeCmt(int commentNo) throws SQLException {
		boolean flag = false;
		int affected = session.delete(nameSpace+".deleteCmt", commentNo);
		if(affected>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public int countCmt(int boardNo) throws SQLException {
		int cnt = 0;
		cnt = session.selectOne(nameSpace+".countCmt", boardNo);
		return cnt;
	}

	@Override
	public int countAllCmt(int boardNo) throws SQLException  {
		int totalCmt = session.selectOne(nameSpace+".totalNumOfCmt", boardNo);
		return totalCmt;	
	}

	@Override
	public boolean updateLike(int boardNo) throws SQLException {
		boolean flag = false;
		int affected = session.update(nameSpace+".updateLike", boardNo);
		if(affected > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public int getTotalLike(int boardNo) throws SQLException {
		int totalLike = session.selectOne(nameSpace+".getAllLike", boardNo);
		return totalLike;
	}

	@Override
	public boolean updateDislike(int boardNo) throws SQLException{
		boolean flag = false;
		int affected = session.update(nameSpace+".updateDislike", boardNo);
		if(affected > 0){
			flag = true;
		}
		return flag;
		
	}

	@Override
	public BoardDTO getPrev(int boardNo) throws SQLException{
		int num = session.selectOne(nameSpace+".prevNum", boardNo);
		System.out.println("현재글번호의 num:"+ num);
		BoardDTO bDTO = null;
		if(num!=1){
			bDTO = session.selectOne(nameSpace+".readPrev", num);
		}
		
	//	System.out.println("이전글 보드넘버:" + preBoardNo);
		return bDTO;
	}
	
	@Override
	public BoardDTO getNext(int boardNo) throws SQLException{
		int num = session.selectOne(nameSpace+".nextNum", boardNo);
		System.out.println("현재글번호의 num:"+ num);
		BoardDTO bDTO = session.selectOne(nameSpace+".readNext", num);
		//System.out.println("다음글 보드넘버:" + preBoardNo);
		return bDTO;
	}

	@Override
	public String readEmail(String nickName) throws SQLException {
		 String email = session.selectOne(nameSpace+".findEmail", nickName);
		return email;
	}

	@Override
	public MyPageDTO readProfile(String email) {
		MyPageDTO dto = session.selectOne(nameSpace+".profile", email);
		return dto;
	}

}
