package com.pbl3.filter;
import java.io.IOException;
import com.pbl3.model.UserModel;
import com.pbl3.service.CourseService;
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

@WebFilter(urlPatterns = {"/teacher/course/course-detail"})
public class CourseTeacherFilter implements Filter{

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			
		}

		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
				throws IOException, ServletException {
			System.out.println("goi filter COURSETEACHER");
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			String urlString = httpRequest.getServletPath();
			System.out.println("url: " +urlString);
			switch (urlString) {
			case "/teacher/course/course-detail" :{
				hasAccessCourse(servletRequest, servletResponse, filterChain);
				break;
			}
			case "/admin/coupon/edit":{
				
				break;

			}
			}	
		} 


		private void hasAccessCourse(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			HttpSession session = httpRequest.getSession();
			UserModel currentUser = (UserModel) session.getAttribute("user");
			try {
				int courseID = Integer.parseInt(httpRequest.getParameter("courseID"));
				if (!hasAccessCourse(currentUser.getUserID(), courseID)) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}
    
		private boolean hasAccessCourse(int userID, int courseID) {
			 if((CourseService.find(courseID).getTeacherID() == userID)) {
				 return true;
			 }
			 return false; 
		}

		@Override
		public void destroy() {
		}
	}

