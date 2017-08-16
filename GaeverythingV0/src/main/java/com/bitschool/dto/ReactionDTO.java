package com.bitschool.dto;

public class ReactionDTO {
	private int reactionSeq;
	private String type;
	private int groupNo;
	private String nicknameReact;
	
	//장소 이름 셋팅해주기위해
	private String title;


	

	public ReactionDTO() {
     
    }
	
	public ReactionDTO(String type, int groupNo, String nicknameReact) {
        this.type = type;
        this.groupNo = groupNo;
        this.nicknameReact = nicknameReact;
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
	public String getNicknameReact() {
		return nicknameReact;
	}

	public void setNicknameReact(String nicknameReact) {
		this.nicknameReact = nicknameReact;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
