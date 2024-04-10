package com.pbl3.model;

public class HistoryOfTest_QuestionModel {
	int historyOfTestID;
	int questionID;
	String answer;
	
	public HistoryOfTest_QuestionModel(int historyOfTestID, int questionID, String answer) {
		super();
		this.historyOfTestID = historyOfTestID;
		this.questionID = questionID;
		this.answer = answer;
	}

	public int getHistoryOfTestID() {
		return historyOfTestID;
	}

	public void setHistoryOfTestID(int historyOfTestID) {
		this.historyOfTestID = historyOfTestID;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
