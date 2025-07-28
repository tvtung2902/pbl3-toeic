package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.service.CourseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet (urlPatterns = {"/courses"})
public class CourseController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		show(req, resp);
	}
	
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		long millis=System.currentTimeMillis();  
        java.sql.Timestamp date=new java.sql.Timestamp(millis);  
        System.out.println(date);  
        LinkedList<Pair<CourseModel, Integer>> courseModels =CourseService.search("", -1);
		req.setAttribute("courseModels", courseModels);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("views/student/course/showCourse.jsp");
		reqDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
