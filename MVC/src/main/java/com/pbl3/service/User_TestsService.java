package com.pbl3.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.User_TestsModel;
public class User_TestsService extends BaseService{
    public static LinkedList<User_TestsModel> getTestsForTeacher(int teacherId, String testNameKey) {
        LinkedList<User_TestsModel> testModels = new LinkedList<User_TestsModel>();
        try {
            Connection connection = getConnection();
            String query =  "SELECT " +
                    "test.TestName, " +
                    "test.status, " +
                    "test.testID, " +
                    "COUNT(historyoftest.HistoryOfTestID) AS NumberOfAttempts, " +
                    "COUNT(DISTINCT historyoftest.UserID) AS NumberOfUsers " +
                    "FROM test " +
                    "LEFT JOIN historyoftest ON test.TestID = historyoftest.TestID " +
                    "WHERE test.teacherID = ? And test.testName Like ?" +
                    "GROUP BY test.TestName, test.status, test.testID " +
                    "ORDER BY NumberOfAttempts DESC;"; 
 
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherId);
            preparedStatement.setString(2,"%" + testNameKey + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) { 
                String testName = resultSet.getString("TestName");
                int numberOfAttempts = resultSet.getInt("NumberOfAttempts");
                int numberOfUsers = resultSet.getInt("NumberOfUsers");
                boolean status = resultSet.getBoolean("status");
                int testsID = resultSet.getInt("testID");
                User_TestsModel userTestsModel = new User_TestsModel(testName, numberOfUsers, numberOfAttempts, status, testsID);
                testModels.add(userTestsModel);      
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return testModels;
    }
    
    public static LinkedList<Pair<Integer, Integer>> countTimesDateOfMonth() {
        LinkedList<Pair<Integer, Integer>> results = new LinkedList<>();
        try {
            Connection connection = getConnection();
            String query = "SELECT DAY(Date) AS Day, COUNT(*) AS NumberOfTests " +
                           "FROM HistoryOfTest " +
                           "WHERE YEAR(Date) = YEAR(CURDATE()) " +
                           "AND MONTH(Date) = MONTH(CURDATE()) " +
                           "GROUP BY DAY(Date) " +
                           "ORDER BY Day;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int day = resultSet.getInt("Day");
                int numberOfTests = resultSet.getInt("NumberOfTests");
                results.add(new Pair<>(day, numberOfTests));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    } 
    public static LinkedList<Pair<String, Integer>> countTimesMonthOfYear() {
        LinkedList<Pair<String, Integer>> results = new LinkedList<>();
        try {
            Connection connection = getConnection();
            String query = "SELECT DATE_FORMAT(Date, '%Y-%m') AS MonthYear, COUNT(*) AS NumberOfTests " +
                           "FROM HistoryOfTest " +
                           "WHERE Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) " +
                           "GROUP BY DATE_FORMAT(Date, '%Y-%m') " +
                           "ORDER BY DATE_FORMAT(Date, '%Y-%m');";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String monthYear = resultSet.getString("MonthYear");
                int numberOfTests = resultSet.getInt("NumberOfTests");
                results.add(new Pair<>(monthYear, numberOfTests));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public static LinkedList<User_TestsModel> search(String testNameKey) {
        LinkedList<User_TestsModel> testModels = new LinkedList<User_TestsModel>();
        try {
            Connection connection = getConnection();
            String query =  "SELECT " +
                    "test.TestName, " +
                    "test.status, " +
                    "test.testID, " +
                    "COUNT(historyoftest.HistoryOfTestID) AS NumberOfAttempts, " +
                    "COUNT(DISTINCT historyoftest.UserID) AS NumberOfUsers " +
                    "FROM test " +
                    "LEFT JOIN historyoftest ON test.TestID = historyoftest.TestID " +
                    "WHERE test.testName Like ?" +
                    "GROUP BY test.TestName, test.status, test.testID " +
                    "ORDER BY NumberOfAttempts DESC;"; 
 
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,"%" + testNameKey + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) { 
                String testName = resultSet.getString("TestName");
                int numberOfAttempts = resultSet.getInt("NumberOfAttempts");
                int numberOfUsers = resultSet.getInt("NumberOfUsers");
                boolean status = resultSet.getBoolean("status");
                int testsID = resultSet.getInt("testID");
                User_TestsModel userTestsModel = new User_TestsModel(testName, numberOfUsers, numberOfAttempts, status, testsID);
                testModels.add(userTestsModel);      
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return testModels;
    }
} 
