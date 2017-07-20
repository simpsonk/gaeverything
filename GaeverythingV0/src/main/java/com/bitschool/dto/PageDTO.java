package com.bitschool.dto;

public class PageDTO {
	
	private int firstNo;
	private int lastNo;
	private int page;
	private int amount;
	
	
	public PageDTO(int page, int amount){
		this.page = page;
		this.amount = amount;
		this.firstNo = (page*amount)-amount+1;
		this.lastNo = (page*amount);
	}

	public int getFirstNo() {
		return firstNo;
	}

	public void setFirstNo(int firstNo) {
		this.firstNo = firstNo;
	}

	public int getLastNo() {
		return lastNo;
	}

	public void setLastNo(int lastNo) {
		this.lastNo = lastNo;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	

}
