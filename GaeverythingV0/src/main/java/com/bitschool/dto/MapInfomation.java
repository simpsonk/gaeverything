package com.bitschool.dto;

public class MapInfomation {
	private String searchWord;
	private String categories;
	private int level;
	private double lat;
	private double lon;
	private int option;
	private String page;
	
	
	public MapInfomation(){
		
	}
	
	public MapInfomation(String searchWord, String categories, int level, double lat, double lon, int option) {
		this.searchWord = searchWord;
		this.categories = categories;
		this.level = level;
		this.lat = lat;
		this.lon = lon;
		this.option = option;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	@Override
	public String toString() {
		return "MapInfomation [searchWord=" + searchWord + ", categories=" + categories + ", level=" + level + ", lat="
				+ lat + ", lon=" + lon + ", option=" + option + "]";
	}

	
	
}
