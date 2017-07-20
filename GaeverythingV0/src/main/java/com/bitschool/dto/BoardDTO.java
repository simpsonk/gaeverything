package com.bitschool.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;

public class BoardDTO {
	
	private String boardCategory;
	private int boardNo;
	private String nickname;
	private String title;
	private double rating;
	private int countLike;
	private String message;
	private String onlyText;
	private String uploadImg;
	private Timestamp regiDate;
	private int readCount;
	private int groupNo;
	private int parentNo;
	private int orderNo;
	private int depth;
	private int numOfCmt;
	private String address;
	private String encodeUTF;
	
	public String getEncodeUTF() {
	      try {
	         this.encodeUTF = URLEncoder.encode(nickname, "UTF-8");
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
	      return encodeUTF;
	   }
	
	
	
	
	public double getRating() {
		return rating;
	}




	public void setRating(double rating) {
		this.rating = rating;
	}




	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	public void setEncodeUTF(String encodeUTF) {
		this.encodeUTF = encodeUTF;
	}
	
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getNumOfCmt() {
		return numOfCmt;
	}
	public void setNumOfCmt(int numOfCmt) {
		this.numOfCmt = numOfCmt;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}




	public String getUploadImg() {
		return uploadImg;
	}




	public void setUploadImg(String uploadImg) {
		this.uploadImg = uploadImg;
	}




	public String getOnlyText() {
		return onlyText;
	}




	public void setOnlyText(String onlyText) {
		this.onlyText = onlyText;
	}




	
	
	

}
