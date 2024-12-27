package com.pbl3.controller.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.mysql.cj.jdbc.ha.ReplicationMySQLConnection;
import com.pbl3.libs.FileData;
import com.pbl3.libs.Pair;
import com.pbl3.model.DataQuestionModel;
import com.pbl3.model.PartModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.TypeTwoQuestionModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.DataQuestionService;
import com.pbl3.service.PartService;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TestsService;
import com.pbl3.service.TypeTwoQuestionService;
import com.pbl3.service.User_TestsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
 
@MultipartConfig
@WebServlet(urlPatterns = { "/teacher/tests", "/teacher/tests/create", "/teacher/tests/edit", "/teacher/tests/delete"
, "/teacher/tests/detail", "/teacher/tests/status"}) 
public class TestsController extends HttpServlet{ 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch (actionString) {
		case "/teacher/tests": {
			System.out.println("goi case /tests - dogest");
			show(req, resp);
			break; 
		}
		case "/teacher/tests/detail" :{
			showDetail(req, resp);
			break;
		}
		}
	}
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int teacherID = userModel.getUserID();   
		String keyword = req.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		req.setAttribute("teacher_tests",User_TestsService.getTestsForTeacher(teacherID, keyword));
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/tests/tests.jsp");   	
		requestDispatcher.forward(req, resp);
	} 
	
	protected void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/tests/tests-detail.jsp");
		req.setAttribute("testsModel", TestsService.find(Integer.parseInt(req.getParameter("testsID"))));
		LinkedList<Integer> questionModels = QuestionService.allOrderNumber(Integer.parseInt(req.getParameter("testsID")));
		ArrayList<Integer> arrayList = new ArrayList<>();
		for (int i = 0; i < 8; i++) {
            arrayList.add(0);
        }
		for (Integer orderNumber : questionModels) {
			if (orderNumber >= 1 && orderNumber <= 6) {
				arrayList.set(1, arrayList.get(1)+ 1);
			}
			if (orderNumber >= 7 && orderNumber <= 31) {
				arrayList.set(2, arrayList.get(2)+ 1);
			}
			if (orderNumber >= 32 && orderNumber <= 70) {
				arrayList.set(3, arrayList.get(3)+ 1);
			}
			if (orderNumber >= 71 && orderNumber <= 100) {
				arrayList.set(4, arrayList.get(4)+ 1);
			}
			if (orderNumber >= 101 && orderNumber <= 130) {
				arrayList.set(5, arrayList.get(5)+ 1);
			}
			if (orderNumber >= 131 && orderNumber <= 146) {
				arrayList.set(6, arrayList.get(6)+ 1);
			}
			if (orderNumber >= 147 && orderNumber <= 200) {
				arrayList.set(7, arrayList.get(7)+ 1);
			}
		}
		LinkedList<PartModel> partModels = PartService.getPart();
		req.setAttribute("partModels", partModels);
		req.setAttribute("arr", arrayList); 
		int sum = 0;
		for (Integer integer : arrayList) {
			sum += integer;
		}
		req.setAttribute("allQuestion", sum);
		req.setAttribute("isDelTest", true);
		requestDispatcher.forward(req, resp);
	}
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham create");  
		String testsName = req.getParameter("testsName");
		Part part = req.getPart("audio");
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int teacherID = userModel.getUserID(); 
        String audio = null;
		String realPart = req.getServletContext().getRealPath("/data"); 
		audio = FileData.add(part, realPart); // tra ve null neu co form-group audio nhung ko tai len 
		TestsModel testsModel = new TestsModel(0, testsName, false, teacherID, audio);
		TestsService.add(testsModel); 
		resp.sendRedirect("/MVC/teacher/tests");
	}
	
	protected void setStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		boolean status = !(Boolean.parseBoolean(req.getParameter("status")));
		TestsModel testsModel = new TestsModel();
		testsModel.setStatus(status);
		testsModel.setTestsID(testsID);
		TestsService.setStatus(testsModel);
		TypeTwoQuestionService.format(testsID);
		resp.sendRedirect("/MVC/teacher/tests/detail?testsID=" + testsID);
	}
	
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham edit test");  
		String testsName = req.getParameter("testsName");
		int testsID = Integer.parseInt(req.getParameter("testsID")); 
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int teacherID = userModel.getUserID(); 
		Part part = req.getPart("audio"); 
        String audio = null;
		String realPart = req.getServletContext().getRealPath("/data"); 
		audio = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len 
		if (audio == null) {
			audio = req.getParameter("audioString"); 
		}
		TestsModel testsModel = new TestsModel(testsID, testsName, false, teacherID, audio);
		TestsService.edit(testsModel);
		resp.sendRedirect("/MVC/teacher/tests/detail?testsID=" + testsID);
		
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("Gọi hàm delete");
	    int testsID = Integer.parseInt(req.getParameter("testsID"));
	    boolean isDel =TestsService.delete(testsID);
	    if(!isDel) {
			req.setAttribute("testsModel", TestsService.find(Integer.parseInt(req.getParameter("testsID"))));
			LinkedList<Integer> questionModels = QuestionService.allOrderNumber(Integer.parseInt(req.getParameter("testsID")));
			ArrayList<Integer> arrayList = new ArrayList<>();
			for (int i = 0; i < 8; i++) {
	            arrayList.add(0);
	        }
			for (Integer orderNumber : questionModels) {
				if (orderNumber >= 1 && orderNumber <= 6) {
					arrayList.set(1, arrayList.get(1)+ 1);
				}
				if (orderNumber >= 7 && orderNumber <= 31) {
					arrayList.set(2, arrayList.get(2)+ 1);
				}
				if (orderNumber >= 32 && orderNumber <= 70) {
					arrayList.set(3, arrayList.get(3)+ 1);
				}
				if (orderNumber >= 71 && orderNumber <= 100) {
					arrayList.set(4, arrayList.get(4)+ 1);
				}
				if (orderNumber >= 101 && orderNumber <= 130) {
					arrayList.set(5, arrayList.get(5)+ 1);
				}
				if (orderNumber >= 131 && orderNumber <= 146) {
					arrayList.set(6, arrayList.get(6)+ 1);
				}
				if (orderNumber >= 147 && orderNumber <= 200) {
					arrayList.set(7, arrayList.get(7)+ 1);
				}
			}
			LinkedList<PartModel> partModels = PartService.getPart();
			req.setAttribute("partModels", partModels);
			req.setAttribute("arr", arrayList); 
			int sum = 0;
			for (Integer integer : arrayList) {
				sum += integer;
			}
			req.setAttribute("allQuestion", sum);
			req.setAttribute("isDelTest", false);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/teacher/tests/tests-detail.jsp");
    		requestDispatcher.forward(req, resp);
	    }else {
	    	resp.sendRedirect("/MVC/teacher/tests");
	    }
	   
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/teacher/tests/create": {
			System.out.println("goi case /teacher/tests/create - do post");
			create(req, resp);
			break;
		}
		case "/teacher/tests/edit": {
			System.out.println("goi case /teacher/tests/edit - post");
			edit(req, resp);
			break;
		}
		case "/teacher/tests/delete": {
			System.out.println("goi case /teacher/question/delete - post");
			delete(req, resp);
			break;
		}
	    
	    case "/teacher/tests/status":{
	    	setStatus(req, resp);
			break;
	    }
		}
	}
}  
