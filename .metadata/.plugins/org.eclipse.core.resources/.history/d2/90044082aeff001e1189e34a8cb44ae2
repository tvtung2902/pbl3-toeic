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
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vocabulary WHERE listID = ? ORDER BY vocabID DESC;");
				preparedStatement.setInt(1, listID);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					 int vocabID = resultSet.getInt(1);
//					 int listID = resultSet.getInt(2);
					 String vocab = resultSet.getString(3);
					 String mean = resultSet.getString(4);
					 String wordType = resultSet.getString(5); 
					 String example = resultSet.getString(6);
					 VocabModel vocabModel = new VocabModel(vocabID, listID, vocab, mean, wordType, example);
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
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO vocabulary (ListID, Vocab, Mean, WordType, Example) VALUES (?, ?, ?, ?, ?)"); 
				preparedStatement.setInt(1, vocabModel.getListID());
				preparedStatement.setString(2, vocabModel.getVocab());
				preparedStatement.setString(3, vocabModel.getMean());
				preparedStatement.setString(4, vocabModel.getWordType());
				preparedStatement.setString(5, vocabModel.getExample());
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
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE vocabulary SET vocab = ?, mean= ?, wordType = ?, example = ? WHERE vocabID =?"); 
				preparedStatement.setString(1, vocabModel.getVocab());
				preparedStatement.setString(2, vocabModel.getMean());
				preparedStatement.setString(3, vocabModel.getWordType());
				preparedStatement.setString(4, vocabModel.getExample());
				preparedStatement.setInt(5, vocabModel.getVocabID());
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
