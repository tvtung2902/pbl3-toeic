package com.pbl3.service;
import java.sql.*;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
public class User_CourseService extends BaseService{
    public static LinkedList<Pair<String, Integer>> countTimesMonthOfYear() {
        LinkedList<Pair<String, Integer>> results = new LinkedList<>();
        try {
            Connection connection = getConnection(); 
            String query = "SELECT DATE_FORMAT(ConfirmDate, '%Y-%m') AS MonthYear, COUNT(*) AS Number " +
                           "FROM register_course " +
                           "(ConfirmDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND ConfirmDate IS NOT NULL)  AND Status LIKE 'confirmed'" +
                           "GROUP BY DATE_FORMAT(ConfirmDate, '%Y-%m') " +
                           "ORDER BY DATE_FORMAT(ConfirmDate, '%Y-%m')";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String monthYear = resultSet.getString("MonthYear");
                int number = resultSet.getInt("Number");
                results.add(new Pair<>(monthYear, number));
            }
            connection.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }
}
