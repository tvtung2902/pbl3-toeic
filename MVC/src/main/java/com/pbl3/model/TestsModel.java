package com.pbl3.model;

import java.time.Year;
import java.time.YearMonth;

public class TestsModel {
	private int testsID;
	private String testsName;
	private int year;
	
	public TestsModel(int testID, String testName, int year) {
		super();
		this.testsID = testID;
		this.testsName = testName;
		this.year = year;
	}

	public TestsModel(String testName, int year) {
		super();
		this.testsName = testName;
		this.year = year;
	}

	public int getTestID() {
		return testsID;
	}

	public void setTestID(int testID) {
		this.testsID = testID;
	}

	public String getTestName() {
		return testsName;
	}

	public void setTestName(String testName) {
		this.testsName = testName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	
	
}
