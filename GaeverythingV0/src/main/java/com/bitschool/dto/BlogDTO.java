package com.bitschool.dto;

public class BlogDTO {
	private int blogSeq;
	private int locationSeq;
	
	private String title;
	private String link;
	private String description;
	private String bloggername;
	private String bloggerlink;
	
	private String postdate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBloggername() {
		return bloggername;
	}
	public void setBloggername(String bloggername) {
		this.bloggername = bloggername;
	}
	public String getBloggerlink() {
		return bloggerlink;
	}
	public void setBloggerlink(String bloggerlink) {
		this.bloggerlink = bloggerlink;
	}
	
	public int getBlogSeq() {
		return blogSeq;
	}
	public void setBlogSeq(int blogSeq) {
		this.blogSeq = blogSeq;
	}
	public int getLocationSeq() {
		return locationSeq;
	}
	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}	
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	@Override
	public String toString() {
		return "BlogDTO [blogSeq=" + blogSeq + ", locationSeq=" + locationSeq + ", title=" + title + ", link=" + link
				+ ", description=" + description + ", bloggername=" + bloggername + ", bloggerlink=" + bloggerlink
				+ ", postdate=" + postdate + "]";
	}	
	
}
