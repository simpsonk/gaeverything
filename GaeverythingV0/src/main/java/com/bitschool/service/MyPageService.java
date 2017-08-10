package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BoardDAO;
import com.bitschool.dao.MyPageDAO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;

@Service
public class MyPageService {
	
	@Inject
	private MyPageDAO mdao;
	
	@Inject
	private BoardDAO bdao;
	
	// 내가 리뷰쓴 곳 개수(맵디테일의 댓글 또는 리뷰게시판의 글) 가져오기 (중복X) 
	public int countLocReviews(String nickname){
		int count = 0;
		try {
			count = mdao.countLocReviews(nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	//북마크수 가져오기
	public int getTotalLike(int boardno){
		int like = 0;
		try {
			like = bdao.getTotalLike(boardno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return like;
	}
	
	// 내가 쓴 댓글(게시판리뷰)의 원글 제목 가져오기
	public String selectBoardTitle(int groupno){
		String title = null;
		try {
			title = mdao.selectBoardTitle(groupno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return title;
	}
	
	// 내가 쓴 댓글(게시판리뷰) 모아보기 
	public List<CommentDTO> selectMyBoardComments(String nickname){
		List<CommentDTO> list = null;
		try {
			list = mdao.selectMyBoardComments(nickname);
			for(int i=0;i<list.size();i++){
				String title = this.selectBoardTitle(list.get(i).getGroupNo());
				list.get(i).setTitle(title);
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}	
	
	// 상호명 지정해주기 위해 
	public String selectShopName(int locationSeq){
		String address = null;
		try {
			address = mdao.selectShopName(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}
	
	// 내가 쓴 댓글(맵디테일) 모아보기 
	public List<DetailCommentDTO> selectMyDetailComments(String nickname){
		List<DetailCommentDTO> list = null;
		try {
			list = mdao.selectMyDetailComments(nickname);
			for(int i=0;i<list.size();i++){
				list.get(i).setAddress(this.selectShopName(list.get(i).getLocationSeq()));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}	
	
	// 내가 쓴 리뷰 모아보기 
	public List<BoardDTO> selectMyReviews(String nickname){
		List<BoardDTO> list = null;
		try {
			list = mdao.selectMyReviews(nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//photo 수정시 memberDTO의 photo도 바뀌도록
	public boolean updateMemData(MyPageDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = mdao.modifyMemData(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	//회원정보 수정(photo는 수정하지 않을 때)
	public boolean updateData2(MyPageDTO member){
		System.out.println("MyPageService-updateData2에 들어왔다");
		boolean flag = false;
		try {
			flag = mdao.modifyData2(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	//회원정보 수정
	public boolean updateData(MyPageDTO member) {
		// TODO Auto-generated method stub
		System.out.println("MyPageService-updateData에 들어왔다");
		boolean flag = false;
		try {
			flag = mdao.modifyData(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
	
	//회원정보 불러오기
	public MyPageDTO readData(MemberDTO member){
		MyPageDTO mypage = null;
		try {
			mypage = mdao.selectData(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mypage;
	}


}
