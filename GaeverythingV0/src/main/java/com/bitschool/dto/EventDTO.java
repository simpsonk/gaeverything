package com.bitschool.dto;


import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class EventDTO {
	
	private int eventNo;
	private String eventName;
	private String startDate;
	private String addDate;
	private String endDate;
	private String location;
	private String address;
	private String call;
	private String latitude;
	private String longitude;
	private String eventDetail;
	private String link;
	private String fee;
	private String discountInfo;
	private String regist;
	private String thumbnail;
	private String userLikeStatus;
	
	private int countLike;
	private String categoryCode;
	
	private int countReview;
	private String averageRatings;
	private int countRatings;
	private int countReplies;

	
	
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	
	

	public void setStartDate(String startDate) {
		this.startDate = startDate;
		this.setAddDate(startDate);
				
	}
	
	public String getStartDate() {
		return startDate;
		
	}
	
	
	public void setAddDate(String addDate) {
		//String date = this.getStartDate();
		String [] dates = addDate.split("-");
		//2017-08-17 =>>> 2017, 08, 17
		String date2 = dates[1] + "-" + dates[2] + "-" + dates[0];
		this.addDate = date2;
	}
	
	public String getAddDate() {
		return addDate;
	}
	
	
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	
	
	
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getEventDetail() {
		return eventDetail;
	}
	public void setEventDetail(String eventDetail) {
		this.eventDetail = eventDetail;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getDiscountInfo() {
		return discountInfo;
	}
	public void setDiscountInfo(String discountInfo) {
		this.discountInfo = discountInfo;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getUserLikeStatus() {
		return userLikeStatus;
	}
	public void setUserLikeStatus(String userLikeStatus) {
		this.userLikeStatus = userLikeStatus;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	
	
	
	public int getCountReview() {
		return countReview;
	}
	public void setCountReview(int countReview) {
		this.countReview = countReview;
	}
	public String getAverageRatings() {
		return averageRatings;
	}
	public void setAverageRatings(String averageRatings) {
		this.averageRatings = averageRatings;
	}
	public int getCountRatings() {
		return countRatings;
	}
	public void setCountRatings(int countRatings) {
		this.countRatings = countRatings;
	}
	public int getCountReplies() {
		return countReplies;
	}
	public void setCountReplies(int countReplies) {
		this.countReplies = countReplies;
	}
	public void setActUserResult(int countReview, String averageRatings, int countRatings, int countReplies, int countLike) {
		this.countReview = countReview ;
		this.averageRatings = averageRatings;
		this.countRatings = countRatings;
		this.countReplies = countReplies;
		this.countLike = countLike;
	}
	
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	
	
	
	
	@Override
	public String toString() {
		return "EventDTO [eventNo=" + eventNo + ", eventName=" + eventName + ", startDate=" + startDate + ", addDate="
				+ addDate + ", endDate=" + endDate + ", location=" + location + ", address=" + address + ", call="
				+ call + ", latitude=" + latitude + ", longitude=" + longitude + ", eventDetail=" + eventDetail
				+ ", link=" + link + ", fee=" + fee + ", discountInfo=" + discountInfo + ", regist=" + regist
				+ ", thumbnail=" + thumbnail + ", userLikeStatus=" + userLikeStatus + ", countLike=" + countLike
				+ ", categoryCode=" + categoryCode + ", countReview=" + countReview + ", averageRatings="
				+ averageRatings + ", countRatings=" + countRatings + ", countReplies=" + countReplies + "]";
	}
	
	
	
	

}
