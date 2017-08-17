package com.bitschool.dto;

import java.sql.Timestamp;

public class CommentDTO {
	
	private int commentNo;
	private String userId;
	private String nicknameCmt;
	private String commentBody;
	private Timestamp regiDate;
	private int groupNo;
	private int parentNo;
	private int orderNo;
	private int depth;
	private int index;
	//내가쓴 댓글의 원글제목을 가져오기위해
	private String title;
	
	public CommentDTO(){
	}
	
	public CommentDTO(int groupNo, String nicknameCmt){
		this.groupNo = groupNo;
		this.nicknameCmt = nicknameCmt;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public CommentDTO(int boardNo){
		this.groupNo = boardNo;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	public String getNicknameCmt() {
		return nicknameCmt;
	}

	public void setNicknameCmt(String nicknameCmt) {
		this.nicknameCmt = nicknameCmt;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getCommentBody() {
		return commentBody;
	}
	public void setCommentBody(String commentBody) {
		this.commentBody = commentBody;
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
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	@Override
	public String toString() {
		return "CommentDTO [commentNo=" + commentNo + ", userId=" + userId + ", nicknameCmt=" + nicknameCmt
				+ ", commentBody=" + commentBody + ", regiDate=" + regiDate + ", groupNo=" + groupNo + ", parentNo="
				+ parentNo + ", orderNo=" + orderNo + ", depth=" + depth + ", index=" + index + "]";
	}


	
	
	
	
	
	

}
