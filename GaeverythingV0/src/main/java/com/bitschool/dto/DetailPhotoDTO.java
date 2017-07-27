package com.bitschool.dto;

public class DetailPhotoDTO {

	private int locationSeq;
	private String locationPhoto;
	private int detailPhotoSeq;
	
	
	public int getDetailPhotoSeq() {
		return detailPhotoSeq;
	}
	public void setDetailPhotoSeq(int detailPhotoSeq) {
		this.detailPhotoSeq = detailPhotoSeq;
	}
	public int getLocationSeq() {
		return locationSeq;
	}
	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}
	public String getLocationPhoto() {
		return locationPhoto;
	}
	public void setLocationPhoto(String locationPhoto) {
		this.locationPhoto = locationPhoto;
	}
	@Override
	public String toString() {
		return "DetailPhotoDTO [locationSeq=" + locationSeq + ", locationPhoto=" + locationPhoto + ", detailPhotoSeq="
				+ detailPhotoSeq + "]";
	}
	
	
	
}
