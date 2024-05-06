package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.CourseModel;
import com.pbl3.service.CourseService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/register-course" })
public class RegisterCourseController extends HttpServlet {
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
		}
	}
	
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/register-course.jsp");
		// 1 tung 12-12-2023 1 khoa hoc toiec 500 thanh tien  trang thai so tien tra cho giao vien
		requestDispatcher.forward(req, resp);
	}
}
