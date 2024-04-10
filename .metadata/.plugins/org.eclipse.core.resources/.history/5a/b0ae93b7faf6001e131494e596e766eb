package com.pbl3.controller.student;

import java.io.IOException;
import java.util.Date;
import java.util.Calendar;
import java.util.LinkedList;
import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TestsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/tests", "/tests/guide", "/tests/start", "/tests/result" })
public class TestsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do get la: " + actionString);
		switch (actionString) {
		case "/tests": {
			System.out.println("goi case /tests - dogest");
			show(req, resp);
			break;
		}

		case "/tests/guide": {
			System.out.println("goi case /tests - dogest");
			showGuide(req, resp);
			break;
		}

		case "/tests/start": {
			System.out.println("goi case /tests/start - doget");
			start(req, resp);
			break;
		}
		case "/test/result": {
			System.out.println("goi case /tests/result - doget");
			result(req, resp);
			break;
		}
		}
	}

	// show
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		LinkedList<TestsModel> testsModels = TestsService.all();
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/tests/tests.jsp");
		req.setAttribute("testsModels", testsModels);
		requestDispatcher.forward(req, resp);
	}

	// start
	protected void start(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham start");
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("testsID can truy van cac cau hoi la: " + testsID);
		LinkedList<QuestionModel> questionModels = QuestionService.all(testsID);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/tests/start.jsp");
		req.setAttribute("questionModels", questionModels);
		requestDispatcher.forward(req, resp);
	}

	// result
	protected void result(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham result");

	}

	// guide
	protected void showGuide(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		System.out.println("goi ham guide");
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		LinkedList<HistoryOfTestModel> historyOfTestModels = HistoryOfTestService.all(userID, testsID);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/tests/guide.jsp");
		req.setAttribute("historyOfTestModels", historyOfTestModels);
		requestDispatcher.forward(req, resp);
	}
	
	//submit : khi click nộp bài
	protected void submit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi submit");
		// 
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int userID = userModel.getUserID();
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("user thuc hien chuc nang nay co id la: " +userID);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		int score = 100;
		HistoryOfTestModel historyOfTestModel = new HistoryOfTestModel(userID, testsID, date, score); 
		HistoryOfTestService.add(historyOfTestModel);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.out.println("actionString tai do post la: " + actionString);
		switch (actionString) {
		case "/tests/start": {
			System.out.println("goi case /tests/start - dopost");
			submit(req, resp);
			break;
		}
		
		}
	}
}
