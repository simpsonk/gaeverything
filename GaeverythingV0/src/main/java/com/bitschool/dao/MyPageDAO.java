package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.CommentDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;

@Repository
public class MyPageDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.bitschool.bootstrap.MyPageMapper";

	
	// 내가 쓴 댓글(게시판리뷰)의 원글 제목 가져오기
	public String selectBoardTitle(int groupno) throws SQLException{
		String title = null;
		title = session.selectOne(namespace+".selectBoardTitle",groupno);
		return title;
	}
 	
	// 내가 쓴 댓글(게시판리뷰) 모아보기 
	public List<CommentDTO> selectMyBoardComments(String nickname) throws SQLException{
		List<CommentDTO> list = null;
		list = session.selectList(namespace+".selectMyBoardComments",nickname);
		return list;
	}
	
	// 상호명 지정해주기 위해 
	public String selectShopName(int locationSeq) throws SQLException{
		String address = null;
		address = session.selectOne(namespace+".selectShopName",locationSeq);
		return address;
	}
		
	// 내가 쓴 댓글(맵디테일) 모아보기 
	public List<DetailCommentDTO> selectMyDetailComments(String nickname) throws SQLException{
		List<DetailCommentDTO> list = null;
		list = session.selectList(namespace+".selectMyDetailComments",nickname);
		return list;
	}	
	
	// 내가 쓴 리뷰 모아보기 
	public List<BoardDTO> selectMyReviews(String nickname) throws SQLException{
		List<BoardDTO> list = null;
		list = session.selectList(namespace+".selectMyReviews",nickname);
		return list;
	}
	
	public boolean modifyMemData(MyPageDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.update(namespace+".updateMem",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}	
	
	//회원가입 때 입력한 email을 mypage 테이블에 추가(SignUpService에서 호출)
	public boolean insertData(MemberDTO data) throws SQLException{
		boolean flag= false;
		int aCnt = session.insert(namespace+".insert", data);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	//수정(photo는 수정X)
	public boolean modifyData2(MyPageDTO member) throws SQLException{
		// TODO Auto-generated method stub
		System.out.println("MyPageDAO-modifyData2에 들어왔다");
		boolean flag = false;
		int aCnt = session.update(namespace+".update2",member);
		if(aCnt>0){
			flag = true;
		}
		System.out.println(flag);
		return flag;
	}
	
	//수정 
	public boolean modifyData(MyPageDTO member) throws SQLException{
		// TODO Auto-generated method stub
		System.out.println("MyPageDAO-modifyData에 들어왔다");
		boolean flag = false;
		int aCnt = session.update(namespace+".update",member);
		if(aCnt>0){
			flag = true;
		}
		System.out.println(flag);
		return flag;
	}
	
	//한명 불러오기
	public MyPageDTO selectData(MemberDTO member) throws SQLException{
		MyPageDTO mypage = null;
		mypage = session.selectOne(namespace+".selectOne", member);
		return mypage;
	}




}
