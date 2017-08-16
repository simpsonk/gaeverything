package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BoardDAO;
import com.bitschool.dao.EventDetailDAO;
import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventCommentDTO;
import com.bitschool.dto.EventPhotoDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.utils.ActUserManager;

@Service
public class EventDetailService {

	@Inject
	private EventDetailDAO dao;
	
	@Inject
	private BoardDAO bdao;
	
	
	public EventDTO selectOne(int seq){
		EventDTO dto = null;
		try {
			dto = dao.selectOne(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean commentAdd(EventCommentDTO dto){
		boolean flag = false;
		try {
			flag = dao.commentAdd(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean photoAdd(EventPhotoDTO dto) {
		boolean flag = false;
		try {
			flag = dao.photoAdd(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	// 사진 갯수 보여주기
	public int photoCnt(int eventNo){
		int PCnt = 0;
		try {
			PCnt = dao.photoCnt(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return PCnt;
	}
		
	
	public List<EventCommentDTO> commentList(int eventNo){
		List<EventCommentDTO> dto = null;
		try {
			dto = dao.commentList(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean updatePhoto(MemberDTO member){
		boolean flag = false;
		try {
			flag = dao.updatePhoto(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<EventPhotoDTO> selectPhoto(int eventNo) {
		List<EventPhotoDTO> list = null;
		try {
			list = dao.selectPhoto(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean commentEdit(EventCommentDTO dto){
		boolean flag = false;
		try {
			flag = dao.commentEdit(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean commentDelete(EventCommentDTO dto){
		boolean flag = false;
		try {
			flag = dao.commentDelete(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	 
	public int countReviews(int eventNo){
		int count = 0;
		try {
			count = dao.countReviews(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<Double> getRatings(int eventNo){
		List<Double> ratings = null;
		try {
			ratings = dao.getRatings(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ratings;
	}	
	
	public List<Double> getReplyRatings(int eventNo){
		List<Double> ratings = null;
		try {
			ratings = dao.getReplyRatings(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ratings;
	}
	
	public double getAverageRatings(List<Double> ratings1, List<Double> ratings2){
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
	
	public int countReplies(int eventNo){
		int count = 0;
		try {
			count = dao.countReplies(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<BoardDTO> getReviews(int eventNo){
		List<BoardDTO> dto = null;
		try {
			dto = dao.getReviews(eventNo);
			int countCmt = 0;
			for(int i=0;i<dto.size();i++){
				countCmt = bdao.countCmt(dto.get(i).getBoardNo());
				dto.get(i).setNumOfCmt(countCmt);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public EventDTO getEventActUserResult(ActUserManager manager, EventDTO dto) {
		int countReview = this.countReviews(dto.getEventNo());	
		double averageRatings = this.getAverageRatings(this.getRatings(dto.getEventNo()),this.getReplyRatings(dto.getEventNo()));
		averageRatings=(Double.isNaN(averageRatings))?0:averageRatings;
		String temp = String.format("%.2f", averageRatings);
		
		int countRatings = this.getRatings(dto.getEventNo()).size()+this.getReplyRatings(dto.getEventNo()).size();
		int countReplies = this.countReplies(dto.getEventNo());
		int countLike = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, dto.getEventNo()));		
		dto.setActUserResult(countReview, temp, countRatings, countReplies, countLike);
		return dto;
	}
	
	public LocationDTO getNearbyActUserResult(ActUserManager manager, LocationDTO dto) {
		
		/*int countReview = this.countReviews(dto.getLocationSeq());	
		double averageRatings = this.getAverageRatings(this.getRatings(dto.getLocationSeq()),this.getReplyRatings(dto.getLocationSeq()));
		averageRatings=(Double.isNaN(averageRatings))?0:averageRatings;
		String temp = String.format("%.2f", averageRatings);
		
		int countRatings = this.getRatings(dto.getLocationSeq()).size()+this.getReplyRatings(dto.getLocationSeq()).size();
		int countReplies = this.countReplies(dto.getLocationSeq());
		int countLike = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.SHOP, dto.getLocationSeq()));*/
		
		dto.setAddedResult(dto.getScheduleAdded());
		
		return dto;
		
		/*int countReview = this.countReviews(dto.getEventNo());	
		double averageRatings = this.getAverageRatings(this.getRatings(dto.getEventNo()),this.getReplyRatings(dto.getEventNo()));
		averageRatings=(Double.isNaN(averageRatings))?0:averageRatings;
		String temp = String.format("%.2f", averageRatings);
		
		int countRatings = this.getRatings(dto.getEventNo()).size()+this.getReplyRatings(dto.getEventNo()).size();
		int countReplies = this.countReplies(dto.getEventNo());
		int countLike = manager.getLikeStatusCount(new ActUserDTO(ActUserManager.EVENT, dto.getEventNo()));		
		dto.setActUserResult(countReview, temp, countRatings, countReplies, countLike);
		return dto;*/
	}

	public List<EventDTO> getEventActUserResults(ActUserManager manager, List<EventDTO> list) {
		for(int i=0;i<list.size();i++){
			this.getEventActUserResult(manager, list.get(i));
		}
		return list;
	}
		
	public List<EventPhotoDTO> photoList(int seq){
		List<EventPhotoDTO> dto = null;
		try {
			dto = dao.photoList(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	//카페 장소정보를 다 가져옴 
	public List<LocationDTO> getAllCafe(){
		List<LocationDTO> list = null;
		try {
			list = dao.readAllCafe();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//전체 카페리스트 중 내 반경 몇km이내의 정보만 빼서 새 리스트에 저장함 
	public List<LocationDTO> getNearby(String lat, String lon) {
		List<LocationDTO> list = this.getAllCafe();
		List<LocationDTO> nList = new ArrayList<LocationDTO>();
		
		double startLat = Double.parseDouble(lat);
		double startLon = Double.parseDouble(lon);
		

		for(int i=0;i<list.size();i++){
			LocationDTO temp = list.get(i);
			double endLat = Double.parseDouble(temp.getLatitude());
			double endLon = Double.parseDouble(temp.getLongitude());
			double radius = this.distanceCalcu(startLat, startLon, endLat, endLon, "kilometer");
			if(!(radius>5)){
				nList.add(temp);
			}
		}
		return nList;
	}
	
	private double distanceCalcu(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
        return (dist);
    }
     
    // This function converts decimal degrees to radians
    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

	public List<LocationDTO> getNearbyActUserResults(ActUserManager manager, List<LocationDTO> list) {
		for(int i=0;i<list.size();i++){
			this.getNearbyActUserResult(manager, list.get(i));
		}
		return list;
	}

}
