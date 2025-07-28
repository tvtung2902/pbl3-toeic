package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
import com.pbl3.model.Coupon_CourseModel;
import com.pbl3.model.CourseModel;
import com.pbl3.service.Coupon_CourseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin/coupon-course", "/admin/coupon-course/create", "/admin/coupon-course/delete"})
public class Coupon_CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String actionString = req.getServletPath();
        switch (actionString) {
            case "/admin/coupon-course": { 
                show(req, resp);
                break;
            }
            default: {
            	resp.sendRedirect(req.getContextPath() + "/error");
                break;
            }
        }
    }   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String actionString = req.getServletPath();
        switch (actionString) {
            case "/admin/coupon-course/create": {
                createSubmit(req, resp);
                break;
            }
            case "/admin/coupon-course/delete": {
                deleteSubmit(req, resp);
                break;
            }
            default: {
                
                break;
            }
        }
    }
    
    private void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/coupon/coupon-course.jsp");
    	int couponID = Integer.parseInt(req.getParameter("couponID"));
    	LinkedList<Pair<CourseModel, Integer>> linkedLists = Coupon_CourseService.all(couponID);
    	req.setAttribute("linkedLists", linkedLists); 
    	requestDispatcher.forward(req, resp); 
    }
    
    private void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseID = Integer.parseInt(req.getParameter("courseID"));
        int couponID = Integer.parseInt(req.getParameter("couponID"));
        Coupon_CourseModel coupon_CourseModel = new Coupon_CourseModel(couponID, courseID);
        Coupon_CourseService.add(coupon_CourseModel);
        resp.sendRedirect("/MVC/admin/coupon-course?couponID=" + couponID);
    }

    private void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseID = Integer.parseInt(req.getParameter("courseID"));
        int couponID = Integer.parseInt(req.getParameter("couponID"));
        Coupon_CourseModel coupon_CourseModel = new Coupon_CourseModel(couponID, courseID);
        Coupon_CourseService.delete(coupon_CourseModel);
        resp.sendRedirect("/MVC/admin/coupon-course?couponID=" + couponID);
    }
    public static void main(String[] args) {
		System.err.println(1);
	}
    
}  
