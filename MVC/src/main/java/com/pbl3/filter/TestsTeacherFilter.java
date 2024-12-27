package com.pbl3.filter;
import java.io.IOException;
import com.pbl3.model.UserModel;
import com.pbl3.service.TestsService;
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

@WebFilter(urlPatterns = {"/teacher/tests/detail", "/teacher/tests/part"})
public class TestsTeacherFilter implements Filter{

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			
		}

		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
				throws IOException, ServletException {
			System.out.println("goi filter test");
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			String urlString = httpRequest.getServletPath();
			System.out.println("url: " +urlString);
			switch (urlString) {
			case "/teacher/tests/detail":{
				hasAccessTestsDetail(servletRequest, servletResponse, filterChain);
				break;
			}
			case "/teacher/tests/part" : {
				hasAccessPartInTest(servletRequest, servletResponse, filterChain);
			}
			}	
		} 

		 

		private void hasAccessPartInTest(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			HttpSession session = httpRequest.getSession();
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
			try {
				int testsID = Integer.parseInt(httpRequest.getParameter("testsID"));
				int partID = Integer.parseInt(httpRequest.getParameter("partID"));
				if (!hasAccessTests(testsID, userModel.getUserID()) || !hasAccessPart(partID)) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
			
		}

		private boolean hasAccessPart(int partID) {
			if (partID >= 1 && partID <= 7) return true;
			return false;
		}

		private void hasAccessTestsDetail(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			HttpSession session = httpRequest.getSession();
            UserModel userModel = (UserModel) (session != null ? session.getAttribute("user") : null);
			try {
				int testsID = Integer.parseInt(httpRequest.getParameter("testsID"));
				if (!hasAccessTests(testsID, userModel.getUserID())) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}

		private boolean hasAccessTests(int testsID, int userID) {
			return TestsService.find(testsID).getTeacherID() == userID;  
		}

		@Override
		public void destroy() {
		}
	}

