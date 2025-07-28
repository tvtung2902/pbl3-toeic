package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.pbl3.model.RoleModel;
import com.pbl3.model.UserModel;

public class UserService extends BaseService {
	// add user
	public static void add(UserModel userModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO user (Name, Phone, Gmail, Gender, Image, UserName, Password, RoleID, status, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, userModel.getName());
			preparedStatement.setString(2, userModel.getPhone());
			preparedStatement.setString(3, userModel.getEmail());
			if (userModel.getGender() == null) {
				preparedStatement.setObject(4, null);
			} else
				preparedStatement.setBoolean(4, userModel.getGender());
			preparedStatement.setString(5, userModel.getImage());
			preparedStatement.setString(6, userModel.getUserName());
			preparedStatement.setString(7, userModel.getPassword());
			preparedStatement.setInt(8, userModel.getRoleModel().getRoleID());
			preparedStatement.setBoolean(9, true);
			preparedStatement.setString(10, userModel.getDescription());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// set pass
	public static int editPassword(String password, String email) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("UPDATE user SET Password = ? WHERE gmail = ?");
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, email);
			int count = preparedStatement.executeUpdate();
			return count;
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	
	// set status
		public static int editStatus(int userID, boolean status) {
			try {
				Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE user SET status = ? WHERE userID = ?");
				preparedStatement.setBoolean(1, status);
				preparedStatement.setInt(2, userID);
				int count = preparedStatement.executeUpdate();
				return count;
			} catch(SQLException e){
				e.printStackTrace();
			}
			return 0;
		}
	
	
	// login
	// truy van ra trong data base account vua dang nhap, ko co thi tra ve 1
	// UserModel voi UserModel = 0
	// co thi tra ve accountModel do
	public static UserModel login(String usernameString, String passwordString) {
		UserModel userModel = new UserModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT User.*, Role.roleName FROM User INNER JOIN Role ON User.RoleID = Role.RoleID WHERE username = ? AND password = ? AND status = 1");
			preparedStatement.setString(1, usernameString);
			preparedStatement.setString(2, passwordString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				int userID = resultSet.getInt("userID");
				String name = resultSet.getString("name");
				String phone = resultSet.getString("phone");
				String email = resultSet.getString("gmail");
				Boolean gender; 
				if (resultSet.getObject("gender") == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean("gender");
				String image = resultSet.getString("image");
				int roleID = resultSet.getInt("roleID");
				String roleName = resultSet.getString("roleName");
				boolean status =  resultSet.getBoolean("status");
				String description = resultSet.getString("description");
				RoleModel roleModel = new RoleModel(roleID, roleName);
				userModel = new UserModel(userID, name, phone, email, gender, image, usernameString, passwordString, roleModel, status, description);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModel;
	}

//	// query all
	public static LinkedList<UserModel> all(String method, String keyword, int limit, int page , int userIDCurrent) {
		LinkedList<UserModel> userModels = new LinkedList<UserModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement( "SELECT User.*, Role.rolename FROM User INNER JOIN Role ON User.RoleID = Role.RoleID WHERE " + method + " LIKE ? AND USERID != ? ORDER BY userID DESC LIMIT ? OFFSET ?");
			preparedStatement.setString(1, "%" + keyword + "%");
			preparedStatement.setInt(2, userIDCurrent);
			preparedStatement.setInt(3, limit);
			// tính offset
			int offset = (page - 1)*limit;
			preparedStatement.setInt(4, offset);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int userID = resultSet.getInt("userID");
				String name = resultSet.getString("name");
				String phone = resultSet.getString("phone");
				String email = resultSet.getString("gmail");
				String image = resultSet.getString("image");
				Boolean gender;
				if (resultSet.getObject("gender") == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean("gender");
				String userName = resultSet.getString("userName");
				int roleID = resultSet.getInt("roleID");
				String roleName = resultSet.getString("roleName");
				boolean status =  resultSet.getBoolean("status"); 
				RoleModel roleModel = new RoleModel(roleID, roleName);
				UserModel userModel = new UserModel(userID, name, phone, email, gender, image, userName, "", roleModel, status, null);
				userModels.add(userModel);
			}
			System.out.println("size cua user la: " + userModels.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModels;
	}
	
	public static int countSearch(String method, String keyword) {
		int cnt = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) AS result FROM user WHERE " + method + " LIKE ?");
			preparedStatement.setString(1, "%" + keyword + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			cnt = resultSet.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return cnt;
	} 
	
	// edit
	public static void update(UserModel userModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE user SET Name = ?, Phone= ?, Gmail = ?, Gender = ?, Image = ?, RoleID = ?, description = ? WHERE userID =?");
			preparedStatement.setString(1, userModel.getName());
			preparedStatement.setString(2, userModel.getPhone());
			preparedStatement.setString(3, userModel.getEmail());
			if (userModel.getGender() != null) {
				preparedStatement.setBoolean(4, userModel.getGender());
			} else
				preparedStatement.setObject(4, null);
			preparedStatement.setString(5, userModel.getImage());
			preparedStatement.setInt(6, userModel.getRoleModel().getRoleID());
			preparedStatement.setString(7, userModel.getDescription());
			preparedStatement.setInt(8, userModel.getUserID());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	// delete
	public static void delete(int userID) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM user WHERE userID = ?"); 
			preparedStatement.setInt(1, userID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// count
	public static int count (String roleName) {
		int cnt = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) AS result FROM user inner join role on user.roleID = role.roleID where roleName = ?"); 
			preparedStatement.setString(1, roleName);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			cnt = resultSet.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return cnt;
	} 
	
	
	public static LinkedList<UserModel> getUserByRoleName(String roleName) {
		LinkedList<UserModel> userModels = new LinkedList<UserModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT User.* FROM User INNER JOIN Role ON user.RoleID = Role.RoleID WHERE Role.RoleName LIKE ? ");
			preparedStatement.setString(1, roleName);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int userID = resultSet.getInt("userID");
				String name = resultSet.getString("name");
				String phone = resultSet.getString("phone");
				String email = resultSet.getString("gmail");
				Boolean gender;
				if (resultSet.getObject("gender") == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean("gender");
				String image = resultSet.getString("image");
				String userName = resultSet.getString("userName");
				String password = resultSet.getString("password");
				int roleID = resultSet.getInt("roleID");
				RoleModel roleModel = new RoleModel(roleID, roleName);
				String description = resultSet.getString("description");
				UserModel userModel = new UserModel(userID, name, phone, email, gender, image, userName, password, roleModel, true, description);
				userModels.add(userModel);
			} 
			System.out.println("size cua user la: " + userModels.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModels;
	}
	public static LinkedList<UserModel> getUserByRoleNameAccess(String roleName) {
		LinkedList<UserModel> userModels = new LinkedList<UserModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT User.* FROM User INNER JOIN Role ON user.RoleID = Role.RoleID WHERE Role.RoleName LIKE ? and status = 1 ");
			preparedStatement.setString(1, roleName);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int userID = resultSet.getInt("userID");
				String name = resultSet.getString("name");
				String phone = resultSet.getString("phone");
				String email = resultSet.getString("gmail");
				Boolean gender;
				if (resultSet.getObject("gender") == null) {
					gender = null;
				} else
					gender = resultSet.getBoolean("gender");
				String image = resultSet.getString("image");
				String userName = resultSet.getString("userName");
				String password = resultSet.getString("password");
				int roleID = resultSet.getInt("roleID");
				RoleModel roleModel = new RoleModel(roleID, roleName);
				String description = resultSet.getString("description");
				UserModel userModel = new UserModel(userID, name, phone, email, gender, image, userName, password, roleModel, true, description);
				userModels.add(userModel);
			} 
			System.out.println("size cua user la: " + userModels.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModels;
	}
	
	
	//
	public static UserModel getUserByID(int userID) {
		UserModel userModel = new UserModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT user.*, Role.RoleName  FROM user Inner Join Role ON Role.RoleID = User.RoleID where userid= ?");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				 int roleID = resultSet.getInt("roleID");
				 String roleName = resultSet.getString("roleName");
				 RoleModel roleModel = new RoleModel(roleID, roleName);
				 String name = resultSet.getString("Name");
				 String phone =resultSet.getString("phone");    
				 String email = resultSet.getString("gmail");      
				 Boolean gender;    
					if (resultSet.getObject("gender") == null) {
						gender = null;  
					} else
						gender = resultSet.getBoolean("gender");     
				 String image = resultSet.getString("image");
				 boolean status =  resultSet.getBoolean("status");
				 String desc = resultSet.getString("description");
				 userModel.setUserID(userID);
				 userModel.setRoleModel(roleModel);    
				 userModel.setName(name);
				 userModel.setPhone(phone);  
				 userModel.setEmail(email);
				 userModel.setGender(gender);
				 userModel.setImage(image);
				 userModel.setStatus(status);
				 userModel.setRoleModel(roleModel);
				 userModel.setDescription(desc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userModel;
	}
	public static void editPassword(UserModel userModel) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE user SET Password = ? WHERE userID =?");
			preparedStatement.setString(1, userModel.getPassword());
			preparedStatement.setInt(2, userModel.getUserID());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static boolean usernameIsUsed(String usernameString) {
		boolean check=false;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user where username = ?");
			preparedStatement.setString(1, usernameString);
			ResultSet resultSet =preparedStatement.executeQuery();
			if(resultSet.next()) {
				check=true;
			}
			else {
				check=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	public static boolean emailIsUsed(String email) {
		boolean check=false;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user where gmail = ?");
			preparedStatement.setString(1, email);
			ResultSet resultSet =preparedStatement.executeQuery();
			if(resultSet.next()) {
				check=true;
			}
			else {
				check=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
}
