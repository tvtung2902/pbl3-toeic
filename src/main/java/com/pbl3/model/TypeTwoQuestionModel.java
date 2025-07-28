package com.pbl3.model;

public class TypeTwoQuestionModel extends QuestionModel{
	private String contentAnswerA;
	private String contentAnswerB;
	private String contentAnswerC;
	private String contentAnswerD;
	private String questionContent;
	
	public TypeTwoQuestionModel() {
		super();
		this.contentAnswerA = "";
		this.contentAnswerB = "";
		this.contentAnswerC = "";  
		this.contentAnswerD = "";
		this.questionContent = "";
	}
	
	public TypeTwoQuestionModel(int questionID, Integer typeQuestionID, Integer testID, String answerCorrect,
			String answerExplain, int orderNumber, String image, TypeQuestionModel typeQuestionModel,
			Integer dataQuestionID, DataQuestionModel dataQuestionModel, String contentAnswerA, String contentAnswerB,
			String contentAnswerC, String contentAnswerD, String questionContent) {
		super(questionID, typeQuestionID, testID, answerCorrect, answerExplain, orderNumber, image, typeQuestionModel,
				dataQuestionID, dataQuestionModel);
		this.contentAnswerA = contentAnswerA;
		this.contentAnswerB = contentAnswerB;
		this.contentAnswerC = contentAnswerC;
		this.contentAnswerD = contentAnswerD;
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
		return contentAnswerD;
	}
	public void setContentAnswerD(String contentAnswerD) {
		this.contentAnswerD = contentAnswerD;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
}
