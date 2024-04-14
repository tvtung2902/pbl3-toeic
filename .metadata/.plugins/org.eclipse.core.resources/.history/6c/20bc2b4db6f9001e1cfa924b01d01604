package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pbl3.libs.MD5;
import com.pbl3.model.AccountModel;
import java.sql.Statement;

public class AccountService extends BaseService {
	// add acc
	public static int add(AccountModel accountModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO account (RoleID, userName, password) VALUES (?, ?, ?)",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, accountModel.getRoleID());
			preparedStatement.setString(2, accountModel.getUserName());
			preparedStatement.setString(3, accountModel.getPassword());
			preparedStatement.executeUpdate();

			ResultSet rs = preparedStatement.getGeneratedKeys();
			int accountID = 0;
			if (rs.next()) {
				accountID = rs.getInt(1);
			}
			return accountID;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// login
	// truy van ra trong data base account vua dang nhap, ko co thi tra ve 1
	// accountModel voi accountID = 0
	// co thi tra ve accountModel do
	public static AccountModel login(String usernameString, String passwordString) {
		AccountModel accountModel = new AccountModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM account WHERE username = ? AND password = ?");
			preparedStatement.setString(1, usernameString);
			preparedStatement.setString(2, passwordString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				int accountID = resultSet.getInt(1);
				int RoleID = resultSet.getInt(2);
				String userName = resultSet.getString(3);
				String password = resultSet.getString(4);

				accountModel.setUserName(userName);
				accountModel.setAccountID(accountID);
				accountModel.setRoleID(RoleID);
				accountModel.setPassword(password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return accountModel;
	}
}
