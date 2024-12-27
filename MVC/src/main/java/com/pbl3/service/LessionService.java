package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.pbl3.model.LessionModel;
import com.pbl3.model.VocabListsModel;

public class LessionService extends BaseService{
	public static ArrayList<LessionModel> getLessionForSidebar(int courseID,int partID) {
		ArrayList<LessionModel> arrayList =new ArrayList<LessionModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM lession where courseid=? and partid=?");
			preparedStatement.setInt(1, courseID);
			preparedStatement.setInt(2, partID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int lessionID = resultSet.getInt("lessionID");
				String lessionName = resultSet.getString("LessionName");
				String video = resultSet.getString("video");
				int orderNumber= resultSet.getInt("orderNumber");
				LessionModel lessionModel=new LessionModel(lessionID, courseID, partID, lessionName, orderNumber, video, null, null);
				arrayList.add(lessionModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	public static LessionModel getLessionByID(int lessionID){
		LessionModel lessionModel = new LessionModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT lession.*, vocabularylist.NameList, vocabularylist.Description FROM lession left join vocabularylist on lession.ListID = vocabularylist.ListID where lession.lessionid= ?");
			preparedStatement.setInt(1, lessionID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int courseID = resultSet.getInt("courseID");
				int partID = resultSet.getInt("partID");
				String lessionName = resultSet.getString("lessionName");
				String video = resultSet.getString("video");
				int orderNumber = resultSet.getInt("orderNumber");
				String exercise = resultSet.getString("exercise");
				Integer listID = resultSet.getInt("listID");
				String namelist=resultSet.getString("namelist");
				String description=resultSet.getString("description");
				VocabListsModel vocabListsModel;
				if(listID == 0) {
					vocabListsModel = null;
				}
				else {
					vocabListsModel = new VocabListsModel(listID, 0 , namelist, description);
				} 
				
				lessionModel.setLessionID(lessionID);
				lessionModel.setCourseID(courseID);
				lessionModel.setPartID(partID);
				lessionModel.setLessionName(lessionName);
				lessionModel.setVideo(video);   
				lessionModel.setOrderNumber(orderNumber);
				lessionModel.setVocabListsModel(vocabListsModel);
				lessionModel.setExercise(exercise);
				System.err.println("11" +lessionModel.getExercise());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lessionModel;
	}
	public static void add(LessionModel l) {
		try {
			Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"INSERT INTO lession (CourseID, lessionname, Video, OrderNumber, PartID, ListID, Exercise) VALUES (?, ?, ?, ?, ?, ?, ?)");
				preparedStatement.setInt(1, l.getCourseID());
				preparedStatement.setString(2, l.getLessionName());
				preparedStatement.setString(3, l.getVideo());
				preparedStatement.setInt(4, l.getOrderNumber());
				preparedStatement.setInt(5, l.getPartID());
				if(l.getVocabListsModel()!= null) {	
					preparedStatement.setInt(6,l.getVocabListsModel().getListID());
				} 
				else {
					preparedStatement.setObject(6, null);
				}
				preparedStatement.setString(7, l.getExercise());
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void edit(LessionModel l) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("UPDATE lession SET lessionname = ?, Video = ? , ordernumber=? , Listid=?, exercise = ? WHERE lessionid=?");
			if (l.getLessionName() == null) preparedStatement.setObject(1, null);
			else preparedStatement.setString(1, l.getLessionName());
			if (l.getVideo() == null) preparedStatement.setObject(2, null);
			else preparedStatement.setString(2, l.getVideo());
			preparedStatement.setInt(3, l.getOrderNumber());
			if (l.getVocabListsModel() == null) preparedStatement.setObject(4, null);
			else preparedStatement.setInt(4, l.getVocabListsModel().getListID());
			if (l.getExercise() == null) preparedStatement.setObject(5, null);
			else preparedStatement.setString(5, l.getExercise());
			preparedStatement.setInt(6, l.getLessionID());   
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// delete
	public static void delete (int lessionID) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM lession WHERE lessionid = ?"); 
			preparedStatement.setInt(1, lessionID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
