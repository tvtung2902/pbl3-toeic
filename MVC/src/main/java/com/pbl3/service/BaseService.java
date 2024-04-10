package com.pbl3.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseService {
	private static String url = "jdbc:mysql://localhost:3306/pbl3?autoReconnect=true&useSSL=false";
	private static String username = "root";
	private static String password = "123456";
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("ket noi database fail");
		}
		return (Connection)DriverManager.getConnection(url, username, password);
	}
}
