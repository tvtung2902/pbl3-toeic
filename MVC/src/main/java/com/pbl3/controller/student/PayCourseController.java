package com.pbl3.controller.student;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.model.CouponModel;
import com.pbl3.model.CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CouponService;
import com.pbl3.service.CourseService;
import com.pbl3.service.RegisterCourseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet (urlPatterns = {"/course/course-detail/pay"})
public class PayCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		pay(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		waiting(req, resp);
	}
	 public void pay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
//			int userID = userModel.getUserID();
	        int courseID = Integer.parseInt(req.getParameter("courseID"));
	        CourseModel courseModel=CourseService.find(courseID);
	        String actionString = req.getParameter("action");
	        LinkedList<CouponModel> linkedList=CouponService.getCouponOfCourse(courseID);
	        System.err.println(linkedList.size()); 
	        if(actionString.equals("buy")) {
	        	req.setAttribute("userModel", userModel);
	        	req.setAttribute("listCoupon", linkedList);
	        	req.setAttribute("courseModel", courseModel);
	        	RequestDispatcher  requestDispatcher = req.getRequestDispatcher("/views/student/course/buyCourse.jsp");
	        	requestDispatcher.forward(req, resp);
	        }
	        else if(actionString.equals("extend")){
	        	req.setAttribute("userModel", userModel);
	        	req.setAttribute("listCoupon", linkedList);
	        	req.setAttribute("courseModel", courseModel);
	        	RequestDispatcher  requestDispatcher = req.getRequestDispatcher("/views/student/course/extendCourse.jsp");
	        	requestDispatcher.forward(req, resp);
	        	System.out.println(courseModel.getPercentDiscount()+"cc");
	        }

	    }
	 public void waiting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
			int userID = userModel.getUserID();
	        int courseID = Integer.parseInt(req.getParameter("courseID"));
	        String codeString =req.getParameter("coupon");
	        if(codeString!=null) {
	        	CouponService.couponUsed(codeString);
	        }
	        Double price = Double.valueOf(req.getParameter("price"));
	        CourseModel courseModel=CourseService.find(courseID);
	        RegisterCourseService.waiting(userID, courseModel, price);
	        resp.sendRedirect(req.getContextPath() + "/course/course-detail?courseID="+Integer.toString(courseModel.getCourseID())); // getContextPath()
	    }
} 
 