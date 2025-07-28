package com.pbl3.model;

public class DataQuestionModel {
	private int dataQuestionID;
	private String dataQuestion;
	private String transcript;
	private int testsID;
	private int orderNumberPart;
	private int orderNumber;
	public DataQuestionModel(int dataQuestionID, String dataQuestion, String transcript, int testsID, int orderNumberPart, int orderNumber) {
		super();
		this.dataQuestionID = dataQuestionID;
		this.dataQuestion = dataQuestion;
		this.transcript = transcript;
		this.testsID = testsID;
		this.orderNumberPart = orderNumberPart;
		this.orderNumber = orderNumber;
	}
	 
	public int getOrderNumberPart() {
		return orderNumberPart;
	}

	public void setOrderNumberPart(int orderNumberPart) {
		this.orderNumberPart = orderNumberPart;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getDataQuestionID() {
		return dataQuestionID;
	}
	public void setDataQuestionID(int dataQuestionID) {
		this.dataQuestionID = dataQuestionID;
	}
	public String getDataQuestion() {
		return dataQuestion;
	}
	public void setDataQuestion(String dataQuestion) {
		this.dataQuestion = dataQuestion;
	}
	public String getTranscript() {
		return transcript;
	}
	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}
	public int getTestsID() {
		return testsID;
	}
	public void setTestsID(int testsID) {
		this.testsID = testsID;
	}	
}
