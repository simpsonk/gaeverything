package com.bitschool.dto;

import java.sql.Timestamp;

public class CalendarDTO {

	private int calendarseq;
	private String id;
	private int dogid;
	private String title;
	private String place;
	private String message;
	private String startTime;
	private String startDate;
	private String endTime;
	private String endDate;
	private String start;
	private String end;
	private String repeatdata;
	private String repeatview;
	private int locationseq;
	
	
	public int getLocationseq() {
		return locationseq;
	}

	public void setLocationseq(int locationseq) {
		this.locationseq = locationseq;
	}

	public int getCalendarseq() {
		return calendarseq;
	}

	public void setCalendarseq(int calendarseq) {
		this.calendarseq = calendarseq;
	}

	public String getRepeatview() {
		return repeatview;
	}

	public void setRepeatview(String repeatview) {
		this.repeatview = repeatview;
	}

	public String getRepeatdata() {
		return repeatdata;
	}

	public void setRepeatdata(String repeatdata) {
		this.repeatdata = repeatdata;
	}

	@Override
	public String toString() {
		return "CalendarDTO [seq=" + calendarseq + ", id=" + id + ", dogid=" + dogid + ", title=" + title + ", place=" + place
				+ ", message=" + message + ", startTime=" + startTime + ", startDate=" + startDate + ", endTime="
				+ endTime + ", endDate=" + endDate + ", start=" + start + ", end=" + end + "]";
	}

	public String getStart() {
		String date = null;

		if (!startTime.equals("")) {
			date = startDate + "T" + startTime;
		} else {
			date = startDate + "T00:00";
		}
		return date;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		String date = null;

		if (!endTime.equals("")) {
			date = endDate + "T" + endTime;
		} else {
			date = endDate + "T00:00";
		}
		return date;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDogid() {
		return dogid;
	}

	public void setDogid(int dogid) {
		this.dogid = dogid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
