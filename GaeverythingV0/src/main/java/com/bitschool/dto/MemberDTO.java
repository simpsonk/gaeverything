package com.bitschool.dto;

public class MemberDTO {
	private int memberNo;
	private String email;
	private String nickname;
	private String pw;
	private String photo;	
	
	private int myCommentSize;
	private int myReviewSize;
	private int bookmarkReviewSize;
	private int bookmarkMapSize;
	private int bookmarkEventSize;
	
	
	
	
	
	public int getMyCommentSize() {
		return myCommentSize;
	}
	public void setMyCommentSize(int myCommentSize) {
		this.myCommentSize = myCommentSize;
	}
	public int getMyReviewSize() {
		return myReviewSize;
	}
	public void setMyReviewSize(int myReviewSize) {
		this.myReviewSize = myReviewSize;
	}
	public int getBookmarkReviewSize() {
		return bookmarkReviewSize;
	}
	public void setBookmarkReviewSize(int bookmarkReviewSize) {
		this.bookmarkReviewSize = bookmarkReviewSize;
	}
	public int getBookmarkMapSize() {
		return bookmarkMapSize;
	}
	public void setBookmarkMapSize(int bookmarkMapSize) {
		this.bookmarkMapSize = bookmarkMapSize;
	}
	public int getBookmarkEventSize() {
		return bookmarkEventSize;
	}
	public void setBookmarkEventSize(int bookmarkEventSize) {
		this.bookmarkEventSize = bookmarkEventSize;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memberNo=" + memberNo + ", email=" + email + ", nickname=" + nickname + ", pw=" + pw
				+ ", photo=" + photo + "]";
	}		
	
}
