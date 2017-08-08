package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventCommentDTO;
import com.bitschool.dto.EventPhotoDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.MemberDTO;

@Repository
public class EventDetailDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.bitschool.event.eventDetail";
	
	//eventNo로 한 장소의 DTO 받아오기 
		public EventDTO selectOne(int seq) throws SQLException{
			// TODO Auto-generated method stub
			EventDTO dto = null;
			dto = session.selectOne(namespace+".selectOne",seq);
			return dto;
		}
		
		// 디테일페이지 댓글 작성 
		public boolean commentAdd(EventCommentDTO dto) throws SQLException{
			// TODO Auto-generated method stub
			boolean flag = false;
			int aCnt = session.insert(namespace+".commentAdd",dto);
			if(aCnt>0){
				flag = true;
			}
			return flag;
		}	
		// 디테일페이지 사진 등록 
		public boolean photoAdd(EventPhotoDTO dto) throws SQLException {
			// TODO Auto-generated method stub
			boolean flag = false;
			int aCnt = session.insert(namespace + ".photoAdd", dto);
			if (aCnt > 0) {
				flag = true;
			}
			return flag;
		}

		// 사진 보여주기
		public List<EventPhotoDTO> selectPhoto(int eventNo) throws SQLException {
			// TODO Auto-generated method stub
			List<EventPhotoDTO> list = null;
			list = session.selectList(namespace + ".selectPhoto", eventNo);
			return list;
		}
		// 사진 갯수 보여주기
		public int photoCnt(int eventNo) throws SQLException{
			int PCnt = 0;
			PCnt = session.selectOne(namespace+".photoCnt", eventNo);
			return PCnt;
		}
			

		// 디테일페이지 댓글 리스팅 
		public List<EventCommentDTO> commentList(int locseq) throws SQLException{
			// TODO Auto-generated method stub
			List<EventCommentDTO> dto = null;
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
		public boolean commentEdit(EventCommentDTO dto) throws SQLException{
			boolean flag = false;
			int aCnt = session.update(namespace+".commentEdit",dto);
			if(aCnt>0){
				flag = true;
			}
			return flag;
		}
		
		// 디테일페이지 댓글 삭제  
		public boolean commentDelete(EventCommentDTO dto) throws SQLException{
			boolean flag = false;
			int aCnt = session.update(namespace+".commentDelete",dto);
			if(aCnt>0){
				flag = true;
			}
			return flag;
		}
		
		/*// 게시판에서 작성한 리뷰 개수 가져오기 
		public int countReviews(int eventNo) throws SQLException{
			int count = 0;
			count = session.selectOne(namespace+".countReviews",eventNo);
			return count;
		}*/
		
		/*// 게시판에서 작성한 리뷰의 별점 가져오기 
		public List<Double> getRatings(int eventNo) throws SQLException{
			List<Double> ratings = null;
			ratings = session.selectList(namespace+".getRatings",eventNo);
			return ratings;
		}*/
		
		// 디테일페이지 댓글에서 작성한 별졈 가져오기 
		public List<Double> getReplyRatings(int eventNo) throws SQLException{
			List<Double> ratings = null;
			ratings = session.selectList(namespace+".getReplyRatings",eventNo);
			return ratings;
		}
		
		// 디테일페이지 댓글 개수 가져오기 
		public int countReplies(int eventNo) throws SQLException{
			int count = 0;
			count = session.selectOne(namespace+".countReplies",eventNo);
			return count;
		}
		
		/*// 게시판에서 작성한 리뷰 가져오기
		public List<BoardDTO> getReviews(int eventNo) throws SQLException{
			List<BoardDTO> dto = null;
			dto = session.selectList(namespace+".getReviews",eventNo);
			return dto;
		}*/
		
		/*// 해당 장소의 블로그 리뷰 불러오기
		public List<BlogDTO> getBlogReviews(int eventNo) throws SQLException{
			List<BlogDTO> dto = null;
			dto = session.selectList(namespace+".getBlogReviews",eventNo);
			return dto;
		}*/

		public List<EventPhotoDTO> photoList(int seq) throws SQLException{
			// TODO Auto-generated method stub
			List<EventPhotoDTO> dto = null;
			dto = session.selectList(namespace+".photoList",seq);
			return dto;
		}


}
