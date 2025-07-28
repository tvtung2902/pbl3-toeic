package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;
import com.pbl3.model.Register_CourseModel;
import com.pbl3.service.RegisterCourseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/register-course" , "/admin/register-course/confirm", "/admin/register-course/cancel"})
public class RegisterCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet RegisterCourseController - admin");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/register-course": {
			System.out.println("goi doget /admin/register-course");
			show(req, resp);
			break;
		}
		default:
			resp.sendRedirect(req.getContextPath() + "/error");
		} 
	}
	
//	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("goi ham show");
//		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/register-course/register-course.jsp");
//		req.setAttribute("registerCourses", RegisterCourseService.all());
//		requestDispatcher.forward(req, resp);
//	}
	
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("goi ham show");
	    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/register-course/register-course.jsp");

	    String method = req.getParameter("method");
	    String keyword = req.getParameter("keyword");
	    if (keyword == null) {
	        keyword = "";
	    }
	    if (method == null) {
	        method = "UserID";
	    }
	    int page = 1;
	    if (req.getParameter("page") != null && req.getParameter("page") != "") {
	        page = Integer.parseInt(req.getParameter("page"));
	    }
	    int limit = 9;

	    LinkedList<Register_CourseModel> registerCourses = RegisterCourseService.all(method, keyword, limit, page);
	    int totalRecord = RegisterCourseService.countSearch(method, keyword);
	    int totalPage = (int)Math.ceil(1.0 * totalRecord / limit);

	    req.setAttribute("totalPage", totalPage);
	    req.setAttribute("currentPage", page);
	    req.setAttribute("registerCourses", registerCourses);
	    requestDispatcher.forward(req, resp);
	}

	
	protected void confirm_cancel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
		String status = "waiting";
		if (actionString.equals("/admin/register-course/confirm")) {
			status = "confirmed";

			System.err.println("vào confirm"); 
		}
		else if (actionString.equals("/admin/register-course/cancel")) {
			status = "cancel";
			System.err.println("vào cancel");
		}
		int registerCourseID = Integer.parseInt(req.getParameter("registerCourseID"));
		RegisterCourseService.cancel_confirm(status, registerCourseID);
		resp.sendRedirect("/MVC/admin/register-course");
	}
	  
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		confirm_cancel(req, resp);  
	}
}
