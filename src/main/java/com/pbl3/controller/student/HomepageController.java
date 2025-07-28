package com.pbl3.controller.student;
import java.io.IOException;
import java.io.PrintWriter;

import com.pbl3.libs.*;
import com.pbl3.model.RoleModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.UserService;
import com.pbl3.util.Email;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/" ,"/register", "/login", "/logout" , "/forgot-password", "/reset-password", "/check-email", "/check-username"})
public class HomepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet HomepageController user");
		HttpSession session = req.getSession();
		String actionString = req.getServletPath();
		switch (actionString) {

		case "/register": {
			System.out.println("goi doget register");
			register(req, resp);
			break;
		}

		case "/login": {
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

		case "/":{
			show(req, resp);
			break;
		}
		case "/reset-password": {
			System.out.println("goi doget logout");
			resetPassword(req, resp);
			break;
		}
		
		case "/forgot-password": {
			System.out.println("goi doget logout");
			forgotPassword(req, resp);
			break;
		}
		default : { 
			resp.sendRedirect(req.getContextPath() + "/error");
		}
		}
	}
	
	//
	public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/homepage.jsp");
		req.setAttribute("AllTeacher", UserService.getUserByRoleNameAccess("Giáo Viên"));
		req.setAttribute("AllCourse", CourseService.getTop3());
		requestDispatcher.forward(req, resp);
	}
	//
	public void forgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi forgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/forgot-password.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	public void resetPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi forgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/reset-password.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	public void submitForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi submitForgotPassword");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/reset-password.jsp");
		String email = req.getParameter("email");
		// check xem email co hop le khong ....
		String password = Coupon.createCode();
		String passwordString = MD5.getMD5(password);
		if(UserService.editPassword(passwordString, email) == 0) {
			req.setAttribute("error", "Không tìm thấy email của bạn");   
			forgotPassword(req, resp);
		}
		//
		else {
			String Content = "Mật khẩu mới của bạn là: " + password + ", bạn có thể đăng nhập bằng mật khẩu này, sau đó vào trang cá nhân và đổi mật khẩu!";
			Email.sendEmail(email, "MẬT KHẨU MỚI", Content);
			requestDispatcher.forward(req, resp);
		}
	}
	
	// chuyen den form dang ki 
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi register");
		req.setAttribute("isRegisted", true);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/register.jsp");
		requestDispatcher.forward(req, resp);
	}

	// an nut dang ki
	public void submitRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int roleID = 3;   
		String userName = req.getParameter("name");
		String password = req.getParameter("password");
		String email = req.getParameter("email"); 
			
		boolean checkUsername = UserService.usernameIsUsed(userName);
		boolean checkEmail =UserService.emailIsUsed(email);
		if(checkEmail ||checkUsername) {
	        	req.setAttribute("username", userName);
	        	req.setAttribute("email", email);
	        	req.setAttribute("password", password);
	        	if(checkUsername) {
	        		req.setAttribute("checkUsername", "Tên đăng nhập đã tồn tại.");
	        	}
	        	if(checkEmail) {
	        		req.setAttribute("checkEmail", "Email đã tồn tại.");
	        	}
				req.setAttribute("isRegisted", false);
	        	RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/register.jsp");
	    		requestDispatcher.forward(req, resp);
		}
		else {
			req.setAttribute("isRegisted", true);
		 
		RoleModel roleModel = new RoleModel(roleID, "");
		UserModel userModel = new UserModel(email, userName, MD5.getMD5(password), roleModel, true, "User");
		UserService.add(userModel);
		resp.sendRedirect(req.getContextPath() + "/login"); // getContextPath()
		}
	}

	// chuyen den form dang nhap
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("lock", false);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/login.jsp");
		requestDispatcher.forward(req, resp);
	}

	// duoc goi khi an dang nhap
	public void submitLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString = req.getParameter("email");
		System.err.println(emailString);
		String passwordString =req.getParameter("password");
		System.err.println(passwordString);
		String hashedPasswoString = MD5.getMD5(req.getParameter("password"));
		System.err.println(hashedPasswoString);
		UserModel userModel = UserService.login(emailString, hashedPasswoString);
		// ko dang nhap thanh cong
		if (userModel.getUserID() == 0) {
			
			 Cookie[] cookies = req.getCookies();
			 String spam=null;
			 boolean lock=false;
			 for (Cookie cookie : cookies) {
	                // Kiểm tra tên của cookie bạn muốn lấy
	                if (cookie.getName().equals("spam")) {
	                    spam = cookie.getValue();
	                }
			 }
			 if(spam == null) {
				 Cookie spamCookie =new Cookie("spam","1");
				 spamCookie.setMaxAge(10*60);
				 resp.addCookie(spamCookie);
			 }else
			 if(Integer.parseInt(spam)<=5){
				 Cookie spamCookie =new Cookie("spam",Integer.parseInt(spam)+1+"");
				 spamCookie.setMaxAge(10*60);
				 resp.addCookie(spamCookie);
			 }else {
				 lock=true;
			 }
			 req.setAttribute("lock", lock);
			 
			req.setAttribute("username", emailString);
			req.setAttribute("password", passwordString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/student/login.jsp");
			requestDispatcher.forward(req, resp);
		} 
		// NEU DANG NHAP THANH CONG
		else {
			req.setAttribute("lock", false);
			// set session
			System.out.println("user da dang nhap co UserID: " + userModel.getUserID());
			HttpSession session = req.getSession();
			session.setAttribute("user", userModel);
			// 
			 Cookie spamCookie =new Cookie("spam","0");
			 spamCookie.setMaxAge(0);
			 resp.addCookie(spamCookie);
			// chuyen huonng ve trang chu tuy vao role : day la authen
			System.out.println("role nguoi vua login la: " +userModel.getRoleModel().getRoleName());
			if ((userModel.getRoleModel().getRoleName()).equals("Quản Trị Viên")) {
				resp.sendRedirect(req.getContextPath() + "/admin"); 
			}
			else if ((userModel.getRoleModel().getRoleName()).equals("Giáo Viên")) {
				resp.sendRedirect(req.getContextPath() + "/teacher/course"); 
			}
			else  resp.sendRedirect(req.getContextPath() + "/"); // getContextPath() lấy đường dẫn cơ bản
		}
	}

	// dang xuat
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		resp.sendRedirect(req.getContextPath() + "/");
	}
	
	public void checkUsernameUsed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Ghi log để kiểm tra việc gọi hàm (chỉ nên dùng trong phát triển, không nên dùng trong sản phẩm cuối)
	    System.out.println("Check username availability");

	    // Lấy tên đăng nhập từ request
	    String username = req.getParameter("username");

	    // Kiểm tra xem tên đăng nhập đã được sử dụng chưa
	    boolean isTaken = false;
	    try {
	        isTaken = UserService.usernameIsUsed(username);
	    } catch (Exception e) {
	        // Ghi log lỗi
	        e.printStackTrace();
	        // Trả về mã lỗi 500 trong trường hợp có lỗi trong quá trình xử lý
	        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error while checking username");
	        return;
	    }

	    // Tạo chuỗi JSON thủ công để trả về
	    String jsonResponse = "{\"isTaken\": " + isTaken + "}";

	    // Cài đặt response và trả về JSON
	    resp.setContentType("application/json");
	    PrintWriter out = resp.getWriter();
	    out.print(jsonResponse);
	    out.flush();
	}
	public void checkEmailUsed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        boolean isTaken = UserService.emailIsUsed(email);

        // Tạo chuỗi JSON thủ công để trả về
        String jsonResponse = "{\"isTaken\": " + isTaken + "}";

        // Cài đặt response và trả về JSON
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        out.print(jsonResponse);
        out.flush();
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
		case "/forgot-password": {
			System.out.println("goi doget logout");
			submitForgotPassword(req, resp);
			break;
		}
		case "/check-username": {
			checkUsernameUsed(req, resp);
			break;
		}
		case "/check-email": {
			checkEmailUsed(req, resp);
			break;
		}
		default:
			System.out.println(actionString);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/homepage.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}
