package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.HistoryOfTestModel;

public class HistoryOfTestService extends BaseService {

	// query all history - 1 test - 1 user
	public static LinkedList<HistoryOfTestModel> all(int userID, int testID) {
		LinkedList<HistoryOfTestModel> historyOfTestModels = new LinkedList<HistoryOfTestModel>();
		try {
			System.out.println("testID: " + testID);
			System.out.println("userid: " + userID);
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT historyoftest.*  FROM historyoftest WHERE testID = ? AND userID = ? ORDER BY historyoftestid DESC");
			preparedStatement.setInt(1, testID);
			preparedStatement.setInt(2, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int historyOfTestID = resultSet.getInt(1);
//				int userID = resultSet.getInt(2);
//				int testID = resultSet.getInt(3);
				Date date = (Date) resultSet.getDate(4);
				HistoryOfTestModel historyOfTestModel = new HistoryOfTestModel(historyOfTestID, userID, testID, date);
				historyOfTestModels.add(historyOfTestModel);
			}
			System.out.println("size cua historyOfTestModels: " + historyOfTestModels.size());
			if (historyOfTestModels.size() != 0)
				System.out.println("ngay lam dau tien la: " + historyOfTestModels.get(0).showDate());
			return historyOfTestModels;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return historyOfTestModels;
	}

	/// query all history - n test - 1 user
	public static LinkedList<Pair<HistoryOfTestModel, String>> allHistoryOfTest(int userID) {
		LinkedList<Pair<HistoryOfTestModel, String>> historyOfTestModels = new LinkedList<Pair<HistoryOfTestModel, String>>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT historyoftest.*, test.testName  FROM historyoftest INNER JOIN test ON historyoftest.testID = test.testID WHERE historyoftest.userID = ? ORDER BY historyoftestid DESC");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int historyOfTestID = resultSet.getInt(1);
//				int userID = resultSet.getInt(2);
				int testID = resultSet.getInt(3);
				Date date = resultSet.getDate(4);
				String testName = resultSet.getString(5);
				HistoryOfTestModel historyOfTestModel = new HistoryOfTestModel(historyOfTestID, userID, testID, date);
				Pair<HistoryOfTestModel, String> pair = new Pair<> (historyOfTestModel, testName);
				historyOfTestModels.add(pair);
			}
			return historyOfTestModels;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return historyOfTestModels;
	}

	// add history
	public static int add(HistoryOfTestModel historyOfTestModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO historyoftest (userID, testID, date) VALUES (?, ?, ?)",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, historyOfTestModel.getUserID());
			preparedStatement.setInt(2, historyOfTestModel.getTestID());
			preparedStatement.setObject(3, historyOfTestModel.getDate());
			preparedStatement.executeUpdate();
			ResultSet rs = preparedStatement.getGeneratedKeys();
			int historyOfTestID = 0;
			if (rs.next()) {
				historyOfTestID = rs.getInt(1);
			}
			return historyOfTestID;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// query testsID in historyoftest
	public static int findTestsID(int historyoftestID) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT testID FROM historyoftest WHERE historyoftestID = ?");
			preparedStatement.setInt(1, historyoftestID);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			int testsID = resultSet.getInt(1);
			return testsID;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// query userID in historyoftest
		public static int findUserID(int historyoftestID) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT userID FROM historyoftest WHERE historyoftestID = ?");
				preparedStatement.setInt(1, historyoftestID);
				ResultSet resultSet = preparedStatement.executeQuery();
				if (resultSet.next()){
					int userID = resultSet.getInt("userID");
					return userID;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}
	
	
}
