package com.pbl3.model;

public class Coupon_CourseModel {
	private int couponID;
	private int courseID;
	public Coupon_CourseModel(int couponID, int courseID) {
		super();
		this.couponID = couponID;
		this.courseID = courseID;
	}
	public int getCouponID() {
		return couponID;
	}
	public void setCouponID(int couponID) {
		this.couponID = couponID;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
}
