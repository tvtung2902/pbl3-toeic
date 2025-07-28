package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
import com.pbl3.model.Coupon_CourseModel;
import com.pbl3.model.CourseModel;

public class Coupon_CourseService extends BaseService{
    public static void add(Coupon_CourseModel coupon_CourseModel) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO coupon_course (courseID, couponID) VALUES (?, ?)");
            preparedStatement.setInt(1, coupon_CourseModel.getCourseID());
            preparedStatement.setInt(2, coupon_CourseModel.getCouponID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void delete(Coupon_CourseModel coupon_CourseModel) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM coupon_course WHERE CouponID = ? AND courseID = ?");
            preparedStatement.setInt(1, coupon_CourseModel.getCouponID());
            preparedStatement.setInt(2, coupon_CourseModel.getCourseID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static LinkedList<Pair<CourseModel, Integer>> all(int couponID) {
    	LinkedList<Pair<CourseModel, Integer>> linkedLists = new LinkedList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT course.CourseID, course.CourseName, C_C.couponID FROM course Left JOIN (SELECT coupon_course.* from coupon_course WHERE couponID = ?) AS c_c ON course.courseID = c_c.courseID");
            preparedStatement.setInt(1, couponID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                CourseModel courseModel = new CourseModel();
                courseModel.setCourseID(resultSet.getInt("courseID"));
                courseModel.setCourseName(resultSet.getString("courseName"));
                Integer couponIDcurrent = null;
                if(resultSet.getObject("couponID") != null) {
                	couponIDcurrent = resultSet.getInt("couponID");
                }
                Pair<CourseModel, Integer> pair = new Pair<CourseModel, Integer>(courseModel, couponIDcurrent);
                linkedLists.add(pair);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return linkedLists;
    }
}
