package com.bitschool.dto;

public class ActUserDTO {
	private int actNo;
	private String email;
	private int boardNo;
	private String actType;
	
	public ActUserDTO(){
		
	}
	
	public ActUserDTO(String email, int boardNo, String actType) {
		this.email = email;
		this.boardNo = boardNo;
		this.actType = actType;
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
		return "ActUserDTO [actNo=" + actNo + ", email=" + email + ", boardNo=" + boardNo + ", actType=" + actType
				+ "]";
	}
}
