package com.bitschool.dto;

import java.util.List;

public class HomeListDTO {
	
	private int no;
	private String title;
	private String address;
	private String category;
	private double rating;
	private String content;
	private String regiDate;
	private int totalReview;
	private String avgRating;
	private int countLike;
	private String image;
	private String userLikeStatus;
	private String from;
	
	
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getUserLikeStatus() {
		return userLikeStatus;
	}
	public void setUserLikeStatus(String userLikeStatus) {
		this.userLikeStatus = userLikeStatus;
	}
	private List<HomeListDTO> list;
	

	public List<HomeListDTO> getList() {
		return list;
	}
	public void setList(List<HomeListDTO> list) {
		this.list = list;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public int getTotalReview() {
		return totalReview;
	}
	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
	}
	public String getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(String avgRating) {
		this.avgRating = avgRating;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	
	
	
}
