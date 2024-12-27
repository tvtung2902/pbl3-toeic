package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.DataQuestionModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TypeQuestionModel;
import com.pbl3.model.TypeTwoQuestionModel;

public class TypeTwoQuestionService extends BaseService{
	// query result
	public static void allTypeTwoQuestionResult(int historyOftestID, int testsID, ArrayList<Pair<QuestionModel, String>> pairs) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT question.*, typetwoquestion.ContentAnswerA, typetwoquestion.ContentAnswerB, typetwoquestion.ContentAnswerC, typetwoquestion.ContentAnswerD, typetwoquestion.QuestionContent, dataquestion.DataQuestion, dataquestion.Transcript, dataquestion.OrderNumberPart, dataquestion.OrderNumber, H.Answer FROM (SELECT historyoftest_question.* FROM historyoftest_question WHERE HistoryoftestID = ?) AS H RIGHT JOIN question ON H.QuestionID = question.QuestionID  INNER JOIN typetwoquestion ON question.questionID = typetwoquestion.questionID LEFT JOIN dataquestion ON question.DataQuestionID = dataquestion.DataQuestionID WHERE question.TestID = ? Order By Question.OrderNumber ASC");
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
	            int dataQuestionID = resultSet.getInt("dataQuestionID");   
	            String contentAnswerA = resultSet.getString("contentAnswerA");
	            String contentAnswerB = resultSet.getString("contentAnswerB");
	            String contentAnswerC = resultSet.getString("contentAnswerC");
	            String contentAnswerD = resultSet.getString("contentAnswerD");
	            String questionContent = resultSet.getString("questionContent");
	            String dataQuestion = resultSet.getString("dataQuestion");
	            String transcript = resultSet.getString("transcript");
	            int orderNumberPart = resultSet.getInt("orderNumberPart"); 
	            int orderNumberData = resultSet.getInt("orderNumber");
	            DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, 0, orderNumberPart, orderNumberData);
	            TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel (questionID, typeQuestionID, 0, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, dataQuestionModel, contentAnswerA, contentAnswerB, contentAnswerC, contentAnswerD, questionContent);
	            String answer = resultSet.getString("answer");
	            Pair<QuestionModel, String> pair = new Pair<>(typeTwoQuestionModel, answer);
	            pairs.add(pair);
	        }   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// query start
	public static void allTypeTwoQuestionStart(int testID, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT question.*, typetwoquestion.ContentAnswerA, typetwoquestion.ContentAnswerB, typetwoquestion.ContentAnswerC, typetwoquestion.ContentAnswerD, typetwoquestion.QuestionContent, dataquestion.DataQuestion, dataquestion.Transcript, dataquestion.OrderNumberPart, dataquestion.OrderNumber FROM question  INNER JOIN typetwoquestion ON question.questionID = typetwoquestion.questionID LEFT JOIN dataquestion ON question.DataQuestionID = dataquestion.DataQuestionID WHERE Question.TestID = ?");
	        preparedStatement.setInt(1, testID); 
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int questionID = resultSet.getInt("questionID");
	            Integer typeQuestionID = resultSet.getInt("typeQuestionID");
	            String answerCorrect = resultSet.getString("answerCorrect");
	            String answerExplain = resultSet.getString("answerExplain"); 
	            int orderNumber = resultSet.getInt("orderNumber");
	            String image = resultSet.getString("image");
	            int dataQuestionID = resultSet.getInt("dataQuestionID");   
	            String contentAnswerA = resultSet.getString("contentAnswerA");
	            String contentAnswerB = resultSet.getString("contentAnswerB");
	            String contentAnswerC = resultSet.getString("contentAnswerC");
	            String contentAnswerD = resultSet.getString("contentAnswerD");
	            String questionContent = resultSet.getString("questionContent");
	            String dataQuestion = resultSet.getString("dataQuestion");
	            String transcript = resultSet.getString("transcript");
	            int orderNumberPart = resultSet.getInt("orderNumberPart");
	            int orderNumberData = resultSet.getInt("orderNumber");
	            DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, testID, orderNumberPart, orderNumberData);
	            TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel (questionID, typeQuestionID, testID, answerCorrect, answerExplain, orderNumber, image, null, dataQuestionID, dataQuestionModel, contentAnswerA, contentAnswerB, contentAnswerC, contentAnswerD, questionContent);
	            questionModels[typeTwoQuestionModel.getOrderNumber() - 1] = typeTwoQuestionModel;
	        }   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// query all question type one and type question in 1 test  
	public static void allTypeTwoQuestion(int testID, int begin, int end, QuestionModel[] questionModels) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT question.*, TypeQuestion.TypeQuestionName, typetwoquestion.ContentAnswerA, typetwoquestion.ContentAnswerB, typetwoquestion.ContentAnswerC, typetwoquestion.ContentAnswerD, typetwoquestion.QuestionContent, dataquestion.DataQuestion, dataquestion.Transcript, dataquestion.OrderNumberPart, dataquestion.OrderNumber FROM typequestion INNER JOIN  question ON typequestion.typequestionID = question.typequestionID INNER JOIN typetwoquestion ON question.questionID = typetwoquestion.questionID LEFT JOIN dataquestion ON question.DataQuestionID = dataquestion.DataQuestionID WHERE Question.TestID = ? AND Question.OrderNumber >= ? AND Question.OrderNumber <= ?");
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
	            int dataQuestionID = resultSet.getInt("dataQuestionID");   
	            String contentAnswerA = resultSet.getString("contentAnswerA");
	            String contentAnswerB = resultSet.getString("contentAnswerB"); 
	            String contentAnswerC = resultSet.getString("contentAnswerC");
	            String contentAnswerD = resultSet.getString("contentAnswerD");
	            String questionContent = resultSet.getString("questionContent");
	            String dataQuestion = resultSet.getString("dataQuestion");
	            String transcript = resultSet.getString("transcript");
	            int orderNumberPart = resultSet.getInt("orderNumberPart");
	            int orderNumberData = resultSet.getInt("orderNumber");
	            TypeQuestionModel typeQuestionModel = new TypeQuestionModel(typeQuestionID, typeQuestionName);
	            DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, dataQuestion, transcript, testID, orderNumberPart, orderNumberData);
	            TypeTwoQuestionModel typeTwoQuestionModel = new TypeTwoQuestionModel (questionID, typeQuestionID, testID, answerCorrect, answerExplain, orderNumber, image, typeQuestionModel, dataQuestionID, dataQuestionModel, contentAnswerA, contentAnswerB, contentAnswerC, contentAnswerD, questionContent);
	            questionModels[typeTwoQuestionModel.getOrderNumber() - begin + 1] = typeTwoQuestionModel;
	            
	        }   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	// add type two question  
	public static void add(TypeTwoQuestionModel typeTwoQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO TypeTwoQuestion (QuestionID, ContentAnswerA, ContentAnswerB, ContentAnswerC, ContentAnswerD, QuestionContent) VALUES (?, ?, ?, ?, ?, ?)"); 
	        preparedStatement.setInt(1, typeTwoQuestionModel.getQuestionID());  
	        preparedStatement.setString(2, typeTwoQuestionModel.getContentAnswerA()); 
	        preparedStatement.setString(3, typeTwoQuestionModel.getContentAnswerB()); 
	        preparedStatement.setString(4, typeTwoQuestionModel.getContentAnswerC());
	        preparedStatement.setString(5, typeTwoQuestionModel.getContentAnswerD());  
	        preparedStatement.setString(6, typeTwoQuestionModel.getQuestionContent());
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {   
	        e.printStackTrace();  
	    }        
	}

	     
//	 edit type two question 
	public static void edit(TypeTwoQuestionModel typeTwoQuestionModel) {
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE TypeTwoQuestion SET ContentAnswerA = ?, ContentAnswerB = ?, ContentAnswerC = ?, ContentAnswerD = ?, QuestionContent = ? WHERE QuestionID = ?");
	        preparedStatement.setString(1, typeTwoQuestionModel.getContentAnswerA());   
	        preparedStatement.setString(2, typeTwoQuestionModel.getContentAnswerB());
	        preparedStatement.setString(3, typeTwoQuestionModel.getContentAnswerC());
	        preparedStatement.setString(4, typeTwoQuestionModel.getContentAnswerD());
	        preparedStatement.setString(5, typeTwoQuestionModel.getQuestionContent());
	        preparedStatement.setInt(6, typeTwoQuestionModel.getQuestionID());
	        preparedStatement.executeUpdate();   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public static void format(int testsID) {
		QuestionModel[] questionModels = new QuestionModel[55];
		for (int i = 0; i < 55; i++) {
				questionModels[i] = new TypeTwoQuestionModel();

		}
		TypeTwoQuestionService.allTypeTwoQuestion(testsID, 147, 200, questionModels);
		LinkedList<DataQuestionModel> dataQuestionModels =  DataQuestionService.all(testsID, 7);
		ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>> arrayList = new ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>>();
		for(DataQuestionModel dataQuestionModel : dataQuestionModels) {  
			LinkedList<QuestionModel> list = new LinkedList<QuestionModel>();
			for (QuestionModel questionModel : questionModels) {
				System.err.println(questionModel);
				if((questionModel.getDataQuestionID()== dataQuestionModel.getDataQuestionID())&&questionModel.getQuestionID()!=0) {
					list.add(questionModel);
				}
			}		
			Pair<DataQuestionModel, LinkedList<QuestionModel>> pair = new Pair<DataQuestionModel, LinkedList<QuestionModel>>(dataQuestionModel, list);
			arrayList.add(pair);
		}
		int lastQuession=147;
		int lastDataQuession=1;
		for (Pair<DataQuestionModel, LinkedList<QuestionModel>> pair : arrayList) {
			if(pair.getFirst().getOrderNumber()!=lastDataQuession) {
				pair.getFirst().setOrderNumber(lastDataQuession);
				DataQuestionService.edit(pair.getFirst());
			}
				lastDataQuession++;
			for (QuestionModel q : pair.getSecond()) {
				if(q.getOrderNumber()==lastQuession) {
					lastQuession++;
					continue;
				}else {
					q.setOrderNumber(lastQuession);
					QuestionService.edit(q);
					lastQuession++;
				}
			}
		}
	}
}
