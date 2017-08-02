package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
@Repository
public class LocationDetailDAO {
	
	@Inject
	private SqlSession session;
	
	private final static String namespace = "com.bitschool.bootstrap.LocationDetailMapper";
	
	
	//locationSeq로 한 장소의 DTO 받아오기 
	public LocationDTO selectOne(int seq) throws SQLException{
		// TODO Auto-generated method stub
		LocationDTO dto = null;
		dto = session.selectOne(namespace+".selectOne",seq);
		return dto;
	}
	
	// 디테일페이지 댓글 작성 
	public boolean commentAdd(DetailCommentDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".commentAdd",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}	
	// 디테일페이지 사진 등록 
	public boolean photoAdd(DetailPhotoDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace + ".photoAdd", dto);
		if (aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	// 사진 보여주기
	public List<DetailPhotoDTO> selectPhoto(int locationSeq) throws SQLException {
		// TODO Auto-generated method stub
		List<DetailPhotoDTO> list = null;
		list = session.selectList(namespace + ".selectPhoto", locationSeq);
		return list;
	}
	// 사진 갯수 보여주기
	public int photoCnt(int locationSeq) throws SQLException{
		int PCnt = 0;
		PCnt = session.selectOne(namespace+".photoCnt", locationSeq);
		return PCnt;
	}
		

	// 디테일페이지 댓글 리스팅 
	public List<DetailCommentDTO> commentList(int locseq) throws SQLException{
		// TODO Auto-generated method stub
		List<DetailCommentDTO> dto = null;
		dto = session.selectList(namespace+".commentList",locseq);
		return dto;
	}

	// 마이페이지에서 포토 수정시 댓글리스팅의 포토도 수정
	public boolean updatePhoto(MemberDTO member) throws SQLException{
		boolean flag = false;
		int aCnt = session.update(namespace+".updatePhoto",member);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	// 디테일페이지 댓글 수정  
	public boolean commentEdit(DetailCommentDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.update(namespace+".commentEdit",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	// 디테일페이지 댓글 삭제  
	public boolean commentDelete(DetailCommentDTO dto) throws SQLException{
		boolean flag = false;
		int aCnt = session.update(namespace+".commentDelete",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	
	// 게시판에서 작성한 리뷰 개수 가져오기 
	public int countReviews(int locationSeq) throws SQLException{
		int count = 0;
		count = session.selectOne(namespace+".countReviews",locationSeq);
		return count;
	}
	
	// 게시판에서 작성한 리뷰의 별점 가져오기 
	public List<Double> getRatings(int locationSeq) throws SQLException{
		List<Double> ratings = null;
		ratings = session.selectList(namespace+".getRatings",locationSeq);
		return ratings;
	}
	
	// 디테일페이지 댓글에서 작성한 별졈 가져오기 
	public List<Double> getReplyRatings(int locationSeq) throws SQLException{
		List<Double> ratings = null;
		ratings = session.selectList(namespace+".getReplyRatings",locationSeq);
		return ratings;
	}
	
	// 디테일페이지 댓글 개수 가져오기 
	public int countReplies(int locationSeq) throws SQLException{
		int count = 0;
		count = session.selectOne(namespace+".countReplies",locationSeq);
		return count;
	}
	
	// 게시판에서 작성한 리뷰 가져오기
	public List<BoardDTO> getReviews(int locationSeq) throws SQLException{
		List<BoardDTO> dto = null;
		dto = session.selectList(namespace+".getReviews",locationSeq);
		return dto;
	}
	
	// 해당 장소의 블로그 리뷰 불러오기
	public List<BlogDTO> getBlogReviews(int locationSeq) throws SQLException{
		List<BlogDTO> dto = null;
		dto = session.selectList(namespace+".getBlogReviews",locationSeq);
		return dto;
	}

}
