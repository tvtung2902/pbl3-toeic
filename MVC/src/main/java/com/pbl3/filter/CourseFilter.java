package com.pbl3.filter;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.pbl3.model.LessionModel;
import com.pbl3.model.Register_CourseModel;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
import com.pbl3.service.LessionService;
import com.pbl3.service.RegisterCourseService;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/course/course-detail/*", "/course/course-detail", "/course-data/*", "/teacher/course/course-detail/edit"})
public class CourseFilter implements Filter{

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			
		}

		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
				throws IOException, ServletException {
			System.out.println("goi filter course");
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			String urlString = httpRequest.getServletPath();
			System.out.println("url: " +urlString);
			switch (urlString) {
			case "/course/course-detail" :{
				hasAccessCourseDetail(servletRequest, servletResponse, filterChain);
				break; 
			}
			case "/course/course-detail/pay": {
				if (httpRequest.getMethod().equalsIgnoreCase("POST")) {
					filterChain.doFilter(servletRequest, servletResponse);
					break;
				}
				else {
					System.out.println("vao /courses/course-detail/pay");
					hasAccessPay(servletRequest, servletResponse, filterChain);
					break;
				}
			}
			case "/course/course-detail/vocab-lists/vocab/review/remember" :{
				filterChain.doFilter(servletRequest, servletResponse);
				break;  
			}
			default: 
				hasAcssessCourseDetailData(servletRequest, servletResponse, filterChain);
			}
		}


		private void hasAccessPay(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException, ServletException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			HttpSession session = httpRequest.getSession();
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
			String action = httpRequest.getParameter("action");
			System.out.println(action + " accccccccccccccccccccccccccccc");
			if (action == null) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return; 
			}
			else {
				int courseID = 0;
				try {
					courseID = Integer.parseInt(httpRequest.getParameter("courseID"));
				} catch (Exception e) {
					System.err.println("nulllllllllllllllllllllllllllllllllllllllllllllllllll");
				}
				if (action.equals("buy")) {
					System.err.println("vao buy");
					if (!hasAccessBuy(userModel.getUserID(), courseID)) {
						httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
						return; 
					}
				}
				else if (action.equals("extend")) {
					System.err.println("vao ex");
					if (!hasAccessExtend(userModel.getUserID(), courseID)) {
						httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
						return; 
					}
				}
				else {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;   
				}
			}
			filterChain.doFilter(servletRequest, servletResponse);
		} 

		private boolean hasAccessBuy(int userID ,int courseID) {
		   System.err.println("vao ham acc buy");
		   Register_CourseModel register_CourseModel = RegisterCourseService.isRegistered(userID, courseID);
		   if (register_CourseModel.getRegisterCourseID() == 0) return true; // chua tung mua or cancel
		   else if (register_CourseModel.getStatus().equals("waiting")) return false; // khong phai trang thai waiting
		   else if (register_CourseModel.getStatus().equals("confirmed")) {
			   if(register_CourseModel.getDayOfCoure() < 0) {
				   return false;
			   } else return true;
		   }
		   System.err.println("cuoi");
		   return false;
		}
  
		private boolean hasAccessExtend(int userID, int courseID) {
			Register_CourseModel register_CourseModel = RegisterCourseService.isRegistered(userID, courseID);
			Date startDay;
			startDay=register_CourseModel.getConfirmDate();
			Long miliLong=System.currentTimeMillis();
			Date endday =new Date(miliLong);
			LocalDate endDate = endday.toLocalDate();
			LocalDate startDate = startDay.toLocalDate();
			Long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
			long dayofcourse= (long)RegisterCourseService.getDuration(register_CourseModel.getCourseID())*30 - daysBetween;
			if (register_CourseModel.getStatus().equals("confirmed") && dayofcourse < 0) return true;
			return false;
		}     

		private void hasAcssessCourseDetailData(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain)throws IOException, ServletException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			HttpSession session = httpRequest.getSession();
			UserModel currentUser = (UserModel) session.getAttribute("user");
			try { 
				int lessionID = Integer.parseInt(servletRequest.getParameter("lessionID"));
				System.out.println("lesstion id laaaa: " +lessionID);
				if (!hasAccessCourseDetailData(lessionID, currentUser.getUserID())) {
					System.err.println("vao 1");
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return; 
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("vao 2");
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}

		private boolean hasAccessCourseDetailData(int lessionID, int userID) {
			System.out.println("lesstion id laaaa: " +lessionID);
			LessionModel lessionModel = LessionService.getLessionByID(lessionID);
			if (lessionModel.getLessionID() != 0) {
				int courseID = lessionModel.getCourseID();
				Register_CourseModel register_CourseModel = RegisterCourseService.isRegistered(userID, courseID);
				System.out.println(register_CourseModel.toString());;
				System.err.println("truov return");
				return (register_CourseModel.getRegisterCourseID() != 0 && register_CourseModel.getStatus().equals("confirmed")) ||
						userID == CourseService.find(courseID).getTeacherID();
			}
			System.err.println("errrrr");
			return false;
		}

		private void hasAccessCourseDetail(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain)throws IOException, ServletException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;	
			try {
				int courseID = Integer.parseInt(servletRequest.getParameter("courseID"));
				if (!hasAccessCourseDetail(courseID)) {
					System.err.println("vao3");
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return; 
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				System.err.println("vao4");
				e.printStackTrace();
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}
		
		private boolean hasAccessCourseDetail(int courseID) {
			if (CourseService.find(courseID).getCourseID() == 0) return false;
			return true;
		}

		@Override
		public void destroy() {
		}
	}

