package com.pbl3.controller.teacher;

import java.io.IOException;

import com.pbl3.libs.FileData;
import com.pbl3.model.DataQuestionModel;
import com.pbl3.service.DataQuestionService;
import com.pbl3.service.QuestionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/teacher/tests/part/create-data", "/teacher/tests/part/edit-data",
		"/teacher/tests/part/delete-data" })
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private void deleteData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Gọi hàm delete");
		// xóa ảnh củ đi cu ơi....
		int partID = Integer.parseInt(req.getParameter("partID"));
		int dataQuestionID = Integer.parseInt(req.getParameter("dataQuestionID"));
        System.out.println("dataQuestionID la: " + req.getParameter("dataQuestionID"));
        DataQuestionService.delete(dataQuestionID);
        int testsID = Integer.parseInt(req.getParameter("testsID"));
        resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID=" + partID +"&testsID=" + testsID);  
	}
	
	private void editData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Gọi hàm edit");
		// xóa ảnh củ đi cu ơi....
		int partID = Integer.parseInt(req.getParameter("partID"));
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		Part part = req.getPart("dataQuestion");     
		String realPart = req.getServletContext().getRealPath("/data");
		String questionData = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len  
		if(questionData == null) {
			questionData = req.getParameter("dataQuestionString");         
		}
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		System.out.println(questionData);
		String transcript = req.getParameter("transcript");
		int dataQuestionID = Integer.parseInt(req.getParameter("dataQuestionID"));    
		DataQuestionModel dataQuestionModel = new DataQuestionModel(dataQuestionID, questionData, transcript, testsID, partID, orderNumber);
		System.out.println(dataQuestionModel+" cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
		DataQuestionService.edit(dataQuestionModel);
		int orderNumberOld = Integer.parseInt(req.getParameter("orderNumberOld"));
		// neu co thay doi orderNumber
		if (orderNumber != orderNumberOld) {
			int countQuestionInData = 0;
			if (partID == 3) {
				countQuestionInData = 3;
			}
			else if (partID == 4) {
				countQuestionInData = 3;
			}
			else if (partID == 6) {
				countQuestionInData = 4;
			}
int number = (orderNumber - orderNumberOld) * countQuestionInData;
			QuestionService.edit(dataQuestionID, number);
		}
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID=" + partID +"&testsID=" + testsID);  
	}
	private void createData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Gọi hàm create");
		int partID = Integer.parseInt(req.getParameter("partID"));
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		Part part = req.getPart("data");    
		String realPart = req.getServletContext().getRealPath("/data");
		String questionData = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len  
		String transcript = req.getParameter("transcript");
		int orderNumber = Integer.parseInt(req.getParameter("orderNumber"));
		System.out.println("test: " +testsID);
		DataQuestionModel dataQuestionModel = new DataQuestionModel(0, questionData, transcript, testsID, partID, orderNumber);
		DataQuestionService.add(dataQuestionModel);
		resp.sendRedirect(req.getContextPath() + "/teacher/tests/part?partID=" + partID +"&testsID=" + testsID);     
	}
	
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/teacher/tests/part/create-data": {
			System.out.println("goi case /teacher/question/create - do post");
			createData(req, resp);
			break;
		}
		case "/teacher/tests/part/edit-data": {
			System.out.println("goi case /teacher/question/create - dogest");
			editData(req, resp);
			break;
		}
		case "/teacher/tests/part/delete-data": {
			System.out.println("goi case /teacher/question/create - dogest");
			deleteData(req, resp);
			break;
		}
		}
	}
}
