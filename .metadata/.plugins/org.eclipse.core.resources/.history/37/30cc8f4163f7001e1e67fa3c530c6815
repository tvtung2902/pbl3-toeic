package com.pbl3.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;


public class VocabListsService extends BaseService{
	
	// query all vocablist
	public static LinkedList<VocabListsModel> all(int userID) {
		LinkedList<VocabListsModel> vocabListsModels = new LinkedList<VocabListsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vocabularylist WHERE userID = ? ORDER BY listID DESC;");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int listID = resultSet.getInt(1);
//				int userID = resultSet.getInt(2);
				Integer courseID = resultSet.getInt(3);
				String nameList = resultSet.getString(4);
				String description = resultSet.getString(5);
				VocabListsModel vocabListsModel = new VocabListsModel(listID, userID, courseID, nameList, description);   
				vocabListsModels.add(vocabListsModel);
//				System.out.println(vocabListsModels.get(0).getNameList());             
			}
			System.out.println("size cua list: " + vocabListsModels.size());
			return vocabListsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vocabListsModels;
	}
	
	// add vocablist
	public static void add(VocabListsModel vocabListsModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO vocabularylist (ListID, UserID, CourseID, NameList, Description) VALUES (?, ?, ?, ?, ?)"); 
			preparedStatement.setInt(1, vocabListsModel.getListID());
			preparedStatement.setInt(2, vocabListsModel.getUserID());
			if (vocabListsModel.getCourseID() != null) {
			    preparedStatement.setInt(3, vocabListsModel.getCourseID());
			} else {
			    preparedStatement.setObject(3, null);
			}
			preparedStatement.setString(4, vocabListsModel.getNameList());
			preparedStatement.setString(5, vocabListsModel.getDescription());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// delete 
	// delete
			public static void delete (int listID) {
				try {
					Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM vocabularylist WHERE listID = ?"); 
					preparedStatement.setInt(1, listID);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
	// edit
			public static void edit (VocabListsModel vocabListsModel) {	
				try {
					Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("UPDATE vocabularylist SET NameList = ?, Description= ? WHERE ListID =?"); 
					preparedStatement.setString(1, vocabListsModel.getNameList());
					preparedStatement.setString(2, vocabListsModel.getDescription());
					preparedStatement.setInt(3, vocabListsModel.getListID());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
}
