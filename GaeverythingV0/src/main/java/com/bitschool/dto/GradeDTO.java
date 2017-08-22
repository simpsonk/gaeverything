package com.bitschool.dto;

public class GradeDTO {
	private int gradeSeq;
	private String nickname;
	private String resComment;
	private String resBookmark;
	private String myReview;
	private String myComment;
	private String myBookmark;
	private int point;
	private String grade;
	
	public GradeDTO(){
		
	}
	
	public GradeDTO(String nickname){
		this.nickname = nickname;
	}
	
	public GradeDTO(String nickname,String resComment,String resBookmark,String myReview, String myComment,String myBookmark){
		this.nickname = nickname;
		this.resComment = resComment;
		this.resBookmark = resBookmark;
		this.myReview = myReview;
		this.myComment = myComment;
		this.myBookmark = myBookmark;
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
	public String getResComment() {
		return resComment;
	}
	public void setResComment(String resComment) {
		this.resComment = resComment;
	}
	public String getResBookmark() {
		return resBookmark;
	}
	public void setResBookmark(String resBookmark) {
		this.resBookmark = resBookmark;
	}
	public String getMyReview() {
		return myReview;
	}
	public void setMyReview(String myReview) {
		this.myReview = myReview;
	}
	public String getMyComment() {
		return myComment;
	}
	public void setMyComment(String myComment) {
		this.myComment = myComment;
	}
	public String getMyBookmark() {
		return myBookmark;
	}
	public void setMyBookmark(String myBookmark) {
		this.myBookmark = myBookmark;
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
	
	@Override
	public String toString() {
		return "GradeDTO [gradeSeq=" + gradeSeq + ", nickname=" + nickname + ", resComment=" + resComment
				+ ", resBookmark=" + resBookmark + ", myReview=" + myReview + ", myComment=" + myComment
				+ ", myBookmark=" + myBookmark + ", point=" + point + ", grade=" + grade + ", getGradeSeq()="
				+ getGradeSeq() + ", getNickname()=" + getNickname() + ", getResComment()=" + getResComment()
				+ ", getResBookmark()=" + getResBookmark() + ", getMyReview()=" + getMyReview() + ", getMyComment()="
				+ getMyComment() + ", getMyBookmark()=" + getMyBookmark() + ", getPoint()=" + getPoint()
				+ ", getGrade()=" + getGrade() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
