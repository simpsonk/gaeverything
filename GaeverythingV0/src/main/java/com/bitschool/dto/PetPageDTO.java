package com.bitschool.dto;

public class PetPageDTO {
	private int petno;
	private String email;
	private String petname;
	private String photo;
	private String species;
	private int age;
	private String gender;
	private String notes;
	
	public int getPetno() {
		return petno;
	}
	public void setPetno(int petno) {
		this.petno = petno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	@Override
	public String toString() {
		return "PetPageDTO [petno=" + petno + ", email=" + email + ", petname=" + petname + ", photo=" + photo
				+ ", species=" + species + ", age=" + age + ", gender=" + gender + ", notes=" + notes + "]";
	}
	
}



