package com.bitschool.dto;

public class ReactionDTO {
	private int reactionSeq;
	private String type;
	private int groupNo;
	
	public ReactionDTO(String type, int groupNo) {
        this.type = type;
        this.groupNo = groupNo;
    }
	
	public int getReactionSeq() {
		return reactionSeq;
	}
	public void setReactionSeq(int reactionSeq) {
		this.reactionSeq = reactionSeq;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	@Override
	public String toString() {
		return "ReactionDTO [reactionSeq=" + reactionSeq + ", type=" + type + ", groupNo=" + groupNo
				+ ", getReactionSeq()=" + getReactionSeq() + ", getType()=" + getType() + ", getGroupNo()="
				+ getGroupNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
