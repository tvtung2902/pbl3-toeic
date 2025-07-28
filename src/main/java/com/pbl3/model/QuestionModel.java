package com.pbl3.model;

public class QuestionModel {
	private int questionID;
	private Integer typeQuestionID;
	private Integer testID;
	private String answerCorrect;
	private String answerExplain;
	private int orderNumber;
	private String image;
	private TypeQuestionModel typeQuestionModel;
	private Integer dataQuestionID;
	private DataQuestionModel dataQuestionModel;
	
	public QuestionModel() {
		this.questionID = 0; 
		this.typeQuestionID = 0;
		this.testID = 0;
		this.answerCorrect = "";
		this.answerExplain = "";
		this.orderNumber = 0;
		this.image = "";
		this.typeQuestionModel = new TypeQuestionModel(0, "");
		this.dataQuestionID = 0;
		this.dataQuestionModel = new DataQuestionModel(0, "", "", 0, 0, 0);
	}
	
	public QuestionModel(int questionID, Integer typeQuestionID, Integer testID, String answerCorrect,
			String answerExplain, int orderNumber, String image, TypeQuestionModel typeQuestionModel, Integer dataQuestionID, DataQuestionModel dataQuestionModel) {
		this.questionID = questionID;
		this.typeQuestionID = typeQuestionID;
		this.testID = testID;
		this.answerCorrect = answerCorrect;
		this.answerExplain = answerExplain;
		this.orderNumber = orderNumber;
		this.image = image;
		this.typeQuestionModel = typeQuestionModel;
		this.dataQuestionID = dataQuestionID;
		this.dataQuestionModel = dataQuestionModel;
	}
	
	public Integer getDataQuestionID() {
		return dataQuestionID;
	}
	public void setDataQuestionID(Integer dataQuestionID) {
		this.dataQuestionID = dataQuestionID;
	}

	public DataQuestionModel getDataQuestionModel() {
		return dataQuestionModel;
	}

	public void setDataQuestionModel(DataQuestionModel dataQuestionModel) {
		this.dataQuestionModel = dataQuestionModel;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public Integer getTypeQuestionID() {
		return typeQuestionID;
	}
	public void setTypeQuestionID(Integer typeQuestionID) {
		this.typeQuestionID = typeQuestionID;
	}
	public Integer getTestID() {
		return testID;
	}
	public void setTestID(Integer testID) {
		this.testID = testID;
	}
	public String getAnswerCorrect() {
		return answerCorrect;
	}
	public void setAnswerCorrect(String answerCorrect) {
		this.answerCorrect = answerCorrect;
	}
	public String getAnswerExplain() {
		return answerExplain;
	}
	public void setAnswerExplain(String answerExplain) {
		this.answerExplain = answerExplain;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public TypeQuestionModel getTypeQuestionModel() {
		return typeQuestionModel;
	}
	public void setTypeQuestionModel(TypeQuestionModel typeQuestionModel) {
		this.typeQuestionModel = typeQuestionModel;
	}
} 