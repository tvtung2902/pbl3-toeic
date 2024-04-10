package com.pbl3.model;

public class QuestionModel {
	private int questionID;
	private Integer assignmentID;
	private Integer testID;
	private String questionContent;
	private String contentAnswerA;
	private String contentAnswerB;
	private String contentAnswerC;
	private String ContentAnswerD;
	private String AnswerCorrect;
	private String AnswerExplain;
	private int OrderNumber;
	
	public QuestionModel() {
		
	}

	public QuestionModel(int questionID, Integer assignmentID, Integer testID, String questionContent,
			String contentAnswerA, String contentAnswerB, String contentAnswerC, String contentAnswerD,
			String answerCorrect, String answerExplain, int orderNumber) {
		super();
		this.questionID = questionID;
		this.assignmentID = assignmentID;
		this.testID = testID;
		this.questionContent = questionContent;
		this.contentAnswerA = contentAnswerA;
		this.contentAnswerB = contentAnswerB;
		this.contentAnswerC = contentAnswerC;
		ContentAnswerD = contentAnswerD;
		AnswerCorrect = answerCorrect;
		AnswerExplain = answerExplain;
		OrderNumber = orderNumber;
	}

	public QuestionModel(Integer assignmentID, Integer testID, String questionContent, String contentAnswerA,
			String contentAnswerB, String contentAnswerC, String contentAnswerD, String answerCorrect,
			String answerExplain, int orderNumber) {
		super();
		this.assignmentID = assignmentID;
		this.testID = testID;
		this.questionContent = questionContent;
		this.contentAnswerA = contentAnswerA;
		this.contentAnswerB = contentAnswerB;
		this.contentAnswerC = contentAnswerC;
		ContentAnswerD = contentAnswerD;
		AnswerCorrect = answerCorrect;
		AnswerExplain = answerExplain;
		OrderNumber = orderNumber;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public Integer getAssignmentID() {
		return assignmentID;
	}

	public void setAssignmentID(Integer assignmentID) {
		this.assignmentID = assignmentID;
	}

	public Integer getTestID() {
		return testID;
	}

	public void setTestID(Integer testID) {
		this.testID = testID;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getContentAnswerA() {
		return contentAnswerA;
	}

	public void setContentAnswerA(String contentAnswerA) {
		this.contentAnswerA = contentAnswerA;
	}

	public String getContentAnswerB() {
		return contentAnswerB;
	}

	public void setContentAnswerB(String contentAnswerB) {
		this.contentAnswerB = contentAnswerB;
	}

	public String getContentAnswerC() {
		return contentAnswerC;
	}

	public void setContentAnswerC(String contentAnswerC) {
		this.contentAnswerC = contentAnswerC;
	}

	public String getContentAnswerD() {
		return ContentAnswerD;
	}

	public void setContentAnswerD(String contentAnswerD) {
		ContentAnswerD = contentAnswerD;
	}

	public String getAnswerCorrect() {
		return AnswerCorrect;
	}

	public void setAnswerCorrect(String answerCorrect) {
		AnswerCorrect = answerCorrect;
	}

	public String getAnswerExplain() {
		return AnswerExplain;
	}

	public void setAnswerExplain(String answerExplain) {
		AnswerExplain = answerExplain;
	}

	public int getOrderNumber() {
		return OrderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		OrderNumber = orderNumber;
	} 

}
