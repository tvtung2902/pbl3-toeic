package com.pbl3.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Arrays;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.libs.ToStringBuilder;
import com.pbl3.service.Teacher_TestsService;
import com.pbl3.service.UserService;
import com.pbl3.service.User_TestsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/tests" ,"/admin/tests/tests-detail"})
public class TestsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		System.err.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/tests": {
			System.out.println("goi doget /admin/tests");
			show(req, resp);
			break;
		}
		case "/admin/tests/tests-detail": {
			System.out.println("goi doget /admin/tests");
			showDetail(req, resp);
			break;
		}
		}
	}
	
	private void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/tests/tests.jsp");
		req.setAttribute("teacher_tests",Teacher_TestsService.getAllTeachersWithTestStats());
		LinkedList<Pair<Integer, Integer>> pairCountTimesDateOfMonth =  User_TestsService.countTimesDateOfMonth();
		Object[] yDateArray = new Object[LocalDate.now().lengthOfMonth()];
		Object[] xDateArray = new Object[LocalDate.now().lengthOfMonth()];
		for (int i = 0; i < xDateArray.length; i++) {
			xDateArray[i] = 0;
			yDateArray[i] = 0;  
		}
		int maxLL = 0;
		for (Pair<Integer, Integer> p : pairCountTimesDateOfMonth) {
			yDateArray[p.getFirst() - 1] = p.getSecond();
			if (maxLL < p.getSecond()) {
				maxLL = p.getSecond(); 
			}
		}
		for (int i = 0; i < xDateArray.length; i++) {
			xDateArray[i] = i + 1;
		}
		for (int i = 0; i < xDateArray.length; i++) {
			System.err.println(yDateArray[i]);
		}
		req.setAttribute("yDateArrayStr", Arrays.toString(yDateArray));
		req.setAttribute("xDateArrayStr", Arrays.toString(xDateArray));
		req.setAttribute("maxLL", maxLL);
		LinkedList<Pair<String, Integer>> countTimesMonthOfYear = User_TestsService.countTimesMonthOfYear();
		String[] xMonthArray = new String[12];
		YearMonth currentYearMonth = YearMonth.now();
		for (int i = 0; i < xMonthArray.length; i++) {
			YearMonth yearMonth = currentYearMonth.minusMonths(i);
			xMonthArray[11 - i] = yearMonth.toString();
		}

		Object[] yMonthArray = new Object[12];
		for (int i = 0; i < 12; i++) {
			yMonthArray[i] = 0;
		}
		for (Pair<String, Integer> p : countTimesMonthOfYear) {
			for (int i = 0; i < xMonthArray.length; i++) {
				if (xMonthArray[i].equals(p.getFirst())) {
					yMonthArray[i] = p.getSecond();
				}
			}
		}
		req.setAttribute("xMonthArrayStr", ToStringBuilder.arrayToJson(xMonthArray));
		System.err.println(ToStringBuilder.arrayToJson(xMonthArray));
		System.err.println(ToStringBuilder.arrayToJson(yMonthArray));
		req.setAttribute("yMonthArrayStr", ToStringBuilder.arrayToJson(yMonthArray));
	    requestDispatcher.forward(req, resp);
	}
	
	private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/tests/tests-detail.jsp");
		int teacherID =  Integer.parseInt(req.getParameter("teacherID"));
		req.setAttribute("teacher_tests",User_TestsService.getTestsForTeacher(teacherID, ""));
		System.err.println(User_TestsService.getTestsForTeacher(teacherID, "").size());
		req.setAttribute("teacher", UserService.getUserByID(teacherID));
	    requestDispatcher.forward(req, resp);
	}
}
