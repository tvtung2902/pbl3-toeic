package com.pbl3.model;

public class VocabListsModel {
	private int listID;
	private int userID;
	private Integer courseID; // dung Integer vi co the null
	private String nameList;
	private String description;
	
	public VocabListsModel () {
		
	}
	
	public VocabListsModel(int userID, Integer courseID, String nameList, String description) {
		super();
		this.userID = userID;
		this.courseID = courseID;
		this.nameList = nameList;
		this.description = description;
	}

	public VocabListsModel(int listID, int userID, Integer courseID, String nameList, String description) {
		super();
		this.listID = listID;
		this.userID = userID;
		this.courseID = courseID;
		this.nameList = nameList;
		this.description = description;
	}

	public int getListID() {
		return listID;
	}

	public void setListID(int listID) {
		this.listID = listID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public Integer getCourseID() {
		return courseID;
	}

	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
	}

	public String getNameList() {
		return nameList;
	}

	public void setNameList(String nameList) {
		this.nameList = nameList;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}