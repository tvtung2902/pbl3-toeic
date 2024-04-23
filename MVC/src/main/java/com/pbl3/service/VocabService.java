package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.LinkedList;

import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;

public class VocabService extends BaseService{
	
	// query all vocab in list
		public static LinkedList<VocabModel> all(int listID) {
			LinkedList<VocabModel> vocabModels = new LinkedList<VocabModel>();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT vocabulary.*, review.status FROM vocabulary left join review on vocabulary.VocabID = review.VocabID WHERE listID = ? ORDER BY vocabID DESC");
				preparedStatement.setInt(1, listID);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					 int vocabID = resultSet.getInt(1);
//					 int listID = resultSet.getInt(2);
					 String vocab = resultSet.getString(3);
					 String mean = resultSet.getString(4);
					 String wordType = resultSet.getString(5); 
					 String example = resultSet.getString(6);
					 String pronunciation = resultSet.getString(7);
					 String image = resultSet.getString(8);
					 Boolean status = resultSet.getBoolean(9);  
					 VocabModel vocabModel = new VocabModel(vocabID, listID, vocab, mean, wordType, example, pronunciation, image, status);
					 vocabModels.add(vocabModel);	             
				}
				System.out.println("size cua vocab in list: " + vocabModels.size());
				return vocabModels;  
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vocabModels;
		}
		
		//add 
		public static void add(VocabModel vocabModel) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO vocabulary (ListID, Vocab, Mean, WordType, Example, pronunciation, Image) VALUES (?, ?, ?, ?, ?, ?, ?)"); 
				preparedStatement.setInt(1, vocabModel.getListID());
				preparedStatement.setString(2, vocabModel.getVocab());
				preparedStatement.setString(3, vocabModel.getMean());
				preparedStatement.setString(4, vocabModel.getWordType());
				preparedStatement.setString(5, vocabModel.getExample());
				preparedStatement.setString(6, vocabModel.getPronunciation());
				preparedStatement.setString(7, vocabModel.getImage()); 
				preparedStatement.executeUpdate(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// delete
		public static void delete (int vocabID) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM vocabulary WHERE vocabID = ?"); 
				preparedStatement.setInt(1, vocabID);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// find : id
		public static VocabModel find(int vocabID) {
			VocabModel vocabModel = new VocabModel();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vocabulary WHERE vocabID = ?"); 
				preparedStatement.setInt(1, vocabID);
				ResultSet resultSet = preparedStatement.executeQuery();
				resultSet.next();
//				int vocabID = resultSet.getInt(1);
				int listID = resultSet.getInt(2);
				String vocab = resultSet.getString(3);
				String mean = resultSet.getString(4);
				String wordType = resultSet.getString(5); 
				String example = resultSet.getString(6);
				vocabModel.setVocabID(vocabID);
				vocabModel.setListID(listID);
				vocabModel.setVocab(vocab);
				vocabModel.setMean(mean);
				vocabModel.setWordType(wordType);
				vocabModel.setExample(example);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vocabModel;
		}
		
	   // edit
		public static void edit (VocabModel vocabModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE vocabulary SET vocab = ?, mean= ?, wordType = ?, example = ?, pronunciation = ?, image = ? WHERE vocabID =?"); 
				preparedStatement.setString(1, vocabModel.getVocab());
				preparedStatement.setString(2, vocabModel.getMean());
				preparedStatement.setString(3, vocabModel.getWordType());
				preparedStatement.setString(4, vocabModel.getExample());
				preparedStatement.setString(5, vocabModel.getPronunciation());
				preparedStatement.setString(6, vocabModel.getImage()); 
				preparedStatement.setInt(7, vocabModel.getVocabID());
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		//lấy top 10
		public static LinkedList<VocabModel> getVocabReview(int listID,int userID) {
			LinkedList<VocabModel> vocabModels = new LinkedList<VocabModel>();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select  vocabulary.* from vocabulary  inner join vocabularylist \r\n"
						+ "on vocabulary.ListID=vocabularylist.ListID where vocabularylist.UserID=? \r\n"
						+ "and  vocabulary.listid=? and (vocabid) not in \r\n"
						+ "(select vocabid from review where status = 1)\r\n"
						+ "order by VocabID asc limit 10;");
				preparedStatement.setInt(1, userID);
				preparedStatement.setInt(2, listID);	
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					 int vocabID = resultSet.getInt(1);
//					 int listID = resultSet.getInt(2);
					 String vocab = resultSet.getString(3);
					 String mean = resultSet.getString(4);
					 String wordType = resultSet.getString(5); 
					 String example = resultSet.getString(6);
					 String pronunciation = resultSet.getString(7);
					 String image = resultSet.getString(8);
					 VocabModel vocabModel = new VocabModel(vocabID, listID, vocab, mean, wordType, example, pronunciation, image, null);
					 vocabModels.add(vocabModel);	             
				}
				System.out.println("size cua vocab in list: " + vocabModels.size());
				return vocabModels; 
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vocabModels;
		}
		//lấy từ đã học
		//lấy top 10
		public static LinkedList<VocabModel> getVocabReviewed(int listID,int userID) {
			LinkedList<VocabModel> vocabModels = new LinkedList<VocabModel>();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select vocabulary.* from vocabulary inner join review on review.vocabid=vocabulary.vocabid where status=1 and\r\n"
						+ "userid=? and vocabulary.listid =? order by vocabid");
				preparedStatement.setInt(1, userID);
				preparedStatement.setInt(2, listID);
				ResultSet resultSet = preparedStatement.executeQuery(); 
				while(resultSet.next()) {
					 int vocabID = resultSet.getInt(1);  
//					 int listID = resultSet.getInt(2);
					 String vocab = resultSet.getString(3);
					 String mean = resultSet.getString(4);
					 String wordType = resultSet.getString(5); 
					 String example = resultSet.getString(6);
					 String pronunciation = resultSet.getString(7);
					 String image = resultSet.getString(8);
					 VocabModel vocabModel = new VocabModel(vocabID, listID, vocab, mean, wordType, example, pronunciation, image, null);
					 vocabModels.add(vocabModel);	             
				}
				System.out.println("size cua vocab in list: " + vocabModels.size());
				return vocabModels; 
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vocabModels;
		}
}
