package com.bitschool.dto;

public class ActUserDTO {
	private int actNo;
	private String email;
	private int boardNo;
	private int locationSeq;
	private String actType;
	
	public ActUserDTO(){
		
	}
	
	public ActUserDTO(String email, String actType, int boardNo,  int locationSeq) {
		this.email = email;
		this.actType = actType;
		this.boardNo = boardNo;
		this.locationSeq = locationSeq;
	}
	
	
	public int getLocationSeq() {
		return locationSeq;
	}

	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}

	public int getActNo() {
		return actNo;
	}
	public void setActNo(int actNo) {
		this.actNo = actNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getActType() {
		return actType;
	}
	public void setActType(String actType) {
		this.actType = actType;
	}

	@Override
	public String toString() {
		return "ActUserDTO [actNo=" + actNo + ", email=" + email + ", boardNo=" + boardNo + ", locationSeq="
				+ locationSeq + ", actType=" + actType + "]";
	}
	
}
