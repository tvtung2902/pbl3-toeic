package com.pbl3.model;

public class VocabModel {
	private int vocabID;
	private int listID;
	private String vocab;
	private String mean;
	private String wordType; 
	private String example;
	private String pronunciation;
	private String image;
	private Boolean status;   
	
	public VocabModel () {
		
	}
	
	public VocabModel(int listID, String vocab, String mean, String wordType, String example, String pronunciation, String image) {
		super();
		this.listID = listID;
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
		this.pronunciation = pronunciation;
		this.image = image; 
	}

	public VocabModel(int vocabID, int listID, String vocab, String mean, String wordType, String example, String pronunciation, String image,Boolean status) {
		super();
		this.vocabID = vocabID;
		this.listID = listID;
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
		this.pronunciation = pronunciation;
		this.image = image;
		this.status = status;
	}

	public VocabModel(String vocab, String mean, String wordType, String example, String pronunciation, String image) {
		super();
		this.vocab = vocab;
		this.mean = mean;
		this.wordType = wordType;
		this.example = example;
		this.pronunciation = pronunciation;
		this.image = image;
	}
	
	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
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

	public String getPronunciation() {
		return pronunciation;
	}

	public void setPronunciation(String pronunciation) {
		this.pronunciation = pronunciation;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
