package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException; 
import com.pbl3.model.HistoryOfTest_QuestionModel;

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
}