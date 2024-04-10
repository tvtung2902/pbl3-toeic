package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.HistoryOfTest_QuestionModel;
import com.pbl3.model.QuestionModel;

public class HistoryOfTest_QuestionService extends BaseService{
	// add
	public static void add(HistoryOfTest_QuestionModel historyOfTest_QuestionModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO historyoftest_question (historyOfTestID, questionID, answer) VALUES (?, ?, ?)");
			preparedStatement.setInt(1, historyOfTest_QuestionModel.getHistoryOfTestID());
			preparedStatement.setInt(2, historyOfTest_QuestionModel.getQuestionID());
			preparedStatement.setString(3, historyOfTest_QuestionModel.getAnswer());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//query all question 
	public static LinkedList<HistoryOfTest_QuestionModel> all(int historyOfTestID) {
		LinkedList<HistoryOfTest_QuestionModel> historyOfTest_QuestionModels = new LinkedList<HistoryOfTest_QuestionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM historyoftest_question WHERE historyOfTestID = ?;");
			preparedStatement.setInt(1, historyOfTestID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				System.out.println("vao while");
				int historyoftestID = resultSet.getInt(1);
				int questionID = resultSet.getInt(2);
				String answer = resultSet.getString(3);
				HistoryOfTest_QuestionModel historyOfTest_QuestionModel = new HistoryOfTest_QuestionModel(historyoftestID, questionID, answer);             
				System.out.println("HistoryOfTest_QuestionModel vua query duoc co questionID la: " +historyOfTest_QuestionModel.getQuestionID());
				historyOfTest_QuestionModels.add(historyOfTest_QuestionModel);
			}
			System.out.println("size cua tests: " + historyOfTest_QuestionModels.size());
			return historyOfTest_QuestionModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return historyOfTest_QuestionModels;
	}
}