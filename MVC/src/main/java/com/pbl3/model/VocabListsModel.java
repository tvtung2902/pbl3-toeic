package com.pbl3.model;

public class VocabListsModel {
	private int listID;
	private int userID;
	private Integer lessionID; // dung Integer vi co the null
	private String nameList;
	private String description;
	
	public VocabListsModel () {
		
	}
	
	public VocabListsModel(int userID, Integer lessionID, String nameList, String description) {
		super();
		this.userID = userID;
		this.lessionID = lessionID;
		this.nameList = nameList;
		this.description = description;
	}

	public VocabListsModel(int listID, int userID, Integer lessionID, String nameList, String description) {
		super();
		this.listID = listID;
		this.userID = userID;
		this.lessionID = lessionID;
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

	public Integer getLessionID() {
		return lessionID;
	}

	public void setLession(Integer lessionID) {
		this.lessionID = lessionID;
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