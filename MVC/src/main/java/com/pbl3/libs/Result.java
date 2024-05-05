package com.pbl3.libs;

public class Result {
	private int scoreListening;
	private int scoreReading;
	private int rightAnswerListening;
	private int rightAnswerReading;
	private int wrongAnswer ;
	private int skip;
	
	public Result(int scoreListening, int scoreReading, int rightAnswerListening, int rightAnswerReading,
			int wrongAnswer, int skip) {
		super();
		this.scoreListening = scoreListening;
		this.scoreReading = scoreReading;
		this.rightAnswerListening = rightAnswerListening;
		this.rightAnswerReading = rightAnswerReading;
		this.wrongAnswer = wrongAnswer;
		this.skip = skip;
	}

	public int getScoreListening() {
		return scoreListening;
	}

	public void setScoreListening(int scoreListening) {
		this.scoreListening = scoreListening;
	}

	public int getScoreReading() {
		return scoreReading;
	}

	public void setScoreReading(int scoreReading) {
		this.scoreReading = scoreReading;
	}

	public int getRightAnswerListening() {
		return rightAnswerListening;
	}

	public void setRightAnswerListening(int rightAnswerListening) {
		this.rightAnswerListening = rightAnswerListening;
	}

	public int getRightAnswerReading() {
		return rightAnswerReading;
	}

	public void setRightAnswerReading(int rightAnswerReading) {
		this.rightAnswerReading = rightAnswerReading;
	}

	public int getWrongAnswer() {
		return wrongAnswer;
	}

	public void setWrongAnswer(int wrongAnswer) {
		this.wrongAnswer = wrongAnswer;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
}
