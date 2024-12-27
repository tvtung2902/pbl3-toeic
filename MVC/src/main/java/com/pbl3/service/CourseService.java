package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;

public class CourseService extends BaseService {

	public static LinkedList<Pair<CourseModel, Integer>> search(String keyword, int TeacherID) {
		LinkedList<Pair<CourseModel, Integer>> list= new LinkedList<Pair<CourseModel,Integer>>();
		String queryString="";
		if(TeacherID==-1) {
		 queryString="select course.*, SoLuongHocVien from course left  join (SELECT "
					+ "register_course.courseid, "
					+ "COUNT(DISTINCT userid,courseid) SoLuongHocVien "
					+ "FROM "
					+ "register_course where status = \"confirmed\" "
					+ "GROUP BY "
					+ "register_course.courseid) dk on course.courseid=dk.courseid WHERE CourseName LIKE \"%"+keyword+"%\" "
					+ "order by SoLuongHocVien desc";
		}
		else {
			 queryString="select course.*, SoLuongHocVien from course left  join (SELECT "
						+ "register_course.courseid, "
						+ "COUNT(DISTINCT userid,courseid) SoLuongHocVien "
						+ "FROM "
						+ "register_course where status = \"confirmed\" "
						+ "GROUP BY "
						+ "register_course.courseid) dk on course.courseid=dk.courseid WHERE CourseName LIKE \"%"+keyword+"%\"  and teacherID= "+ TeacherID
						+ " order by SoLuongHocVien desc";
		}
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				String courseName = resultSet.getString("CourseName");
				String courseDesc = resultSet.getString("CourseDesc");
				Double price = resultSet.getDouble("Price");
				Integer duration = resultSet.getInt("Duration");
				Integer target = resultSet.getInt("target");
				String image = resultSet.getString("image");
				Integer input = resultSet.getInt("input");
				Integer tacherID = resultSet.getInt("teacherID");
				Integer percentSalary = resultSet.getInt("percentSalary");
				Integer percentDiscount = resultSet.getInt("percentDiscount");
				CourseModel courseModel=new CourseModel(courseID,courseName, courseDesc, price, duration, target, image, input, tacherID, percentSalary, percentDiscount);
				Integer soLuongInteger = resultSet.getInt("SoLuongHocVien");
				Pair<CourseModel, Integer> pair =new Pair<CourseModel, Integer>(courseModel, soLuongInteger);
				list.add(pair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static int count(int courseID) {
		int k=0;
		try {
			Connection connection = getConnection();
			String sqlString="select COUNT(DISTINCT userid) from register_course where status = \"confirmed\" and CourseID ="+Integer.toString(courseID);
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			 k=resultSet.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	// add
	public static void add(CourseModel courseModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Course (CourseName, CourseDesc, Price, Duration, TeacherID, Target, Input, Image, PercentSalary, PercentDiscount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	        preparedStatement.setString(1, courseModel.getCourseName());
	        preparedStatement.setString(2, courseModel.getCourseDesc());
	        preparedStatement.setDouble(3, courseModel.getPrice());
	        preparedStatement.setInt(4, courseModel.getDuration());
	        preparedStatement.setInt(5, courseModel.getTeacherID());
	        preparedStatement.setInt(6, courseModel.getTarget());
	        preparedStatement.setInt(7, courseModel.getInput());
	        preparedStatement.setString(8, courseModel.getImage());
	        preparedStatement.setInt(9, courseModel.getPercentSalary());
	        preparedStatement.setInt(10, courseModel.getPercentDiscount());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
    public static boolean delete(int courseID) {
        try {
        	System.out.println(courseID);
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM course WHERE courseID = ?");
            preparedStatement.setInt(1, courseID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
	// find
	public static CourseModel find(int courseID) {
	    CourseModel courseModel = new CourseModel();
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Course WHERE CourseID = ?");
	        preparedStatement.setInt(1, courseID);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            int courseId = resultSet.getInt("CourseID");
	            String courseName = resultSet.getString("CourseName");
	            String courseDesc = resultSet.getString("CourseDesc");
	            double price = resultSet.getDouble("Price");
	            int duration = resultSet.getInt("Duration");
	            int teacherID = resultSet.getInt("TeacherID");
	            int target = resultSet.getInt("Target");
	            int input = resultSet.getInt("Input");
	            String image = resultSet.getString("Image");
	            int percentSalary = resultSet.getInt("percentSalary");
	            int percentDiscount = resultSet.getInt("percentDiscount");
	            courseModel.setCourseID(courseId);
	            courseModel.setCourseName(courseName);
	            courseModel.setCourseDesc(courseDesc);
	            courseModel.setPrice(price);
	            courseModel.setDuration(duration);
	            courseModel.setTeacherID(teacherID);
	            courseModel.setTarget(target);
	            courseModel.setInput(input);
	            courseModel.setImage(image);
	            courseModel.setPercentSalary(percentSalary);
	            courseModel.setPercentDiscount(percentDiscount);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return courseModel;
	}
	
	// edit
	public static void edit(CourseModel courseModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Course SET CourseName = ?, CourseDesc = ?, Price = ?, Duration = ?, TeacherID = ?, Target = ?, Input = ?, Image = ?, PercentSalary = ?, PercentDiscount = ? WHERE CourseID = ?");
	        preparedStatement.setString(1, courseModel.getCourseName());
	        preparedStatement.setString(2, courseModel.getCourseDesc());
	        preparedStatement.setDouble(3, courseModel.getPrice());
	        preparedStatement.setInt(4, courseModel.getDuration());
	        preparedStatement.setInt(5, courseModel.getTeacherID());
	        preparedStatement.setInt(6, courseModel.getTarget());
	        preparedStatement.setInt(7, courseModel.getInput());
	        preparedStatement.setString(8, courseModel.getImage());
	        preparedStatement.setInt(9, courseModel.getPercentSalary());
	        preparedStatement.setInt(10, courseModel.getPercentDiscount());
	        preparedStatement.setInt(11, courseModel.getCourseID());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {   
	        e.printStackTrace();
	    }
	}
	
	// query 
	public static LinkedList<CourseModel> allRecent(int courseCurrentID) {
		LinkedList<CourseModel> courseModels = new LinkedList<CourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT CourseID, CourseName, Image FROM course Where courseID <> ? ORDER BY CourseID LIMIT 3");
			preparedStatement.setInt(1, courseCurrentID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				CourseModel courseModel = new CourseModel();
				Integer courseID = resultSet.getInt("CourseID");
				String courseName = resultSet.getString("CourseName");
				String image = resultSet.getString("image");
				courseModel.setImage(image); 
				courseModel.setCourseID(courseID);
				courseModel.setCourseName(courseName);
				courseModels.add(courseModel);      
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courseModels;
	}
	
	public static int count() {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("Select Count(*) As Result From Course");
			ResultSet resultset = preparedStatement.executeQuery();
			resultset.next();
			int count = resultset.getInt("Result");
			return count;
		} catch (Exception e) {
		}
		return 0;
	}
	
	public static LinkedList<Pair<CourseModel, Integer>> getTop3() {
		LinkedList<Pair<CourseModel, Integer>> list= new LinkedList<Pair<CourseModel,Integer>>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select course.*, SoLuongHocVien from course join (SELECT \r\n"
					+ "    register_course.courseid,\r\n"
					+ "    COUNT(DISTINCT userid,courseid) SoLuongHocVien\r\n"
					+ "FROM \r\n"
					+ "   register_course where status = \"confirmed\"\r\n"
					+ "GROUP BY \r\n"
					+ "   register_course.courseid) dk on course.courseid=dk.courseid\r\n"
					+ "order by SoLuongHocVien desc limit 3;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				String courseName = resultSet.getString("CourseName");
				String courseDesc = resultSet.getString("CourseDesc");
				Double price = resultSet.getDouble("Price");
				Integer duration = resultSet.getInt("Duration");
				Integer target = resultSet.getInt("target");
				String image = resultSet.getString("image");
				Integer input = resultSet.getInt("input");
				Integer tacherID = resultSet.getInt("teacherID");
				Integer percentSalary = resultSet.getInt("percentSalary");
				Integer percentDiscount = resultSet.getInt("percentDiscount");
				CourseModel courseModel=new CourseModel(courseID,courseName, courseDesc, price, duration, target, image, input, tacherID, percentSalary, percentDiscount);
				Integer soLuongInteger = resultSet.getInt("SoLuongHocVien");
				Pair<CourseModel, Integer> pair =new Pair<CourseModel, Integer>(courseModel, soLuongInteger);
				list.add(pair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
