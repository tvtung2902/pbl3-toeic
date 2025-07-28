package com.pbl3.controller.student;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.LinkedList;

import com.pbl3.libs.FileData;
import com.pbl3.libs.MD5;
import com.pbl3.libs.Pair;
import com.pbl3.model.HistoryOfTestModel;
import com.pbl3.model.Register_CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.HistoryOfTestService;
import com.pbl3.service.RegisterCourseService;
import com.pbl3.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

// co khoa hoc, ket qua luyen thi
@MultipartConfig
@WebServlet (urlPatterns = {"/my-account", "/my-account/setting","/my-account/setting/set-account","/my-account/setting/set-password"})
public class MyAccountController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     switch (actionString) {
         case "/my-account": {
             show(req, resp);
             break;
         }
         case "/my-account/setting":{
        	 setting(req, resp);
         }
         }
	}
	 public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
			int userID = userModel.getUserID();
			req.setAttribute("userModel", userModel);
			
			//khóa học
			ArrayList<Register_CourseModel> courseRegisteds = RegisterCourseService.getCourseRegisted(userID);
			Long miliLong=System.currentTimeMillis();
			Date endday =new Date(miliLong);
			LocalDate endDate = endday.toLocalDate();
			for (Register_CourseModel register_CourseModel : courseRegisteds) {
				Date startDay;
				startDay=register_CourseModel.getConfirmDate();
				LocalDate startDate = startDay.toLocalDate();
				Long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
				register_CourseModel.setDayOfCourse((long)RegisterCourseService.getDuration(register_CourseModel.getCourseID())*30 - daysBetween);
				System.err.println((long)RegisterCourseService.getDuration(register_CourseModel.getCourseID())*30 - daysBetween);
			}
			ArrayList<Register_CourseModel> courseWaitings = RegisterCourseService.getCourseWaiting(userID);
			req.setAttribute("courseRegisteds", courseRegisteds);
			req.setAttribute("courseWaitings", courseWaitings);
			
			//đề thi
			LinkedList<Pair<HistoryOfTestModel, String>> historyOfTestModels = HistoryOfTestService.allHistoryOfTest(userID);
			req.setAttribute("historyOfTestModels", historyOfTestModels);
			RequestDispatcher  requestDispatcher = req.getRequestDispatcher("views/student/Account/my-account.jsp");
			requestDispatcher.forward(req, resp);
	    }
	 public void setting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
			int userID = userModel.getUserID();
			req.setAttribute("userModel", userModel);
			
			RequestDispatcher  requestDispatcher = req.getRequestDispatcher("/views/student/Account/setting.jsp");
			requestDispatcher.forward(req, resp);
	    }
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     switch (actionString) {
         case "/my-account/setting/set-account": {
             set_account(req, resp);
             break;
         }
         case "/my-account/setting/set-password": {
             set_pass(req, resp);
             break;
         }
         }

	}
	 public void set_account(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
			int userID = userModel.getUserID();
			req.setAttribute("userModel", userModel);
			String name= req.getParameter("name");
			String phone = req.getParameter("phone");
			Boolean gender;
			if(req.getParameter("gender") == null) {
				gender = null;
			}
			else {
				if(req.getParameter("gender").equals("1")) {
					gender=true;
				}
				else {
					gender=false;
				}
			}
			Part part = req.getPart("pic-avatar"); 
	        String image = null;
			String realPart = req.getServletContext().getRealPath("/data"); 
			image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len 
			if (image == null) {
				image = req.getParameter("img-string"); 
			}
	        UserModel userModelnew= new UserModel(userID, name, phone, userModel.getEmail(), gender, image, userModel.getUserName(), userModel.getPassword(), userModel.getRoleModel(),userModel.getStatus(),userModel.getDescription());
	        System.out.println(userModelnew);
	        UserService.update(userModelnew);
			session.setAttribute("user", userModelnew);
			resp.sendRedirect(req.getContextPath() + "/my-account/setting");
	    } 

	 public void set_pass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("user");
			int userID = userModel.getUserID();
			req.setAttribute("userModel", userModel);
			userModel.setUserID(userID);
			userModel.setPassword(MD5.getMD5(req.getParameter("pass-new")));
	        UserService.editPassword(userModel);
			session.setAttribute("user", userModel);
			resp.sendRedirect(req.getContextPath() + "/my-account/setting");
	    }
} 
