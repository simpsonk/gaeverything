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
	@Override
	public String toString() {
		return "DetailCommentDTO [locationSeq=" + locationSeq + ", commentSeq=" + commentSeq + ", nickname=" + nickname
				+ ", message=" + message + ", rating=" + rating + ", regiDate=" + regiDate + ", photo=" + photo + "]";
	}



}
