package com.bitschool.dto;

import java.sql.Timestamp;

public class DetailCommentDTO {
	private int locationSeq;
	private int commentSeq;
	private String nickname;
	private String message;
	private double rating;
	private Timestamp regiDate;
	private String photo;
	
	//댓글모아보기할때 상호명을 보여주기위해
	private String address;
	//댓글쓴사람의 레벨을 표시하기위해
	private String gradename;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLocationSeq() {
		return locationSeq;
	}
	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}
	public int getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
		
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}	
	
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	@Override
	public String toString() {
		return "DetailCommentDTO [locationSeq=" + locationSeq + ", commentSeq=" + commentSeq + ", nickname=" + nickname
				+ ", message=" + message + ", rating=" + rating + ", regiDate=" + regiDate + ", photo=" + photo
				+ ", address=" + address + ", gradename=" + gradename + "]";
	}
	
}
