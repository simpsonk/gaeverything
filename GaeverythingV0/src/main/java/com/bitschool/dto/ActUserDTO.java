package com.bitschool.dto;

public class ActUserDTO {
	private int actNo;
	private String email;
	private int contentNo;
	private String actType;
	
	public ActUserDTO(){
		
	}
	
	public ActUserDTO(String email, String actType) {
		this.email = email;
		this.actType = actType;
	}
	
	
	public ActUserDTO(String email, String actType, int contentNo) {
		this.email = email;
		this.actType = actType;
		this.contentNo = contentNo;
	}
	
	public ActUserDTO(String actType, int contentNo) {
		this.actType = actType;
		this.contentNo = contentNo;
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

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getActType() {
		return actType;
	}

	public void setActType(String actType) {
		this.actType = actType;
	}

	@Override
	public String toString() {
		return "ActUserDTO [actNo=" + actNo + ", email=" + email + ", contentNo=" + contentNo + ", actType=" + actType
				+ "]";
	}	
}
