package com.pbl3.filter;
import java.io.IOException;	
import com.pbl3.service.CouponService;
import com.pbl3.service.UserService;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = {"/admin/users/edit"})
public class UsersAdminFilter implements Filter{

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			
		}

		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
				throws IOException, ServletException {
			System.out.println("goi filter user");
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			String urlString = httpRequest.getServletPath();
			System.out.println("url: " +urlString);
			switch (urlString) {
			case "/admin/users/edit":{
				hasAccessUsers(servletRequest, servletResponse, filterChain);
				break;
			}
			}	
		} 

		 

		private void hasAccessUsers(ServletRequest servletRequest, ServletResponse servletResponse,
				FilterChain filterChain) throws IOException {
			HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
			HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
			try {
				int userID = Integer.parseInt(httpRequest.getParameter("userID"));
				if (!hasAccessUsers(userID)) {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
					return;  
				}
				filterChain.doFilter(servletRequest, servletResponse);
			} catch (Exception e) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error");
				return;  
			}
		}

		private boolean hasAccessUsers(int userID) {
			return UserService.getUserByID(userID).getUserID() == userID;
		}

		@Override
		public void destroy() {
		}
	}

