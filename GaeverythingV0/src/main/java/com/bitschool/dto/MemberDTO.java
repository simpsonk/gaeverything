package com.bitschool.dto;

public class MemberDTO {
	private int memberNo;
	private String email;
	private String nickname;
	private String pw;
	private String photo;	
	
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
