package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// co khoa hoc, ket qua luyen thi
@WebServlet (urlPatterns = {"/my-account"})
public class MyAccountController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		LinkedList<HistoryOfTestModel> historyOfTestModels = HistoryOfTestService.allHistoryOfTest(userID);
		RequestDispatcher  requestDispatcher = req.getRequestDispatcher("views/student/my-account.jsp");
		req.setAttribute("historyOfTestModels", historyOfTestModels);
		requestDispatcher.forward(req, resp);
	}
}
