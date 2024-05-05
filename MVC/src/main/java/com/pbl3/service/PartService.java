package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
import com.pbl3.model.ExerciseModel;
import com.pbl3.model.LessionModel;
import com.pbl3.model.PartModel;
import com.pbl3.model.VocabListsModel;


public class PartService extends BaseService {
	
	public static int count () {	
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM part;"); 
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			int countPart = resultSet.getInt(1);
			System.out.println("size cua part la: "+ countPart);
			return countPart; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static ArrayList<Pair<PartModel, LinkedList<LessionModel>>> all(int courseID){
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = new ArrayList<Pair<PartModel, LinkedList<LessionModel>>>();
		for(int i=0;i<=7;i++) {
			LinkedList<LessionModel> list =new LinkedList<LessionModel>();
			Pair<PartModel, LinkedList<LessionModel>> pair = new Pair<PartModel, LinkedList<LessionModel>>(null, list);
			arrayList.add(pair);
		}
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from  part left join (select lession.*, exercise.ExerciseName,exercise.ExerciseSource, vocabularylist.namelist,vocabularylist.listid ,vocabularylist.Description  from lession left join exercise \r\n"
					+ "on lession.LessionID = exercise.LessionID left join vocabularylist \r\n"
					+ "on lession.LessionID=vocabularylist.LessionID where CourseID = ?) as h on h.PartID = part.PartID  order by part.PartID asc ,lession.ordernumber asc ;");
			preparedStatement.setInt(1, courseID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer partID=resultSet.getInt(1);
				String partnameString = resultSet.getString("partname");
				PartModel partModel=new PartModel(partID, partnameString);
				Integer lessionid=resultSet.getInt("lessionid");
				Integer courseid=resultSet.getInt("courseid");
				String lessionnameString=resultSet.getString("lessionname");
				String videoString = resultSet.getString("video");
				Integer ordernumber=resultSet.getInt("ordernumber");
				String exercisenameString=resultSet.getString("exercisename");
				String exercisesourceString=resultSet.getString("exercisesource");
				Integer listid=resultSet.getInt("listid");
				String namelistString=resultSet.getString("namelist");
				String descriptionString=resultSet.getString("description");
				VocabListsModel vocabListsModel;
				if(listid==0) {
					vocabListsModel=null;
				}
				else {
					vocabListsModel=new VocabListsModel(listid ,null, lessionid, namelistString, descriptionString);
				}
				ExerciseModel exerciseModel;
				if(exercisesourceString==null) {
					exerciseModel=null;
				}
				else {
					exerciseModel=new ExerciseModel(lessionid, exercisenameString, exercisesourceString);
				}
				LessionModel lessionModel;
				if(lessionid==0) {
					lessionModel=null;
				}
				else {
					lessionModel = new LessionModel(lessionid, courseID, partID, lessionnameString, ordernumber, videoString, exerciseModel, vocabListsModel);
				}
				arrayList.get(partID).setFirst(partModel);
				arrayList.get(partID).getSecond().add(lessionModel);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return arrayList;
	}
	public static void main(String[]args) {
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = all(2);
		System.out.println(arrayList.get(2).getSecond().get(0));
	}
}
