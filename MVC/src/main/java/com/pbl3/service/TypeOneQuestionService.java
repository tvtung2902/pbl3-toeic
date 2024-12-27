package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.pbl3.libs.Pair;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TypeOneQuestionModel;
import com.pbl3.model.TypeQuestionModel;
 
public class TypeOneQuestionService extends BaseService{
	//query all question type one: result
	public static void allTypeOneQuestionResult(int historyOftestID, int testsID, ArrayList<Pair<QuestionModel, String>> pairs) {
	    try {       
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT Question.*, TypeOneQuestion.Audio, TypeOneQuestion.Transcript, H.Answer FROM (SELECT historyoftest_question.QuestionID, historyoftest_question.Answer FROM historyoftest_question WHERE HistoryoftestID = ?) AS H RIGHT JOIN question ON H.QuestionID = question.QuestionID INNER JOIN TypeOneQuestion ON Question.QuestionID = TypeOneQuestion.questionID WHERE question.TestID = ? Order By Question.OrderNumber ASC");
	        preparedStatement.setInt(1, historyOftestID);
	        preparedStatement.setInt(2, testsID);   
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt("questionID");
	            Integer typeQuestionID = resultSet.getInt("typeQuestionID");
	            String answerCorrect = resultSet.getString("answerCorrect");
	            String answerExplain = resultSet.getString("answerExplain"); 
	            int orderNumber = resultSet.getInt("orderNumber");
	            String image = resultSet.getString("image");
	            String audio = resultSet.getString("audio"); 
	            String transcript = resultSet.getString("transcript");
	            Integer dataQuestionID = resultSet.getInt("DataQuestionID");
	            TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(questionID, typeQuestionID, 0, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, audio, transcript) ;
	            String answer = resultSet.getString("answer");
	            Pair<QuestionModel, String> pair = new Pair<>(typeOneQuestionModel, answer);
	            pairs.add(pair);
	        } 
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// query all question : start 
	public static void allTypeOneQuestionStart(int testID, QuestionModel[] questionModels) {
	    try {       
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT Question.*, TypeOneQuestion.Audio, TypeOneQuestion.Transcript FROM Question INNER JOIN TypeOneQuestion ON Question.QuestionID = TypeOneQuestion.questionID WHERE Question.TestID = ?");
	        preparedStatement.setInt(1, testID);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt("questionID");
	            Integer typeQuestionID = resultSet.getInt("typeQuestionID");
	            String answerCorrect = resultSet.getString("answerCorrect");
	            String answerExplain = resultSet.getString("answerExplain"); 
	            int orderNumber = resultSet.getInt("orderNumber");
	            String image = resultSet.getString("image");
	            String audio = resultSet.getString("audio"); 
	            String transcript = resultSet.getString("transcript");
	            Integer dataQuestionID = resultSet.getInt("DataQuestionID");
	            TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(questionID, typeQuestionID, 0, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, null, audio, transcript) ;
	            questionModels[typeOneQuestionModel.getOrderNumber() - 1] = typeOneQuestionModel;
	        } 
	        System.out.println("size cua typeOneQuestionModels: " + questionModels.length);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// query all question type one and type question in 1 test - teacher
	public static void allTypeOneQuestion(int testID, int begin, int end, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT Question.*, TypeQuestion.TypeQuestionName, TypeOneQuestion.Audio, TypeOneQuestion.Transcript FROM TypeQuestion INNER JOIN Question ON TypeQuestion.TypeQuestionID = Question.TypeQuestionID INNER JOIN TypeOneQuestion ON Question.QuestionID = TypeOneQuestion.questionID WHERE  Question.TestID = ? AND Question.OrderNumber >= ? AND Question.OrderNumber <= ?");
	        preparedStatement.setInt(1, testID);
	        preparedStatement.setInt(2, begin);
	        preparedStatement.setInt(3, end);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt("questionID");
	            Integer typeQuestionID = resultSet.getInt("typeQuestionID");
	            String answerCorrect = resultSet.getString("answerCorrect");
	            String answerExplain = resultSet.getString("answerExplain"); 
	            int orderNumber = resultSet.getInt("orderNumber");
	            String image = resultSet.getString("image");
	            String typeQuestionName = resultSet.getString("typeQuestionName");
	            System.out.println(typeQuestionName);
	            String audio = resultSet.getString("audio"); 
	            String transcript = resultSet.getString("transcript");
	            Integer dataQuestionID = resultSet.getInt("DataQuestionID");
	            TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName);
	            TypeOneQuestionModel typeOneQuestionModel = new TypeOneQuestionModel(questionID, typeQuestionID, 0, answerCorrect, answerExplain, orderNumber, image, typeQuestionModel, dataQuestionID, null, audio, transcript) ;
	            questionModels[typeOneQuestionModel.getOrderNumber() - begin + 1] = typeOneQuestionModel;
	        } 
	        System.out.println("size cua typeOneQuestionModels: " + questionModels.length);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// add type one question
	public static void add(TypeOneQuestionModel typeOneQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO TypeOneQuestion (QuestionID, Audio, Transcript) VALUES (?, ?, ?)"); 
	        preparedStatement.setInt(1, typeOneQuestionModel.getQuestionID());
	        preparedStatement.setString(2, typeOneQuestionModel.getAudio());
	        preparedStatement.setString(3, typeOneQuestionModel.getTranscript());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {  
	        e.printStackTrace();
	    }
	}
	
	// edit type one question
	
	public static void edit(TypeOneQuestionModel typeOneQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE TypeOneQuestion SET Audio = ?, Transcript = ? WHERE QuestionID = ?");
	        preparedStatement.setString(1, typeOneQuestionModel.getAudio()); 
	        preparedStatement.setString(2, typeOneQuestionModel.getTranscript()); 
	        preparedStatement.setInt(3, typeOneQuestionModel.getQuestionID());
	        preparedStatement.executeUpdate();   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}