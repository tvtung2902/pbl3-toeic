package com.pbl3.model;

public class User_TestsModel {
	private String testName;
	private int countUser;
	private int countTimes;
	private boolean status;
	private int testsID;
	public User_TestsModel(String testName, int countUser, int countTimes, boolean status, int testsID) {
		super();
		this.testName = testName;
		this.countUser = countUser;
		this.countTimes = countTimes;
		this.status = status;
		this.testsID = testsID;
	}
	
	public int getTestsID() {
		return testsID;
	}

	public void setTestsID(int testsID) {
		this.testsID = testsID;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public int getCountUser() {
		return countUser;
	}
	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}
	public int getCountTimes() {
		return countTimes;
	}
	public void setCountTimes(int countTimes) {
		this.countTimes = countTimes;
	}
}
