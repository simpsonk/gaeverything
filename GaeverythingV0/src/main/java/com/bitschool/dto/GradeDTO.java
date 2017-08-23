package com.bitschool.dto;

public class GradeDTO {
	private int gradeSeq;
	private String nickname;
	private String type;
	private int point;
	private int total;
	private String grade;
	
	public GradeDTO(){
		
	}
	
	public GradeDTO(String nickname){
		this.nickname = nickname;
	}
	
	public GradeDTO(String nickname, String type, int point){
		this.nickname = nickname;
		this.type = type;
		this.point = point;
	}
	
	public int getGradeSeq() {
		return gradeSeq;
	}
	public void setGradeSeq(int gradeSeq) {
		this.gradeSeq = gradeSeq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "GradeDTO [gradeSeq=" + gradeSeq + ", nickname=" + nickname + ", type=" + type + ", point=" + point
				+ ", total=" + total + ", grade=" + grade + "]";
	}
	
}
