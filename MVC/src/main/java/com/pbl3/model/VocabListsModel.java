package com.pbl3.model;

public class VocabListsModel {
	private int listID;
	private Integer userID;
	private String nameList;
	private String description;
	
	public VocabListsModel () {
		
	}
	
	public VocabListsModel(Integer userID, String nameList, String description) {
		super();
		this.userID = userID;
		this.nameList = nameList;
		this.description = description;
	}

	public VocabListsModel(int listID, Integer userID, String nameList, String description) {
		super();
		this.listID = listID;
		this.userID = userID;
		this.nameList = nameList;
		this.description = description;
	}

	public int getListID() {
		return listID;
	}

	public void setListID(int listID) { 
		this.listID = listID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
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