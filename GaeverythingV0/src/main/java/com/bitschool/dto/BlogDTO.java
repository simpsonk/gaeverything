package com.bitschool.dto;

public class BlogDTO {
	private String title;
	private String link;
	private String description;
	private String bloggername;
	private String bloggerlink;
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
	@Override
	public String toString() {
		return "BlogDTO [title=" + title + ", link=" + link + ", description=" + description + ", bloggername="
				+ bloggername + ", bloggerlink=" + bloggerlink + "]";
	}
	
	
}
