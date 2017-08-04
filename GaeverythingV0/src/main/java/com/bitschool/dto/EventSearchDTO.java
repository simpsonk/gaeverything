package com.bitschool.dto;

public class EventSearchDTO {

	private String opt;
	private String str;
	
	public EventSearchDTO(String opt, String str){
		this.opt = opt;
		this.str = str;
	}
	
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	
	
}
