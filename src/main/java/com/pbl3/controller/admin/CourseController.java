package com.pbl3.controller.admin;

import java.io.IOException;
import java.util.LinkedList;
import com.pbl3.libs.FileData;
import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/course", "/admin/course/create", "/admin/course/edit", "/admin/course/delete" })
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doGet course - ad");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/course": {
			System.out.println("goi doget /admin/course");
			show(req, resp);
			break;
		}
		case "/admin/course/create": {
			System.out.println("goi doPost /admin/course/create");
			create(req, resp);
			break;
		}

		case "/admin/course/edit": {
			System.out.println("goi doPost /admin/course/edit");
			edit(req, resp);
			break;
		}
		}
	}

	protected void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi ham show");
		if (req.getParameter("error") != null && req.getParameter("error").equals("true")) {
			req.setAttribute("error", "Bạn không thể xóa khóa học này");
		}
		System.err.println("00000000000" + req.getParameter("error"));
		long millis = System.currentTimeMillis();
		java.sql.Timestamp date = new java.sql.Timestamp(millis);
		System.out.println(date);
		String keyword = req.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		System.out.println(keyword);
		LinkedList<Pair<CourseModel, Integer>> courseModels = CourseService.search(keyword, -1);
		req.setAttribute("courseModels", courseModels);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/views/admin/course/course.jsp");
		reqDispatcher.forward(req, resp);
	}

	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/course/create-course.jsp");
		LinkedList<UserModel> userModels = UserService.getUserByRoleName("Giáo Viên");
		req.setAttribute("userModels", userModels);
		requestDispatcher.forward(req, resp);
	}

	protected void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/course/edit-course.jsp");
		LinkedList<UserModel> userModels = UserService.getUserByRoleName("Giáo Viên");
		req.setAttribute("userModels", userModels);
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		CourseModel courseModel = CourseService.find(courseID);
		req.setAttribute("courseModel", courseModel);
		requestDispatcher.forward(req, resp);
	}

	protected void createSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courseName = req.getParameter("courseName");
		int teacherID = Integer.parseInt(req.getParameter("teacherID"));
		String courseDesc = req.getParameter("courseDesc");
		int duration = Integer.parseInt(req.getParameter("duration"));
		double price = Double.parseDouble(req.getParameter("price"));
		int input = Integer.parseInt(req.getParameter("input"));
		int target = Integer.parseInt(req.getParameter("target"));
		Part part = req.getPart("image");
		String image = null;
		String realPart = req.getServletContext().getRealPath("/data");
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len
		int percentSalary = Integer.parseInt(req.getParameter("percentSalary"));
		int percentDiscount = Integer.parseInt(req.getParameter("percentDiscount"));
		CourseModel courseModel = new CourseModel(courseName, courseDesc, price, duration, target, image, input,
				teacherID, percentSalary, percentDiscount);
		CourseService.add(courseModel);
		resp.sendRedirect(req.getContextPath() + "/admin/course");
	}

	protected void editSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courseName = req.getParameter("courseName");
		int teacherID = Integer.parseInt(req.getParameter("teacherID"));
		String courseDesc = req.getParameter("courseDesc");
		int duration = Integer.parseInt(req.getParameter("duration"));
		double price = Double.parseDouble(req.getParameter("price"));
		int input = Integer.parseInt(req.getParameter("input"));
		int target = Integer.parseInt(req.getParameter("target"));
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		Part part = req.getPart("image");
		String image = null;
		String realPart = req.getServletContext().getRealPath("/data");
		image = FileData.add(part, realPart); // tra ve null neu co form-group img nhung ko tai len
		if (image == null) {
			image = req.getParameter("imageString");
		}
		int percentSalary = Integer.parseInt(req.getParameter("percentSalary"));
		int percentDiscount = Integer.parseInt(req.getParameter("percentDiscount"));
		CourseModel courseModel = new CourseModel(courseID, courseName, courseDesc, price, duration, target, image,
				input, teacherID, percentSalary, percentDiscount);
		CourseService.edit(courseModel);
		resp.sendRedirect(req.getContextPath() + "/admin/course");
	}

	protected void deleteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int courseID = Integer.parseInt(req.getParameter("courseID"));
		if (!CourseService.delete(courseID)) resp.sendRedirect(req.getContextPath() + "/admin/course?error=true");
		else resp.sendRedirect(req.getContextPath() + "/admin/course");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("goi doPost HomepageController - teacher");
		String actionString = req.getServletPath();
		System.out.println("actionstring la: " + actionString);
		switch (actionString) {
		case "/admin/course/create": {
			System.out.println("goi doPost /admin/course/create");
			createSubmit(req, resp);
			break;
		}

		case "/admin/course/edit": {
			System.out.println("goi doPost /admin/course/edit");
			editSubmit(req, resp);
			break;
		}

		case "/admin/course/delete": {
			System.out.println("goi doPost /admin/course/delete");
			deleteSubmit(req, resp);
		}
		}
	}
}
