package com.pbl3.controller.student;

import java.io.IOException;

import com.pbl3.libs.MD5;
import com.pbl3.model.AccountModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.AccountService;
import com.pbl3.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/", "/register", "/login", "/logout" })
public class HomepageController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet HomepageController user");
		HttpSession session = req.getSession();
		String actionString = req.getServletPath(); // lấy ở phần sau
		switch (actionString) {

		case "/register": {
			System.out.println("goi doget register");
			register(req, resp);
			break;
		}

		case "/login": {
//			if();
			if (session.getAttribute("user") != null) {

			}
			System.out.println("goi doget login");
			login(req, resp);
			break;
		}

		case "/logout": {
			System.out.println("goi doget logout");
			logout(req, resp);
			break;
		}

		case "/":
			if (session.getAttribute("user") == null) {
				System.out.println("chua dang nhap");
			}
			if (session.getAttribute("user") != null) {
				System.out.println("da dang nhap");
			}
			System.out.println("vao trang chu");
			System.out.println(actionString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/homepage.jsp");
			requestDispatcher.forward(req, resp);
			break;
		}
	}

	// chuyen den form dang ki
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi register");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/register.jsp");
		requestDispatcher.forward(req, resp);
	}

	// an nut dang ki
	public void submitRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roleID = 3;
		String userName = req.getParameter("name");
		String password = MD5.getMD5(req.getParameter("password"));
		AccountModel accountModel = new AccountModel(roleID, userName, password);
		int accountID = AccountService.add(accountModel);
		System.out.println("acc vua them co accountID: " + accountID);
		UserModel userModel = new UserModel(accountID, "", "", "", true);
		UserService.add(userModel);
		resp.sendRedirect(req.getContextPath() + "/login"); // getContextPath()
	}

	// chuyen den form dang nhap
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/login.jsp");
		requestDispatcher.forward(req, resp);
	}

	// duoc goi khi an dang nhap
	public void submitLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString = req.getParameter("email");
		String passwordString = req.getParameter("password");
		String hashedPasswoString = MD5.getMD5(req.getParameter("password"));
		UserModel userModel = UserService.login(emailString, hashedPasswoString);
		System.out.println(emailString);
		System.out.println(hashedPasswoString);
		// ko dang nhap thanh cong
		if (userModel.getUserID() == 0) {
			req.setAttribute("loginSuccess", false);
			login(req, resp);

		} else {
			System.out.println("user da dang nhap co UserID: " + userModel.getUserID());
			HttpSession session = req.getSession();
			session.setAttribute("user", userModel);
			// chuyen huonng ve trang sv
			resp.sendRedirect(req.getContextPath() + "/"); // getContextPath() lấy đường dẫn cơ bản
		}
	}

	// dang xuat
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		resp.sendRedirect(req.getContextPath() + "/");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost HomepageController user");
		String actionString = req.getServletPath();
		switch (actionString) {
		case "/register": {
			System.out.println("GOI DO POST register");
			submitRegister(req, resp);
			break;
		}
		case "/login": {
			System.out.println("GOI DO POST login");
			submitLogin(req, resp);
			break;
		}
		default:
			System.out.println(actionString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/homepage.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}
