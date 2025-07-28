package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.LinkedList;
import com.pbl3.model.CouponModel;

public class CouponService extends BaseService {
	
//    public static LinkedList<CouponModel> all() {
//        LinkedList<CouponModel> couponModels = new LinkedList<>();
//        try {
//            Connection connection = getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM coupon ORDER BY CouponID DESC;");
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int couponID = resultSet.getInt(1); 
//                String code = resultSet.getString(2);
//                Date startDate = resultSet.getDate(3); 
//                Date endDate = resultSet.getDate(4);
//                int quantity = resultSet.getInt(5);
//                int quantityUsed = resultSet.getInt(6);
//                int percent = resultSet.getInt(7);
//                CouponModel couponModel = new CouponModel(couponID, code, startDate, endDate, quantity, quantityUsed, percent);
//                couponModels.add(couponModel);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return couponModels;
//    }
    
	public static LinkedList<CouponModel> all(String method, String keyword, int limit, int page) {
	    LinkedList<CouponModel> couponModels = new LinkedList<>();
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement(
	            "SELECT * FROM coupon WHERE " + method + " LIKE ? ORDER BY CouponID DESC LIMIT ? OFFSET ?");
	        preparedStatement.setString(1, "%" + keyword + "%");
	        preparedStatement.setInt(2, limit);
	        int offset = (page - 1) * limit;
	        preparedStatement.setInt(3, offset);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            int couponID = resultSet.getInt(1);
	            String code = resultSet.getString(2);
	            Date startDate = resultSet.getDate(3);
	            Date endDate = resultSet.getDate(4);
	            int quantity = resultSet.getInt(5);
	            int quantityUsed = resultSet.getInt(6);
	            int percent = resultSet.getInt(7);
	            CouponModel couponModel = new CouponModel(couponID, code, startDate, endDate, quantity, quantityUsed, percent);
	            couponModels.add(couponModel);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return couponModels;
	}
	
	public static int countSearch(String method, String keyword) {
	    int cnt = 0;
	    try {
	        Connection connection = getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement(
	            "SELECT COUNT(*) AS result FROM coupon WHERE " + method + " LIKE ?");
	        preparedStatement.setString(1, "%" + keyword + "%");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        resultSet.next();
	        cnt = resultSet.getInt(1);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cnt;
	}

	
    public static void add(CouponModel couponModel) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO coupon (Code, StartDate, EndDate, Quantity, QuantityUsed, percent) VALUES (?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, couponModel.getCode());
            preparedStatement.setDate(2, couponModel.getStartDate());
            preparedStatement.setDate(3, couponModel.getEndDate());
            preparedStatement.setInt(4, couponModel.getQuantity());
            preparedStatement.setInt(5, couponModel.getQuantityUsed());
            preparedStatement.setInt(6, couponModel.getPercent());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void edit(CouponModel couponModel) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE coupon SET StartDate = ?, EndDate = ?, Quantity = ?, Percent = ? WHERE CouponID = ?");
            preparedStatement.setDate(1, couponModel.getStartDate());
            preparedStatement.setDate(2, couponModel.getEndDate());          
            preparedStatement.setInt(3, couponModel.getQuantity());        
            preparedStatement.setInt(4, couponModel.getPercent());
            preparedStatement.setInt(5, couponModel.getCouponID()); 
            preparedStatement.executeUpdate();
        } catch (SQLException e) {  
            e.printStackTrace();
        }
    }

    public static void delete(int couponID) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM coupon WHERE CouponID = ?");
            preparedStatement.setInt(1, couponID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static CouponModel find(int couponID) {
        CouponModel couponModel = new CouponModel();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM coupon WHERE CouponID = ?");
            preparedStatement.setInt(1, couponID);
            ResultSet resultSet = preparedStatement.executeQuery();	
            if (resultSet.next()) {
                couponModel.setCouponID(couponID);
                couponModel.setCode(resultSet.getString("Code"));
                couponModel.setStartDate(resultSet.getDate("StartDate"));
                couponModel.setEndDate(resultSet.getDate("EndDate"));
                couponModel.setQuantity(resultSet.getInt("Quantity"));
                couponModel.setQuantityUsed(resultSet.getInt("QuantityUsed"));
                couponModel.setPercent(resultSet.getInt("Percent"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return couponModel;
    }
    public static LinkedList<CouponModel> getCouponOfCourse(int courseID) {
    	LinkedList<CouponModel> linkedList=new LinkedList<CouponModel>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select coupon.code,coupon.Percent from coupon join coupon_course on coupon.CouponID=coupon_course.CouponID where coupon_course.CourseID=? and coupon.Quantity>coupon.QuantityUsed and coupon.EndDate>= now() and coupon.StartDate<= now()");
            preparedStatement.setInt(1, courseID);
            ResultSet resultSet = preparedStatement.executeQuery();	
            while (resultSet.next()) {
                CouponModel couponModel = new CouponModel();
                couponModel.setCode(resultSet.getString("Code"));
                couponModel.setPercent(resultSet.getInt("Percent"));
                linkedList.add(couponModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return linkedList;
    }
    public static void couponUsed(String code) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE coupon SET QuantityUsed=QuantityUsed+1 WHERE code=?");
            preparedStatement.setString(1, code);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {  
            e.printStackTrace();
        }
    }
}
