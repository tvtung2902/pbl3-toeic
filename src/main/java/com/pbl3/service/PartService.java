package com.pbl3.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
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
		System.err.println(courseID);
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = new ArrayList<Pair<PartModel, LinkedList<LessionModel>>>();
		for(int i=0;i<=7;i++) {
			LinkedList<LessionModel> list =new LinkedList<LessionModel>();
			Pair<PartModel, LinkedList<LessionModel>> pair = new Pair<PartModel, LinkedList<LessionModel>>(null, list);
			arrayList.add(pair);
		}
		try {
			Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select * from  part left join (select lession.*, vocabularylist.namelist, vocabularylist.description from lession left join vocabularylist \r\n"
						+ "on lession.ListID = vocabularylist.ListID where CourseID = ?) as h on h.PartID = part.PartID  order by part.PartID asc ,lession.ordernumber asc ;");
			preparedStatement.setInt(1, courseID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer partID=resultSet.getInt("partID");
				String partname = resultSet.getString("partname");
				PartModel partModel = new PartModel(partID, partname);
				Integer lessionID = resultSet.getInt("lessionID");
				String lessionName = resultSet.getString("lessionName");
				String Video = resultSet.getString("video");
				Integer ordernumber = resultSet.getInt("ordernumber");
				String exercise = resultSet.getString("exercise");
				Integer listID = resultSet.getInt("ListID");
				String nameList = resultSet.getString("nameList");
				String description = resultSet.getString("description");
				VocabListsModel vocabListsModel;
				if(listID == 0) {
					vocabListsModel = null;
				} 
				else {
					vocabListsModel=new VocabListsModel(listID, 0, nameList, description);
				}
				LessionModel lessionModel;
				if(lessionID == 0) {
					lessionModel = null;
					System.err.println("id: " +0);
				}
				else {
					lessionModel = new LessionModel(lessionID, courseID, partID, lessionName, ordernumber, Video, exercise, vocabListsModel);
					System.err.println("id: " + "khác null");
				}
				arrayList.get(partID).setFirst(partModel);
				arrayList.get(partID).getSecond().add(lessionModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	
	public static PartModel getPartModelByID(int partID){
		PartModel partModel=new PartModel();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from part where partid = ?");
			preparedStatement.setInt(1, partID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String partNameString=resultSet.getString("PartName");
				partModel.setPartID(partID);
				partModel.setPartName(partNameString);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return partModel;
	}
	
	public static LinkedList<PartModel> getPart(){
		LinkedList<PartModel> partModels = new LinkedList<PartModel>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from part Order By partID ASC");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String partName = resultSet.getString("PartName");
				int partID = resultSet.getInt("partID");
				PartModel partModel = new PartModel(partID, partName);
				partModels.add(partModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return partModels;
	}
	
	public static void main(String[]args) {
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = all(1);
		int i = 0;
		for (Pair<PartModel, LinkedList<LessionModel>> pair : arrayList) {
			if (i++ == 0) continue;
			System.err.println(pair.getFirst().getPartID());
			LinkedList<LessionModel> l = pair.getSecond();
			for (LessionModel l1 : l) {
				if(l1 != null && l1.getVocabListsModel()!= null)
				System.out.println(l1.getLessionName() + l1.getExercise() + l1.getVocabListsModel().getNameList());
			}
		}
	}
}
