package com.pbl3.controller.admin;

import java.io.IOException;
import com.pbl3.libs.FileData;
import com.pbl3.libs.MD5;
import com.pbl3.model.UserModel;
import com.pbl3.service.UserService;
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
@WebServlet (urlPatterns = {"/admin/set-account","/admin/set-password"})
public class MyAccountController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String actionString = req.getServletPath();
	     switch (actionString) {
         case "/admin/set-account": {
             set_account(req, resp);
             break;
         }
         case "/admin/set-password": {
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
			resp.sendRedirect("/MVC/admin");
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
			resp.sendRedirect("/MVC/admin");
	    }
} 

