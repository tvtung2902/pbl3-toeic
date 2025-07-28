package com.pbl3.controller.student;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.sql.Date;
import java.util.LinkedList;
import com.pbl3.libs.Pair;
import com.pbl3.model.CourseModel;
import com.pbl3.model.LessionModel;
import com.pbl3.model.PartModel;
import com.pbl3.model.Register_CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.PartService;
import com.pbl3.service.RegisterCourseService;
import com.pbl3.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/course/course-detail"})
public class CourseDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionString = req.getServletPath();
        switch (actionString) {
	        case "/course/course-detail": {
	        	courseDetail(req, resp);
	            break;
	        }
        }
	}
	public void courseDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel userModel = (UserModel)session.getAttribute("user");
		int courseID=Integer.parseInt(req.getParameter("courseID"));
		LinkedList<CourseModel> courseModels = CourseService.allRecent(courseID);
		CourseModel courseModel=CourseService.find(courseID);
		UserModel teacher = UserService.getUserByID(courseModel.getTeacherID());
		String statusString;  
		Register_CourseModel registerCourseModel = RegisterCourseService.isRegistered(userModel.getUserID(), courseID);
		if (registerCourseModel.getRegisterCourseID() != 0) {
			statusString = registerCourseModel.getStatus();
			System.out.println(registerCourseModel.toString());
		}
		else statusString = "notRegister";
		if(statusString.equals("confirmed")) {
			Date startDay;
			startDay=registerCourseModel.getConfirmDate();
			Long miliLong=System.currentTimeMillis();
			Date endday =new Date(miliLong);
			LocalDate endDate = endday.toLocalDate();
			LocalDate startDate = startDay.toLocalDate();
			Long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
			long dayofcourse= (long)RegisterCourseService.getDuration(registerCourseModel.getCourseID())*30 - daysBetween;
			System.err.println("aaaaaaaaaaaaaaaaad" +dayofcourse); 
			System.err.println("aaaaaaaaaaaaaaaaad" +registerCourseModel.getDayOfCoure()); 
			req.setAttribute("dayofcourse", dayofcourse);
			if(dayofcourse<0) statusString="outTime";
			else {
				statusString="isRegister";
			}
		}
		if(statusString.equals("cancel")) {
			statusString="notRegister";
		}
		ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList = PartService.all(courseID);
		req.setAttribute("teacher", teacher);
		req.setAttribute("arraylist", arrayList);
		req.setAttribute("courseModel", courseModel);
		req.setAttribute("courseModels", courseModels);
		req.setAttribute("statusString", statusString);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/views/student/course/courseDetail.jsp");
		reqDispatcher.forward(req, resp);
	}
}
