package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.LocationDetailDAO;
<<<<<<< HEAD
import com.bitschool.dto.BlogDTO;
=======
import com.bitschool.dto.ActUserDTO;
>>>>>>> 6fdad2737a969940b342c7181d607b4fba1d4317
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.DetailCommentDTO;
import com.bitschool.dto.DetailPhotoDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.utils.ActUserManager;
@Service
public class LocationDetailService {

	
	@Inject
	private LocationDetailDAO dao;
	
	
	//locationSeqï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ DTO ï¿½Þ¾Æ¿ï¿½ï¿½ï¿½ 
	public LocationDTO selectOne(int seq){
		// TODO Auto-generated method stub
		LocationDTO dto = null;
		try {
			dto = dao.selectOne(seq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ 
	public boolean commentAdd(DetailCommentDTO dto){
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = dao.commentAdd(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ 
		public boolean photoAdd(DetailPhotoDTO dto){
			// TODO Auto-generated method stub
			boolean flag = false;
			try {
				flag = dao.photoAdd(dto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}
		
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 
	public List<DetailCommentDTO> commentList(int locseq){
		// TODO Auto-generated method stub
		List<DetailCommentDTO> dto = null;
		try {
			dto = dao.commentList(locseq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Û¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½äµµ ï¿½ï¿½ï¿½ï¿½
	public boolean updatePhoto(MemberDTO member){
		boolean flag = false;
		try {
			flag = dao.updatePhoto(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ö±ï¿½
			public List<DetailPhotoDTO> selectPhoto(int locationSeq) {
				// TODO Auto-generated method stub
				List<DetailPhotoDTO> list = null;
				try {
					list = dao.selectPhoto(locationSeq);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
			}
			
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½  
	public boolean commentEdit(DetailCommentDTO dto){
		boolean flag = false;
		try {
			flag = dao.commentEdit(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½  
	public boolean commentDelete(DetailCommentDTO dto){
		boolean flag = false;
		try {
			flag = dao.commentDelete(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	// ï¿½Ô½ï¿½ï¿½Ç¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 
	public int countReviews(int locationSeq){
		int count = 0;
		try {
			count = dao.countReviews(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	// ï¿½Ô½ï¿½ï¿½Ç¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ® ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 
	public List<Double> getRatings(int locationSeq){
		List<Double> ratings = null;
		try {
			ratings = dao.getRatings(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ratings;
	}	
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Û¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 
	public List<Double> getReplyRatings(int locationSeq){
		List<Double> ratings = null;
		try {
			ratings = dao.getReplyRatings(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ratings;
	}
	
	//ï¿½Ô½ï¿½ï¿½Ç¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Û¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Ï±ï¿½
	public double getAverageRatings(List<Double> ratings1,List<Double> ratings2){
		double average = 0;
		double sum1 = 0;
		double sum2 = 0;
		for(int i=0;i<ratings1.size();i++){
			sum1 = sum1 + ratings1.get(i);
		}
		for(int i=0;i<ratings2.size();i++){
			sum2 = sum2 + ratings2.get(i);
		}		
		average = (sum1+sum2)/(ratings1.size()+ratings2.size());
		return average;
	}
	
	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 
	public int countReplies(int locationSeq){
		int count = 0;
		try {
			count = dao.countReplies(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	// ï¿½Ô½ï¿½ï¿½Ç¿ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	public List<BoardDTO> getReviews(int locationSeq){
		List<BoardDTO> dto = null;
		try {
			dto = dao.getReviews(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	// ÇØ´ç Àå¼ÒÀÇ ºí·Î±× ¸®ºä ºÒ·¯¿À±â
	public List<BlogDTO> getBlogReviews(int locationSeq){
		List<BlogDTO> dto = null;
		try {
			dto = dao.getBlogReviews(locationSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}

	public LocationDTO getLocActUserResult(ActUserManager manager, LocationDTO dto) {
		// TODO Auto-generated method stub
		int countReview = this.countReviews(dto.getLocationSeq());	
		
		double averageRatings = this.getAverageRatings(this.getRatings(dto.getLocationSeq()),this.getReplyRatings(dto.getLocationSeq()));
		averageRatings=(Double.isNaN(averageRatings))?0:averageRatings;
		String temp = String.format("%.2f", averageRatings);
		
		int countRatings = this.getRatings(dto.getLocationSeq()).size()+this.getReplyRatings(dto.getLocationSeq()).size();
		int countReplies = this.countReplies(dto.getLocationSeq());
		int countLike = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.SHOP, dto.getLocationSeq()));
		
		dto.setActUserResult(countReview, temp, countRatings, countReplies, countLike);
		return dto;
	}

}
