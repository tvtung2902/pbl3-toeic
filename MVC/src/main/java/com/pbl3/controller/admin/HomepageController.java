package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.TestsService;
import com.pbl3.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin" })
public class HomepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet HomepageController - admin");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin": {
			System.out.println("goi doget /admin");
			home(req, resp);
			break;
		}
		default:
			resp.sendRedirect(req.getContextPath() + "/error");
		}
	}
	
	protected void home(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/admin/homepage.jsp"); 
		LinkedList<Pair<CourseModel, Integer>> courseModels = CourseService.search("", -1);
		req.setAttribute("courseModels", courseModels);
		req.setAttribute("countUsers", UserService.count("Học Viên"));
		req.setAttribute("countTeacher", UserService.count("Giáo Viên"));
		req.setAttribute("countCourse", CourseService.count());
		req.setAttribute("countTest", TestsService.count());
		req.setAttribute("userRecent", UserService.all("UserID", "", 7, 1,0));
		requestDispatcher.forward(req, resp);   
	}
}
