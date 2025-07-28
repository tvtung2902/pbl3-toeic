package com.pbl3.model;

public class LessionModel {
	private int lessionID;
	private int courseID;
	private int partID;
	private String lessionName;
	private int orderNumber;
	private String video;
	private String exercise;
	private VocabListsModel vocabListsModel;
	
	public LessionModel() {
		
	}
	public LessionModel(int lessionID, int courseID, int partID, String lessionName, int orderNumber, String video,
			String exercise, VocabListsModel vocabListsModel) {
		super();
		this.lessionID = lessionID;
		this.courseID = courseID;
		this.partID = partID;
		this.lessionName = lessionName;
		this.orderNumber = orderNumber;
		this.video = video;
		this.exercise = exercise;
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
	public String getExercise() {
		return exercise;
	}
	public void setExercise(String exercise) {
		this.exercise = exercise;
	}
	public VocabListsModel getVocabListsModel() {
		return vocabListsModel;
	}
	public void setVocabListsModel(VocabListsModel vocabListsModel) {
		this.vocabListsModel = vocabListsModel;
	}
	@Override
	public String toString() {
		if (video != null && video.equals("null")) System.out.println("ki tu null");
		if (exercise != null && exercise.equals("null")) System.out.println("ki tu null");
				return "LessionModel [lessionID=" + lessionID + ", courseID=" + courseID + ", partID=" + partID
				+ ", lessionName=" + lessionName + ", orderNumber=" + orderNumber + ", video=" + video + ", exercise="
				+ exercise + ", vocabListsModel=" + vocabListsModel + "]";
	}
	
}