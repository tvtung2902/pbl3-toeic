package com.pbl3.service;
import java.sql.*;
import java.util.LinkedList;
import com.pbl3.libs.Pair;

import java.sql.Date; 
public class StatisticsService extends BaseService{
	   public static LinkedList<Pair<Date, Double>> countDaily(String str, Date begin, Date end) {
	        LinkedList<Pair<Date, Double>> results = new LinkedList<>();
	        try {
	            Connection connection = getConnection();
	            String query = "SELECT DATE(ConfirmDate) AS Date, SUM(" + str +  ") AS Daily " +
	                           "FROM register_course " +
	                           "WHERE (DATE(ConfirmDate) BETWEEN ? AND ?) AND Status LIKE 'confirmed' " +
	                           "GROUP BY DATE(ConfirmDate)";
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setDate(1, begin);
	            preparedStatement.setDate(2, end);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                Date date = resultSet.getDate("Date"); 
	                Double sta = resultSet.getDouble("Daily");
	                results.add(new Pair<>(date, sta));
	            }
	            connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return results;
	    }
	   
	   public static LinkedList<Pair<Date, Double>> countDailyTeacher(String str, Date begin, Date end, int teacherID) {
	        LinkedList<Pair<Date, Double>> results = new LinkedList<>();
	        try {
	            Connection connection = getConnection();
	            String query = "SELECT DATE(ConfirmDate) AS Date, SUM(" + str +  ") AS Daily " +
	                           "FROM register_course " +
	                           "WHERE (DATE(ConfirmDate) BETWEEN ? AND ?) AND Status LIKE 'confirmed' " + 
	                           "And teacherID = ? " +
	                           "GROUP BY DATE(ConfirmDate)";
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setDate(1, begin);
	            preparedStatement.setDate(2, end);
	            preparedStatement.setInt(3, teacherID);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                Date date = resultSet.getDate("Date"); 
	                Double sta = resultSet.getDouble("Daily");
	                results.add(new Pair<>(date, sta));
	            }
	            connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return results;
	    }
	   
	   public static void main(String[] args) {
		   System.err.println(countDailyTeacher( "TotalAmountOfTeacher",Date.valueOf("2024-06-05"),Date.valueOf("2024-06-05"), 53).size());
	}
}


