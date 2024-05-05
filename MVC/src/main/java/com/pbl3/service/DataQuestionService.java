package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.model.DataQuestionModel;


public class DataQuestionService extends BaseService{
	// query all DataQuestionModel in 1 part
	public static LinkedList<DataQuestionModel> all(int testsID, int orderNumberPart) {
		LinkedList<DataQuestionModel> dataQuestionModels = new LinkedList<DataQuestionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT dataquestion.*  From dataquestion Where  TestsID = ? && OrderNumberPart = ?  ORDER BY OrderNumber ASC");
			preparedStatement.setInt(1, testsID);
			preparedStatement.setInt(2, orderNumberPart);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int dataQuestionID = resultSet.getInt(1);
				String dataQuestion = resultSet.getString(2); 
				String transcript = resultSet.getString(3); 
//				int testsID = resultSet.getInt(4);
//				int orderNumberPaer = resultSet.getInt(5);
				int orderNumber = resultSet.getInt(6);
				DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, testsID, orderNumberPart, orderNumber);      
				dataQuestionModels.add(dataQuestionModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dataQuestionModels;
	}
	
	// add 
	public static void add(DataQuestionModel dataQuestionModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO DataQuestion (DataQuestion, Transcript, TestsID, OrderNumberPart, OrderNumber) VALUES (?, ?, ?, ?, ?)"); 
			preparedStatement.setString(1, dataQuestionModel.getDataQuestion());
			preparedStatement.setString(2, dataQuestionModel.getTranscript());
			preparedStatement.setInt(3, dataQuestionModel.getTestsID());
			preparedStatement.setInt(4, dataQuestionModel.getOrderNumberPart());
			preparedStatement.setInt(5,dataQuestionModel.getOrderNumber());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// delete
	public static void delete(int dataQuestionID) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM DataQuestion WHERE dataQuestionID = ?"); 
			preparedStatement.setInt(1, dataQuestionID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// edit
	public static void edit (DataQuestionModel dataQuestionModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("UPDATE DataQuestion SET DataQuestion = ?, Transcript= ? WHERE DataQuestionID =?");
			preparedStatement.setString(1, dataQuestionModel.getDataQuestion());
			preparedStatement.setString(2, dataQuestionModel.getTranscript());
			preparedStatement.setInt(3, dataQuestionModel.getDataQuestionID());
			System.out.println("getDataQuestionID" +dataQuestionModel.getDataQuestionID());
			preparedStatement.executeUpdate();  
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
