package com.pbl3.controller.student;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;   
@WebServlet (urlPatterns = {"/error"})
public class ErrorController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("views/student/error.jsp");
		reqDispatcher.forward(req, resp);
	} 
}
        