package com.pbl3.model;
import java.sql.Date;
import com.pbl3.service.CourseService;

public class Register_CourseModel {
		private int courseID;
		private int userID;
		private Date date;
		private Date confirmDate;
		private double amount;
		private double amountOfTeacher;
		private String status;
		private int RegisterCourseID;
		private long dayOfCourse;
		
		public Register_CourseModel() {
			
		}
		
		public Register_CourseModel(int courseID, int userID, Date date, Date confirmDate, double amount,
				double amountOfTeacher, String status) {
			super();
			this.courseID = courseID;
			this.userID = userID;
			this.date = date;
			this.confirmDate = confirmDate;
			this.amount = amount;
			this.amountOfTeacher = amountOfTeacher;
			this.status = status;
		}
		
		public Register_CourseModel(int courseID, int userID, Date date, Date confirmDate, double amount,
				double amountOfTeacher, String status, int registerCourseID) {
			super();
			this.courseID = courseID;
			this.userID = userID;
			this.date = date;
			this.confirmDate = confirmDate;
			this.amount = amount;
			this.amountOfTeacher = amountOfTeacher;
			this.status = status;
			RegisterCourseID = registerCourseID;
		}

		public Date getConfirmDate() {
			return confirmDate;
		}
		public void setConfirmDate(Date confirmDate) {
			this.confirmDate = confirmDate;
		}
		public double getAmountOfTeacher() {
			return amountOfTeacher;
		}
		public void setAmountOfTeacher(double amountOfTeacher) {
			this.amountOfTeacher = amountOfTeacher;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public int getCourseID() {
			return courseID;
		}
		public void setCourseID(int courseID) {
			this.courseID = courseID;
		}
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public double getAmount() {
			return amount;
		}
		public void setAmount(double amount) {
			this.amount = amount;
		}
		public long getDayOfCoure() {
			return dayOfCourse;
		}
		public void setDayOfCourse(long d) {
			this.dayOfCourse=d;
		}
		public CourseModel getCourseModel() {
			return CourseService.find(courseID);
		}

		public int getRegisterCourseID() {
			return RegisterCourseID;
		}

		public void setRegisterCourseID(int registerCourseID) {
			RegisterCourseID = registerCourseID;
		}
}
