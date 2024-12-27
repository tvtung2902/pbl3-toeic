package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.Teacher_TestsModel;

public class Teacher_TestsService extends BaseService{
	  public static LinkedList<Teacher_TestsModel> getAllTeachersWithTestStats() {
	        LinkedList<Teacher_TestsModel> userModels = new LinkedList<Teacher_TestsModel>();
	        try {
	            Connection connection = getConnection();
	            String query = "SELECT user.UserID, user.Name, user.Image, " +
	                           "COUNT(CASE WHEN Test.status = 0 THEN 1 END) AS PendingTests, " +
	                           "COUNT(CASE WHEN Test.status = 1 THEN 1 END) AS CreatedTests, " +
	                           "COUNT(Test.TestID) AS TotalTests " +
	                           "FROM user " +
	                           "INNER JOIN role ON user.roleID = role.roleID " +
	                           "LEFT OUTER JOIN Test ON user.UserID = Test.teacherID " +
	                           "WHERE role.RoleName = 'Giáo Viên' " +
	                           "GROUP BY user.UserID, user.Name, user.Image " +
	                           "ORDER BY TotalTests DESC;";
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                Integer userID = resultSet.getInt("UserID");
	                String name = resultSet.getString("Name");
	                String image = resultSet.getString("Image");
	                Integer pendingTests = resultSet.getInt("PendingTests");
	                Integer createdTests = resultSet.getInt("CreatedTests");

	                Teacher_TestsModel userModel = new Teacher_TestsModel(userID, name, image, pendingTests, createdTests);
	                userModels.add(userModel);      
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return userModels;
	    }
	  
}
