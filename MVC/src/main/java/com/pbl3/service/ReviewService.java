package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewService extends BaseService{
	//remember
	public static void remember(int userID,int vocabID) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO review (userid, vocabid, status) VALUES (?, ?, true)"); 
			preparedStatement.setInt(1, userID);
			preparedStatement.setInt(2, vocabID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
