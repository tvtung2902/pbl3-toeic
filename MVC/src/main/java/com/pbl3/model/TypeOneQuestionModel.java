package com.pbl3.model;

public class TypeOneQuestionModel extends QuestionModel{
	private String audio;
	private String transcript;
	
	public TypeOneQuestionModel() {
		super();
		audio = "";
		transcript = "";
	}
	
	public TypeOneQuestionModel(int questionID, Integer typeQuestionID, Integer testID, String answerCorrect,
			String answerExplain, int orderNumber, String image, TypeQuestionModel typeQuestionModel,
			Integer dataQuestionID, DataQuestionModel dataQuestionModel, String audio, String transcript) {
		super(questionID, typeQuestionID, testID, answerCorrect, answerExplain, orderNumber, image, typeQuestionModel,
				dataQuestionID, dataQuestionModel);
		this.audio = audio;
		this.transcript = transcript;
	}

	public String getAudio() {
		return audio;
	}
	public void setAudio(String audio) {
		this.audio = audio;
	}
	public String getTranscript() {
		return transcript;
	}
	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}
}
