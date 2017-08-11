package com.bitschool.dto;

public class CalendarFormat {

	private String id;
	private String title;
	private String start;
	private String end;
	private String color;
	private int seq;
	private String longitude;
	private String latitude;
	
	
	
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "CalendarFormat [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + ", color="
				+ color + ", seq=" + seq + ", longitude=" + longitude + ", latitude=" + latitude + "]";
	}
	
	
}
