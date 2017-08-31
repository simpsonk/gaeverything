package com.bitschool.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IBoardDAO;
import com.bitschool.dao.ReactionDAO;
import com.bitschool.dao.SignUpDAO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.ReactionDTO;

@Service
public class CommentService implements ICommentService{

	@Inject
	private IBoardDAO dao;
	
	@Inject
	private ReactionDAO rdao;
	
	@Inject
	private SignUpDAO sDao;
	
	@Override
	public boolean addComment(CommentDTO cDTO) {
		boolean flag = false;
		try {
			flag = dao.insertComment(cDTO);
			ReactionDTO rdto = new ReactionDTO("C",cDTO.getGroupNo(),cDTO.getNicknameCmt());
			rdao.insertReaction(rdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<CommentDTO> getAllComment(int boardNo) {
		List<CommentDTO> cList= null;
		
		try {
			cList = dao.readAllCmt(boardNo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}

	@Override
	public boolean updateCmt(CommentDTO cDTO) {
		boolean flag = false;
		try {
			flag = dao.updateCmt(cDTO); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean removeCmt(int commentNo) {
		boolean flag = false;
		try {
			//댓글 삭제하면 대시보드의 reaction에서도 사라지도록///
			CommentDTO cDTO = this.getFullCmt(commentNo);
			//System.out.println("cDTO :"+cDTO);
			ReactionDTO rdto = new ReactionDTO("C",cDTO.getGroupNo(),cDTO.getNicknameCmt());
			rdao.deleteReaction(rdto);
			
			//진짜 댓글 삭제
			flag = dao.removeCmt(commentNo);	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public int countCmt(int boardNo) {
		int numOfCmt = 0;
		try {
			numOfCmt = dao.countCmt(boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numOfCmt;
	}

	
	@Override
	public CommentDTO getFullCmt(int commentNo){
		CommentDTO dto = null;
		try {
			dto = dao.getFullCmt(commentNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<CommentDTO> getPhotoInfo(List<CommentDTO> cList) {
		try {
			for (int i = 0; i < cList.size(); i++) {
				String nickName = cList.get(i).getNicknameCmt();
				String photo = dao.findPhoto(nickName);
				cList.get(i).setPhoto(photo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	
	
	
}
