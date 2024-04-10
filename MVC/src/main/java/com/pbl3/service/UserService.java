package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pbl3.model.AccountModel;
import com.pbl3.model.UserModel;

public class UserService extends BaseService{
	// add user
		public static void add(UserModel userModel) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO user (AccountID, Name, Phone, Gmail, Gender) VALUES (?, ?, ?, ?, ?)"); 
				preparedStatement.setInt(1, userModel.getAccountID());
				preparedStatement.setString(2, userModel.getName());
				preparedStatement.setString(3, userModel.getPhone());
				preparedStatement.setString(4, userModel.getEmail());
				preparedStatement.setBoolean(5, userModel.getGender());
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// login
		// truy van ra trong data base account vua dang nhap, ko co thi tra ve 1 UserModel voi UserModel = 0 
		//co thi tra ve accountModel do 
		public static UserModel login(String usernameString, String passwordString) {
			UserModel userModel = new UserModel();
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT user.*  FROM user INNER JOIN account ON user.accountID = account.accountID WHERE account.username = ? AND account.password = ?"); 
				preparedStatement.setString(1, usernameString);
			    preparedStatement.setString(2, passwordString);
				ResultSet resultSet = preparedStatement.executeQuery();
				if(resultSet.next()) {
					 int userID = resultSet.getInt(1);
					 int accountID = resultSet.getInt(1);
					 String name = resultSet.getString(3);
					 String phone = resultSet.getString(4);
					 String email = resultSet.getString(5);
					 boolean gender  = resultSet.getBoolean(6);;
					 userModel.setUserID(userID);
					 userModel.setAccountID(accountID);
					 userModel.setName(name);
					 userModel.setPhone(phone);
					 userModel.setEmail(email);
					 userModel.setGender(gender);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return userModel;
		}
}
