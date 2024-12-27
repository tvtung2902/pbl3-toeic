package com.pbl3.service;
import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedList; 
import com.pbl3.model.CourseModel;
import com.pbl3.model.Register_CourseModel;

public class RegisterCourseService extends BaseService {

	public static LinkedList<Register_CourseModel> all(String method, String keyword, int limit, int page) {
	    LinkedList<Register_CourseModel> r = new LinkedList<Register_CourseModel>();
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM register_course WHERE " + method + " LIKE ? ORDER BY registerCourseID DESC LIMIT ? OFFSET ?");
	        preparedStatement.setString(1, "%" + keyword + "%");
	        preparedStatement.setInt(2, limit);
	        int offset = (page - 1) * limit;
	        preparedStatement.setInt(3, offset);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while(resultSet.next()) {
	            int registerCourseID = resultSet.getInt("registerCourseID");   
	            Integer courseID = resultSet.getInt("CourseID");
	            Integer userID = resultSet.getInt("UserID");
	            Date date = resultSet.getDate("Date");
	            Date confirmDate = resultSet.getDate("confirmdate");
	            Double Amount = resultSet.getDouble("TotalAmount");
	            Double AmountOfTeacher = resultSet.getDouble("TotalAmountOfTeacher");
	            String statusString = resultSet.getString("status");
	            Register_CourseModel registerCourseModel = new Register_CourseModel(courseID, userID, date, confirmDate, Amount, AmountOfTeacher, statusString, registerCourseID);
	            r.add(registerCourseModel);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return r;
	}
	
	public static int countSearch(String method, String keyword) {
	    int cnt = 0;
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) AS result FROM register_course WHERE " + method + " LIKE ?");
	        preparedStatement.setString(1, "%" + keyword + "%");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        resultSet.next();
	        cnt = resultSet.getInt("result");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cnt;
	}


	public static LinkedList<Register_CourseModel> find(int UserID) {
		LinkedList<Register_CourseModel> r = new LinkedList<Register_CourseModel>();
		try {
			Connection connection = getConnection();
			String sqlString="SELECT * FROM register_course WHERE UserID="+Integer.toString(UserID);
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				Integer userID = resultSet.getInt("UserID");
				Date date =resultSet.getDate("Date");
				Date confirmDate =resultSet.getDate("confirmdate");
				Double Amount = resultSet.getDouble("TotalAmount");
				Double AmountOfTeacher = resultSet.getDouble("TotalAmountOfTeacher");
				String statuString= resultSet.getString("status");
				Register_CourseModel registerCourseModel=new Register_CourseModel(courseID, userID, date, confirmDate, Amount, AmountOfTeacher, statuString);
				r.add(registerCourseModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	public static ArrayList<Register_CourseModel> getCourseRegisted(int userID){
		ArrayList<Register_CourseModel> arrayList=new ArrayList<Register_CourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
			"SELECT r1.*\r\n"
			+ "FROM register_course r1\r\n"
			+ "JOIN (\r\n"
			+ "    SELECT courseid, MAX(confirmdate) AS max_date\r\n"
			+ "    FROM register_course\r\n"
			+ "    WHERE userid = ? AND  STATUS = 'confirmed'\r\n"
			+ "    GROUP BY courseid\r\n"
			+ ") r2 ON r1.courseid = r2.courseid AND r1.confirmdate = r2.max_date\r\n"
		
					);
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				Date date =resultSet.getDate("Date");
				Date confirmDate =resultSet.getDate("confirmdate");
				Double Amount = resultSet.getDouble("TotalAmount");
				Double AmountOfTeacher = resultSet.getDouble("TotalAmountOfTeacher");
				String statuString= resultSet.getString("status");
				Register_CourseModel registerCourseModel=new Register_CourseModel(courseID, userID, date, confirmDate, Amount, AmountOfTeacher, statuString);
				arrayList.add(registerCourseModel);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	public static ArrayList<Register_CourseModel> getCourseWaiting(int userID){
		ArrayList<Register_CourseModel> arrayList=new ArrayList<Register_CourseModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from register_course where userid= ? and status=\"waiting\" ");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer courseID = resultSet.getInt("CourseID");
				Date date =resultSet.getDate("Date");
				Date confirmDate =resultSet.getDate("confirmdate");
				Double Amount = resultSet.getDouble("TotalAmount");
				Double AmountOfTeacher = resultSet.getDouble("TotalAmountOfTeacher");
				String statuString= resultSet.getString("status");
				Register_CourseModel registerCourseModel=new Register_CourseModel(courseID, userID, date, confirmDate, Amount, AmountOfTeacher, statuString);
				arrayList.add(registerCourseModel);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	
	public static int getDuration(int courseID) {
		String sqlString="SELECT * FROM course WHERE CourseID="+Integer.toString(courseID);
		int k=0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
				 k= resultSet.getInt("Duration");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	public static Register_CourseModel isRegistered(int userID,int courseID) { 
		Register_CourseModel registerCourseModel = new Register_CourseModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM register_course WHERE courseid= ? and userID = ? and(status='waiting' or status='confirmed')"
					+ " ORDER BY date DESC LIMIT 1;");
			preparedStatement.setInt(1, courseID);
			preparedStatement.setInt(2, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				registerCourseModel.setRegisterCourseID(resultSet.getInt("registercourseID"));
				registerCourseModel.setCourseID(courseID);
				registerCourseModel.setUserID(userID);
				registerCourseModel.setDate(resultSet.getDate("Date"));
				registerCourseModel.setConfirmDate(resultSet.getDate("confirmDate"));
				registerCourseModel.setAmount(resultSet.getDouble("TotalAmount"));
				registerCourseModel.setStatus(resultSet.getString("status"));
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return registerCourseModel;
	}
	
	// add
    public static void waiting(int userID,CourseModel courseModel,double price) {
//    	Date currentDate = new Date(System.currentTimeMillis());
//    	java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
    	// Lấy thời gian hiện tại
    	LocalDateTime currentDateTime = LocalDateTime.now();

    	// Chuyển đổi thành Timestamp
    	java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(currentDateTime);
    	double totalTeacher=price*(1.0*courseModel.getPercentSalary()/100.0);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into register_course(Courseid,date,userid,totalamount,totalamountofteacher,teacherid,status)values( ?,?,?,?,?,?,\"waiting\")");
            preparedStatement.setInt(1, courseModel.getCourseID());
            preparedStatement.setTimestamp(2, timestamp);
            preparedStatement.setInt(3, userID);
            preparedStatement.setDouble(4,price );
            preparedStatement.setDouble(5, totalTeacher);
            preparedStatement.setInt(6, courseModel.getTeacherID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void cancel_confirm(String status, int registerCourseID) {
    	try {
    		System.err.println(registerCourseID); 
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("Update register_course Set Status = ? , ConfirmDate = ? WHERE RegisterCourseID = ?");
			System.err.println("stt: " +status);
			preparedStatement.setString(1, status);
			preparedStatement.setTimestamp(2, java.sql.Timestamp.valueOf(LocalDateTime.now()));
			preparedStatement.setInt(3, registerCourseID);
			preparedStatement.executeUpdate();
    	} catch (Exception e) {
			
		}
    }
}
  