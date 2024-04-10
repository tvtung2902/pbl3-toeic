package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.pbl3.model.TestsModel;
import com.pbl3.model.VocabListsModel;
import com.pbl3.model.VocabModel;

public class TestsService extends BaseService {

	// query all tests
	public static LinkedList<TestsModel> all() {
		LinkedList<TestsModel> testsModels = new LinkedList<TestsModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM test ORDER BY testID DESC;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				int testID = resultSet.getInt(1);
				String testsName = resultSet.getString(2);
				Integer year = resultSet.getInt(3);
				TestsModel testsModel = new TestsModel(testID, testsName, year);   
				testsModels.add(testsModel);             
			}
			System.out.println("size cua tests: " + testsModels.size());
			return testsModels; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testsModels;
	}
}
