package com.pbl3.model;

public class Teacher_TestsModel {
	private int userID;
	private String name;
	private String image;
	private int pendingTests;
	private int createdTests;
	public Teacher_TestsModel(int userID, String name, String image, int pendingTests, int createdTests) {
		super();
		this.userID = userID;
		this.name = name;
		this.image = image;
		this.pendingTests = pendingTests;
		this.createdTests = createdTests;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getName() { 
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPendingTests() {
		return pendingTests;
	}
	public void setPendingTests(int pendingTests) {
		this.pendingTests = pendingTests;
	}
	public int getCreatedTests() {
		return createdTests;
	}
	public void setCreatedTests(int createdTests) {
		this.createdTests = createdTests;
	}
	
	
}
