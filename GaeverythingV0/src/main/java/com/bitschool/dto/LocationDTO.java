package com.bitschool.dto;

public class LocationDTO {
	private int locationSeq;
	private int related_place_count;
	private String zipcode;
	private String related_place;
	private String distance;
	private String direction;
	private String placeUrl;
	private String categoryCode;
	private String category;
	private String newAddress;
	private String title;
	private String id;
	private String phone;
	private String imageUrl;
	private String address;
	private String addressBCode;
	private String longitude;
	private String latitude;
	private String radius;
	private String userLikeStatus;

	private int relatedPlaceCount;
	private String locId;
	private String locCategory;
	private String replacePlace;
	private int countLike;
	
	
	
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	public String getUserLikeStatus() {
		return userLikeStatus;
	}
	public void setUserLikeStatus(String userLikeStatus) {
		this.userLikeStatus = userLikeStatus;
	}

	public String getRadius() {
		return radius;
	}
	public void setRadius(double radius) {
		this.radius = String.format("%.2f", radius);
	}
	public String getReplacePlace() {
		return replacePlace;
	}
	public void setReplacePlace(String replacePlace) {
		this.replacePlace = replacePlace;
	}
	
	public int getRelatedPlaceCount() {
		return relatedPlaceCount;
	}
	public void setRelatedPlaceCount(int relatedPlaceCount) {
		this.relatedPlaceCount = relatedPlaceCount;
	}
	
	public String getLocId() {
		return locId;
	}
	public void setLocId(String locId) {
		this.locId = locId;
	}
	public String getLocCategory() {
		return locCategory;
	}
	public void setLocCategory(String locCategory) {
		this.locCategory = locCategory;
	}
	
	
	public int getLocationSeq() {
		return locationSeq;
	}
	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}
	public int getRelated_place_count() {
		return related_place_count;
	}
	public void setRelated_place_count(int related_place_count) {
		this.related_place_count = related_place_count;
		this.setRelatedPlaceCount(related_place_count);
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRelated_place() {
		return related_place;
	}
	public void setRelated_place(String related_place) {
		this.related_place = related_place;
		this.setReplacePlace(related_place);
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getPlaceUrl() {
		return placeUrl;
	}
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
		this.setLocCategory(categoryCode);
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getNewAddress() {
		return newAddress;
	}
	public void setNewAddress(String newAddress) {
		this.newAddress = newAddress;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
		this.setLocId(id);
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressBCode() {
		return addressBCode;
	}
	public void setAddressBCode(String addressBCode) {
		this.addressBCode = addressBCode;
	}
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
	
	@Override
	public String toString() {
		return "LocationDTO [locationSeq=" + locationSeq + ", related_place_count=" + related_place_count + ", zipcode="
				+ zipcode + ", related_place=" + related_place + ", distance=" + distance + ", direction=" + direction
				+ ", placeUrl=" + placeUrl + ", categoryCode=" + categoryCode + ", category=" + category
				+ ", newAddress=" + newAddress + ", title=" + title + ", id=" + id + ", phone=" + phone + ", imageUrl="
				+ imageUrl + ", address=" + address + ", addressBCode=" + addressBCode + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", radius=" + radius + ", userLikeStatus=" + userLikeStatus
				+ ", relatedPlaceCount=" + relatedPlaceCount + ", locId=" + locId + ", locCategory=" + locCategory
				+ ", replacePlace=" + replacePlace + ", countLike=" + countLike + "]";
	}
	

}
