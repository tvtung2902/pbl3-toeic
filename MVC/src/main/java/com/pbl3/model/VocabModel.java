package com.pbl3.model;

public class VocabModel {
	private int vocabID;
	private int listID;
	private String vocab;
	private String mean;
	private String wordType; 
	private String example;
	
	public VocabModel () {
		
	}
	
	public VocabModel(int listID, String vocab, String mean, String wordType, String example) {
		super();
		this.listID = listID;
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
	}

	public VocabModel(int vocabID, int listID, String vocab, String mean, String wordType, String example) {
		super();
		this.vocabID = vocabID;
		this.listID = listID;
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
	}

	
	
	public VocabModel(String vocab, String mean, String wordType, String example) {
		super();
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
	}

	public int getVocabID() {
		return vocabID;
	}

	public void setVocabID(int vocabID) {
		this.vocabID = vocabID;
	}

	public int getListID() {
		return listID;
	}

	public void setListID(int listID) {
		this.listID = listID;
	}

	public String getVocab() {
		return vocab;
	}

	public void setVocab(String vocab) {
		this.vocab = vocab;
	}

	public String getMean() {
		return mean;
	}

	public void setMean(String mean) {
		this.mean = mean;
	}

	public String getWordType() {
		return wordType;
	}

	public void setWordType(String wordType) {
		this.wordType = wordType;
	}

	public String getExample() {
		return example;
	}

	public void setExample(String example) {
		this.example = example;
	}
	
	
	
	
}
