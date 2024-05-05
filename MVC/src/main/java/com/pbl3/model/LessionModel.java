package com.pbl3.model;

public class LessionModel {
	private int lessionID;
	private int courseID;
	private int partID;
	private String lessionName;
	private int orderNumber;
	private String video;
	private ExerciseModel exerciseModel;
	private VocabListsModel vocabListsModel;
	public LessionModel(int lessionID, int courseID, int partID, String lessionName, int orderNumber, String video,
			ExerciseModel exerciseModel, VocabListsModel vocabListsModel) {
		super();
		this.lessionID = lessionID;
		this.courseID = courseID;
		this.partID = partID;
		this.lessionName = lessionName;
		this.orderNumber = orderNumber;
		this.video = video;
		this.exerciseModel = exerciseModel;
		this.vocabListsModel = vocabListsModel;
	}
	public int getLessionID() {
		return lessionID;
	}
	public void setLessionID(int lessionID) {
		this.lessionID = lessionID;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public int getPartID() {
		return partID;
	}
	public void setPartID(int partID) {
		this.partID = partID;
	}
	public String getLessionName() {
		return lessionName;
	}
	public void setLessionName(String lessionName) {
		this.lessionName = lessionName;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public ExerciseModel getExerciseModel() {
		return exerciseModel;
	}
	public void setExerciseModel(ExerciseModel exerciseModel) {
		this.exerciseModel = exerciseModel;
	}
	public VocabListsModel getVocabListsModel() {
		return vocabListsModel;
	}
	public void setVocabListsModel(VocabListsModel vocabListsModel) {
		this.vocabListsModel = vocabListsModel;
	}
	
}