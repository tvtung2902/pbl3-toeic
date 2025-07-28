package com.pbl3.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.model.VocabListsModel;



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
				int listID = resultSet.getInt("listID");
				Integer UserID = resultSet.getInt("UserID");
				String nameList = resultSet.getString("nameList");
				String description = resultSet.getString("description");
				VocabListsModel vocabListsModel = new VocabListsModel(listID, UserID, nameList, description);
				vocabListsModels.add(vocabListsModel);          
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
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO vocabularylist (UserID, NameList, Description) VALUES (?, ?, ?)"); 
			preparedStatement.setInt(1, vocabListsModel.getUserID());
			preparedStatement.setString(2, vocabListsModel.getNameList());
			preparedStatement.setString(3, vocabListsModel.getDescription());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
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
			
		//find
			public static VocabListsModel find(int ListID) {
				VocabListsModel vocabListsModel= new VocabListsModel();
				try {
					Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("Select * from vocabularylist where ListID =?");
					preparedStatement.setInt(1, ListID);
					ResultSet resultSet =preparedStatement.executeQuery();
					if(resultSet.next()) {
						vocabListsModel.setListID(ListID);
						vocabListsModel.setNameList(resultSet.getString("NameList"));
						vocabListsModel.setDescription(resultSet.getString("Description"));
						vocabListsModel.setUserID(resultSet.getInt("UserID"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return vocabListsModel;
			}
			//find
			public static int count(int ListID) {
				int k=0;
				try {
					Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement("Select count(*) from vocabulary where ListID =?");
					preparedStatement.setInt(1, ListID);
					ResultSet resultSet =preparedStatement.executeQuery();
					if(resultSet.next()) {
						k=resultSet.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return k;
			}
}
