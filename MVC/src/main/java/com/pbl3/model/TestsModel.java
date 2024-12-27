package com.pbl3.model;

public class TestsModel {
	private int testsID;
	private String testsName;
	private boolean status;
	private int teacherID;
	private String audio;
	
	public TestsModel() {
		
	}
	
	public TestsModel(int testsID, String audio) {
		super();
		this.testsID = testsID;
		this.audio = audio;
	}

	public TestsModel(int testsID, String testsName, boolean status, int teacherID, String audio) {
		super();
		this.testsID = testsID;
		this.testsName = testsName;
		this.status = status;
		this.teacherID = teacherID;
		this.audio = audio;
	}

	public int getTestsID() {
		return testsID;
	}

	public void setTestsID(int testsID) {
		this.testsID = testsID;
	}

	public String getTestsName() {
		return testsName;
	}

	public void setTestsName(String testsName) {
		this.testsName = testsName;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(int teacherID) {
		this.teacherID = teacherID;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}
	
}
