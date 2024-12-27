package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;

import com.pbl3.libs.FileData;
import com.pbl3.libs.MD5;
import com.pbl3.model.RoleModel;
import com.pbl3.model.UserModel;
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

@MultipartConfig 
@WebServlet(urlPatterns = { "/admin/users", "/admin/users/create", "/admin/users/edit", "/admin/users/locked", "/admin/users/unlocked"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet UserController - admin");
		String actionString = req.getServletPath(); 
		System.out.println("actionstring la: "+actionString);
		switch (actionString) {
		case "/admin/users": { 
			System.out.println("goi doget /admin/users");
			show(req, resp);
			break;
		}
		case "/admin/users/create" : {
			System.out.println("goi doget /admin/users/create");
			create(req, resp);
			break;
		}
		
		case "/admin/users/edit" : {
			System.out.println("goi doget /admin/users/edit");
			edit(req, resp);
			break;
		} 
		}
	}
	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		HttpSession session = req.getSession();
		UserModel currentUser = (UserModel) session.getAttribute("user");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/users.jsp");
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
		int limit = 7;     
		LinkedList<UserModel> userModels = UserService.all(method, keyword, limit, page , currentUser.getUserID());
		int totalRecord = UserService.countSearch(method, keyword);
		int totalPage = (int)Math.ceil(1.0 * totalRecord/limit);
		System.out.println("totalRecord: " +totalRecord);
		System.out.println("totalPage: " +totalPage);
		req.setAttribute("totalPage", totalPage);  
		req.setAttribute("userModels", userModels);
		requestDispatcher.forward(req, resp); 
	}
	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham create");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/create-users.jsp");
		requestDispatcher.forward(req, resp); 
	}
	
	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham edit");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/users/edit-users.jsp");
		int userID = Integer.parseInt(req.getParameter("userID"));
		UserModel userModel = UserService.getUserByID(userID); 
		req.setAttribute("userModel", userModel);
		requestDispatcher.forward(req, resp); 
	}
	
	protected void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham createSubmit");
		String userName = req.getParameter("username");
		String password = MD5.getMD5(req.getParameter("password"));
		int roleID = Integer.parseInt(req.getParameter("roleID"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		Boolean gender;
		if(req.getParameter("gender") != null) gender = Boolean.parseBoolean(req.getParameter("gender"));
		else {
			gender = null;
		}
		Part part = req.getPart("image"); 
        String image = null;
		String realPart = req.getServletContext().getRealPath("/data"); 
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len 
		RoleModel roleModel = new RoleModel();
		roleModel.setRoleID(roleID);
		String description = req.getParameter("description");
		UserModel userModel = new UserModel(name, phone, email, gender, image, userName, password, roleModel, true, description);
		UserService.add(userModel);
		resp.sendRedirect(req.getContextPath() + "/admin/users");
	}
	
	protected void editSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham editSubmit");
		int userID = Integer.parseInt(req.getParameter("userID"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		Boolean gender;
		if(req.getParameter("gender") != null) 
			gender = Boolean.parseBoolean(req.getParameter("gender"));
		else {
			gender = null;
		}
		Part part = req.getPart("image"); 
        String image = null;
		String realPart = req.getServletContext().getRealPath("/data"); 
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len 
		if (image == null) {
			image = req.getParameter("imageString"); 
		}
		int roleID = Integer.parseInt(req.getParameter("roleID"));
		RoleModel roleModel = new RoleModel();
		roleModel.setRoleID(roleID);
		String description = req.getParameter(("description"));
		UserModel userModel = new UserModel(userID, name, phone, email, gender, image, "username", "password", roleModel, true, description);
		UserService.update(userModel); 
		resp.sendRedirect(req.getContextPath() + "/admin/users");
	}
	
	protected void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham deleteSubmit");
		int userID = Integer.parseInt(req.getParameter("userID")); 
		UserService.delete(userID); 
		doGet(req, resp);
	}  
	
	protected void locked_unlocked (HttpServletRequest req, HttpServletResponse resp, boolean status) throws ServletException, IOException {
		int userID = Integer.parseInt(req.getParameter("userID")); 
		UserService.editStatus(userID, status); 
		resp.sendRedirect(req.getContextPath() + "/admin/users");
	} 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost UserController - admin");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: "+actionString);
		switch (actionString) {
		case "/admin/users/create" : {
			System.out.println("goi doget /admin/users/create");
			createSubmit(req, resp);
			break;
		}
		
		case "/admin/users/edit" : {
			System.out.println("goi doget /admin/users/edit");
			editSubmit(req, resp);
			break;
		} 
		
		case "/admin/users" : {
			System.out.println("goi doget /admin/users/delete");
			deleteSubmit(req, resp);
			break;
		}
		case "/admin/users/locked" :{
			locked_unlocked(req, resp, false);
			break;
		}
		case "/admin/users/unlocked" :{
			locked_unlocked(req, resp, true);
			break;
		} 
		}
	}
}