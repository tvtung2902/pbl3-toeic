package com.pbl3.controller.student;

import java.io.IOException;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import com.pbl3.libs.Count;
import com.pbl3.libs.Result;
import com.pbl3.libs.Pair;
import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.HistoryOfTest_QuestionModel;
import com.pbl3.model.QuestionModel;
import com.pbl3.model.TestsModel;
import com.pbl3.model.TypeOneQuestionModel;
import com.pbl3.model.TypeTwoQuestionModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;
import com.pbl3.service.HistoryOfTest_QuestionService;
import com.pbl3.service.QuestionService;
import com.pbl3.service.TypeOneQuestionService;
import com.pbl3.service.TypeTwoQuestionService;
import com.pbl3.service.User_TestsService;
import com.pbl3.service.TestsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/tests", "/tests/guide", "/tests/start", "/tests/result", "/tests/result-detail" })
public class TestsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		case "/tests/result": {
			System.out.println("goi case /tests/result - doget");
			result(req, resp); 
			break;
		}
		case "/tests/result-detail": {
			System.out.println("goi case /tests/result - doget");
			resultDetail(req, resp);
			break;
		}
		
		}
	}

	// show
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/tests/tests.jsp");
		req.setAttribute("testsModels", User_TestsService.search(""));
		requestDispatcher.forward(req, resp);
	}

	// start
	protected void start(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham start");
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		System.out.println("testsID can truy van cac cau hoi la: " + testsID);
		TestsModel testsModel = TestsService.find(testsID);
		QuestionModel[] questionModels = new QuestionModel[200];
		for (int i = 0; i < 200; i++) {
			if(i <= 30) {
				questionModels[i] = new TypeOneQuestionModel();
			}
			else {
				questionModels[i] = new TypeTwoQuestionModel();
			}
		}
		TypeOneQuestionService.allTypeOneQuestionStart(testsID, questionModels);
		TypeTwoQuestionService.allTypeTwoQuestionStart(testsID, questionModels);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/tests/start.jsp");
		req.setAttribute("testsModel", testsModel);
		req.setAttribute("questionModels", questionModels);
		requestDispatcher.forward(req, resp);
	}

	// result
	protected void result(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham result");
		int historyOfTestID = Integer.parseInt(req.getParameter("history-of-test"));
		System.out.println("historyOfTestID la: " +historyOfTestID);
		int testsID = HistoryOfTestService.findTestsID(historyOfTestID);
		System.out.println("testsID la: " +testsID);
		TestsModel testsModel = TestsService.find(testsID);
		ArrayList<Pair<QuestionModel, String>> pairs = new ArrayList<>(200);
		TypeOneQuestionService.allTypeOneQuestionResult(historyOfTestID, testsID, pairs);
		TypeTwoQuestionService.allTypeTwoQuestionResult(historyOfTestID, testsID, pairs);
		Result result = Count.count(pairs); 
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/tests/result.jsp");
		req.setAttribute("result", result);
		req.setAttribute("pairs", pairs);
		req.setAttribute("testsModel", testsModel);
		requestDispatcher.forward(req, resp);
	}    

	//result detail
	protected void resultDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham result detail");
		int historyOfTestID = Integer.parseInt(req.getParameter("history-of-test"));
		System.out.println("historyOfTestID la: " +historyOfTestID);
		int testsID = HistoryOfTestService.findTestsID(historyOfTestID);
		System.out.println("testsID la: " +testsID);
		TestsModel testsModel = TestsService.find(testsID);
		// lay du lieu cau hoi trong can xem kq
		ArrayList<Pair<QuestionModel, String>> pairs = new ArrayList<>(200);
		TypeOneQuestionService.allTypeOneQuestionResult(historyOfTestID, testsID, pairs);
		TypeTwoQuestionService.allTypeTwoQuestionResult(historyOfTestID, testsID, pairs);
		Result result = Count.count(pairs); 
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/student/tests/result-detail.jsp");
		req.setAttribute("result", result);
		req.setAttribute("pairs", pairs);
		req.setAttribute("testsModel", testsModel);
		requestDispatcher.forward(req, resp);
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

	// submit : khi click nộp bài
	protected void submit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi submit");
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		int testsID = Integer.parseInt(req.getParameter("testsID"));
		
		System.out.println("user thuc hien chuc nang nay co id la: " + userID);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		HistoryOfTestModel historyOfTestModel = new HistoryOfTestModel(userID, testsID, date);
		int historyOfTestID = HistoryOfTestService.add(historyOfTestModel);
		System.out.println("historyoftestID vua them la: " + historyOfTestID);
		// query all question in 1 test
		String answerString = "answer"; 
		LinkedList<Integer> questionIDs = QuestionService.allQuestionID(testsID);
		for (Integer questionID : questionIDs) {
			String answerTempString = answerString + questionID;    
			// lay du lieu nguoi dung lam bai tu form
			if (req.getParameter(answerTempString) != null) {
				String answer = req.getParameter(answerTempString);
				HistoryOfTest_QuestionModel historyOfTest_QuestionModel = new HistoryOfTest_QuestionModel(historyOfTestID, questionID, answer);
				HistoryOfTest_QuestionService.add(historyOfTest_QuestionModel);
				System.out.println("ban ghi vua duoc them vao trong bang HistoryOfTest_QuestionModel co dap an la: " +answer);
			}
			else {
				System.out.println("chua chon dap an nen null roi cu oi");
			}
		}
		// chuyen huong den trang ket qua
		resp.sendRedirect(req.getContextPath() + "/tests/result" + "?history-of-test=" +historyOfTestID);
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
