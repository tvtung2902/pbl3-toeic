package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;

public class QuestionService extends BaseService{
	// query all question in 1 test
	public static LinkedList<QuestionModel> all(int testID) {
		LinkedList<QuestionModel> questionModels = new LinkedList<QuestionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM question WHERE TestID = ? ORDER BY OrderNumber ASC;");
			preparedStatement.setInt(1, testID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int questionID = resultSet.getInt(1);
				Integer assignmentID = resultSet.getInt(2);
//				Integer testID;
				String questionContent = resultSet.getString(4);
				String contentAnswerA = resultSet.getString(5);
				String contentAnswerB = resultSet.getString(6);
				String contentAnswerC = resultSet.getString(7);
				String ContentAnswerD = resultSet.getString(8);
				String AnswerCorrect = resultSet.getString(9);
				String AnswerExplain = resultSet.getString(10) ;
				int OrderNumber = resultSet.getInt(11);
				
				QuestionModel questionModel = new QuestionModel(questionID, assignmentID, testID, questionContent, contentAnswerA, contentAnswerB, contentAnswerC, ContentAnswerD, AnswerCorrect, AnswerExplain, OrderNumber);   
				questionModels.add(questionModel);             
			}
			System.out.println("size cua tests: " + questionModels.size());
			return questionModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questionModels;
	}
}
