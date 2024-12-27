package com.pbl3.filter;
import java.io.IOException;
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

@WebFilter(urlPatterns = {"/course/course-detail/pay", "/admin/course/edit"})
public class CourseAdminFilter implements Filter{

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
			hasAccessCourse(servletRequest, servletResponse, filterChain);
//			switch (urlString) {
//			case "/admin/course/edit" :{
//				hasAccessCourseEdit(servletRequest, servletResponse, filterChain);
//				break;
//			}
////			case "/admin/course/delete" :{
////				
////				break;
////			}
//			}	
		}

		 

		private void hasAccessCourse(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			try {
				int courseID = Integer.parseInt(httpRequest.getParameter("courseID"));
				if (!hasAccessCourseEdit(courseID)) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}

		private boolean hasAccessCourseEdit(int courseID) {
			return CourseService.find(courseID).getCourseID() == courseID;
		}

		@Override
		public void destroy() {
		}
	}

