package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.model.TestsModel;

public class TestsService extends BaseService {

	// query all tests
	public static LinkedList<TestsModel> all() {
		LinkedList<TestsModel> testsModels = new LinkedList<TestsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM test WHERE status = 1 ORDER BY testID DESC;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int testID = resultSet.getInt(1);
				String testsName = resultSet.getString(2);
				TestsModel testsModel = new TestsModel ();
				testsModel.setTestsID(testID);
				testsModel.setTestsName(testsName);
				testsModels.add(testsModel);             
			}
			System.out.println("size cua tests: " + testsModels.size());
			return testsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testsModels;
	}
	
	// query all tests of teacher 
	public static LinkedList<TestsModel> all(int teacherID) {
		LinkedList<TestsModel> testsModels = new LinkedList<TestsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM test WHERE teacherID = ? ORDER BY testID DESC;");
			preparedStatement.setInt(1, teacherID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) { 
				int testID = resultSet.getInt("testID");
				String testsName = resultSet.getString("testName");
				String audio = resultSet.getString("audio");
				boolean status = resultSet.getBoolean("status");
				TestsModel testsModel = new TestsModel(testID, testsName, status, teacherID, audio);   
				testsModels.add(testsModel);             
			}
			System.out.println("size cua tests: " + testsModels.size());
			return testsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testsModels;
	}
	
	// add tests
	  public static void add(TestsModel testsModel) {
	        try {
	            Connection connection = getConnection(); // Thay thế getConnection() bằng phương thức lấy kết nối tới cơ sở dữ liệu của bạn
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO test (TestName, Audio, Status, TeacherID) VALUES (?, ?, ?, ?)");
	            preparedStatement.setString(1, testsModel.getTestsName());
	            preparedStatement.setString(2, testsModel.getAudio());
	            preparedStatement.setBoolean(3, testsModel.getStatus());
	            preparedStatement.setInt(4, testsModel.getTeacherID());
	            preparedStatement.executeUpdate();
	            System.err.println("ok add");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	  
	  // edit
	  public static void edit (TestsModel testsModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE test SET TestName = ?, audio = ? WHERE testID =?"); 
				preparedStatement.setString(1, testsModel.getTestsName());
	            preparedStatement.setString(2, testsModel.getAudio());
				preparedStatement.setInt(3, testsModel.getTestsID());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
	  
	  //set status
	  public static void setStatus (TestsModel testsModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE test SET  status = ? WHERE testID =?"); 
	            preparedStatement.setBoolean(1, testsModel.getStatus());
				preparedStatement.setInt(2, testsModel.getTestsID());   
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
	  
	  // edit audio
		public static void editAudio (TestsModel testsModel) {	
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE test SET audio = ? WHERE testID =?"); 
				preparedStatement.setString(1, testsModel.getAudio());
				preparedStatement.setInt(2,testsModel.getTestsID());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		public static TestsModel find (int testsID) {
			TestsModel testsModel= new TestsModel();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("Select * From test Where testID = ?");
				preparedStatement.setInt(1, testsID);
				ResultSet resultSet =preparedStatement.executeQuery();
				resultSet.next();
				testsModel.setTestsID(testsID);
				testsModel.setTestsName(resultSet.getString("TestName"));
				testsModel.setAudio(resultSet.getString("audio"));
				testsModel.setStatus(resultSet.getBoolean("status"));
				testsModel.setTeacherID(resultSet.getInt("teacherID"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return testsModel;
		}
		
		public static int count () {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("Select Count(*) As Result From Test");
				ResultSet resultSet = preparedStatement.executeQuery();
				resultSet.next();
				int count = resultSet.getInt("Result");
				return count;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
	// delete
		public static boolean delete(int testID) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("Delete From Test Where testID = ?");
				preparedStatement.setInt(1, testID);
				preparedStatement.executeUpdate();
				return true;
			} catch (Exception e) {
				return false;
			}
		}
}
