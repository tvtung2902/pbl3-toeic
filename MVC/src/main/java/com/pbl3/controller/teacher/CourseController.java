package com.pbl3.controller.teacher;
import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@MultipartConfig 
@WebServlet(urlPatterns = { "/teacher/course"})
public class CourseController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		show(req, resp);
	}  
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel) session.getAttribute("user");
		int userID = userModel.getUserID();
		String keyword = req.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}  
        LinkedList<Pair<CourseModel, Integer>> courseModels = CourseService.search(keyword,userID);
		req.setAttribute("courseModels", courseModels);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/views/teacher/course/course.jsp");
		reqDispatcher.forward(req, resp);
	}
}