package com.pbl3.model;

import java.text.DecimalFormat;

public class CourseModel {
	private int courseID;
	private String courseName;
	private String courseDesc;
	private double price;
	private int duration;
	private int target;
	private String image;
	private int input;
	private int teacherID;
	private int percentSalary;
	private int percentDiscount;

	public CourseModel(String courseName, String courseDesc, double price, int duration, int target, String image,
			int input, int teacherID, int percentSalary, int percentDiscount) {
		super();
		this.courseName = courseName;
		this.courseDesc = courseDesc;
		this.price = price;
		this.duration = duration;
		this.target = target;
		this.image = image;
		this.input = input;
		this.teacherID = teacherID;
		this.percentDiscount = percentDiscount;
		this.percentSalary = percentSalary;
	}

	public CourseModel(int courseID, String courseName, String courseDesc, double price, int duration, int target,
			String image, int input, int teacherID, int percentSalary, int percentDiscount) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.courseDesc = courseDesc;
		this.price = price;
		this.duration = duration;
		this.target = target;
		this.image = image;
		this.input = input;
		this.teacherID = teacherID;
		this.percentDiscount = percentDiscount;
		this.percentSalary = percentSalary;
	}

	public CourseModel() {

	}

	public CourseModel(String courseName, String courseDesc, double price, int duration, int teacherID) {
		super();
		this.courseName = courseName;
		this.courseDesc = courseDesc;
		this.price = price;
		this.duration = duration;
		this.teacherID = teacherID;
	}

	public CourseModel(int courseID, String courseName, String courseDesc, double price, int duration, int teacherID) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.courseDesc = courseDesc;
		this.price = price;
		this.duration = duration;
		this.teacherID = teacherID;
	}

	public int getPercentSalary() {
		return percentSalary;
	}

	public void setPercentSalary(int percentSalary) {
		this.percentSalary = percentSalary;
	}

	public int getPercentDiscount() {
		return percentDiscount;
	}

	public void setPercentDiscount(int percentDiscount) {
		this.percentDiscount = percentDiscount;
	}

	public int getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(int teacherID) {
		this.teacherID = teacherID;
	}

	public int getInput() {
		return input;
	}

	public void setInput(int input) {
		this.input = input;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDesc() {
		return courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}
	
	public double getPrice() {
		return price;
	}

	public String getPriceCH() {
		DecimalFormat formatter = new DecimalFormat("#,###");
		String formattedAmount = formatter.format(price);
		formattedAmount = formattedAmount.replace(",", ".");
		return formattedAmount + "đ";
	}
	public static String getPriceCH(double price) {
		DecimalFormat formatter = new DecimalFormat("#,###");
		String formattedAmount = formatter.format(price);
		formattedAmount = formattedAmount.replace(",", ".");
		return formattedAmount + "đ";
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}
}
