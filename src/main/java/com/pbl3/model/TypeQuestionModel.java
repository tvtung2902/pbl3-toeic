package com.pbl3.model;

public class TypeQuestionModel {
	private int typeQuestionID;
	private String typeQuestionName;
    
	public TypeQuestionModel(int typeQuestionID, String typeQuestionName) {
		super();
		this.typeQuestionID = typeQuestionID;
		this.typeQuestionName = typeQuestionName;
	}
	
	public int getTypeQuestionID() {
		return typeQuestionID;
	}

	public void setTypeQuestionID(int typeQuestionID) {
		this.typeQuestionID = typeQuestionID;
	}

	public String getTypeQuestionName() {
		return typeQuestionName;
	}

	public void setTypeQuestionName(String typeQuestionName) {
		this.typeQuestionName = typeQuestionName;
	}
}
